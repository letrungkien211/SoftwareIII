(defun l nil
  (load "120291/1128.l"))
(warn "mydemo: Pick and place task!~%")
(defun mydemo
  (&optional (time 200))
  (let ((bmp-vec) (psd-vector)
        (red-centroid))
    ;;robot-server(simulator)¤È¤Ä¤Ê¤°
    (when (not *rs-sim*) (connect-robotsim-server))
    (when (not *vs-sim*) (connect-visionsim-server))
    ;;
    ;;ÏÓ¤Îservo¤ò¤¤¤ì¤ë
    (send *rs-sim* :arm-poweron-vector #f(1 1 1 1 1))
    ;;¤¿¤á¤·¤ËÏÓ¤òÆ°¤«¤·¤Æ¤ß¤ë
    (send *rs-sim* :arm-angle-vector #f(80 -20 -70 0 0) 1000)
    (unix:usleep (* 1000 1000))
    
    ;;¤È¤ê¤¢¤¨¤ºÁö¤ê¤Ï¤¸¤á¤ë
    (send *rs-sim* :daisya-velocity-vector #f(100 0 0))
    ;;key¤ò²¡¤µ¤ì¤ë¤Þ¤ÇÂ³¤±¤ë
    (do-until-key
      (setq bmp-vec (send *rs-sim* :bumper-vector))
      (setq psd-vec (send *rs-sim* :psd-vector))
      (setq red-centroid (send *vs-sim* :result))
      (if red-centroid
          (setq red-centroid (cadr (assoc :centroid red-centroid))))
      (format t ";; bmp ~A, psd ~A, red ~A~%" bmp-vec psd-vec red-centroid)
      (cond
       ;;¸å¤¬¤Ö¤Ä¤«¤Ã¤¿¤é
       ((or (= (aref bmp-vec 2) 1) (= (aref bmp-vec 3) 1))
	(send *rs-sim* :daisya-velocity-vector #f(200 0 90))
	(warn "!!forward~%")
        (unix:usleep (* 300 1000))
	)
       ;;Á°¤¬¤Ö¤Ä¤«¤Ã¤¿¤é
       ((= (aref bmp-vec 0) 1)
	(send *rs-sim* :daisya-velocity-vector #f(-200 0 -90))
	(warn "!!backward (+ front right)~%")
        (unix:usleep (* 300 1000))
	)
       ((= (aref bmp-vec 5) 1)
	(send *rs-sim* :daisya-velocity-vector #f(-200 0 90))
	(warn "!!backward (+ front left)~%")
        (unix:usleep (* 300 1000))
	)
       ;;º¸¤Ë²£¤¬¤Ö¤Ä¤«¤Ã¤¿¤é
       ((= (aref bmp-vec 1) 1)
        (send *rs-sim* :daisya-velocity-vector #f(0 -100 -30))
        (warn "!!move right~%")
        (unix:usleep (* 300 1000))
        )
       ;;º¸¤ËÊÉ¤¬¶á¤Å¤¤¤Æ¤­¤¿¤é
       ((< 10 (aref psd-vec 2) 100)
        (send *rs-sim* :daisya-velocity-vector #f(50 -50 -30))
        (warn "!!move+turn right~%")
        )
       ;;±¦¤Ë²£¤¬¤Ö¤Ä¤«¤Ã¤¿¤é
       ((or (= (aref bmp-vec 4) 1) (< 10 (aref psd-vec 0) 100))
        (send *rs-sim* :daisya-velocity-vector #f(0 100 30))
        (warn "!!move left~%")
        (unix:usleep (* 300 1000))
        )
       ;;±¦¤ËÊÉ¤¬¶á¤Å¤¤¤Æ¤­¤¿¤é
       ((< 10 (aref psd-vec 0) 100)
        (send *rs-sim* :daisya-velocity-vector #f(50 50 30))
        (warn "!!move+turn left~%"))
       ;;
       ;;Á°¤ËÊÉ¤¬¶á¤Å¤¤¤Æ¤­¤¿¤é
       ((< 50 (aref psd-vec 1) 100)
        (send *rs-sim* :daisya-velocity-vector (float-vector 100 (random 20) 0))
        (warn "!!slow down~%")
        )
       ;; red-centroid¤Ë±þ¤¸¤ÆÄÉ½¾¹ÔÆ°¤ò¤È¤ë
       ((and red-centroid (> (aref red-centroid 0) 170))
        (send *rs-sim* :daisya-velocity-vector (float-vector 150 0 -10))
        (if (< 10 (aref psd-vec 1) 50) (move-arm #f(100 100 0) 500))
        (warn "!!turn left VISION~%")
        )
       ((and red-centroid (< (aref red-centroid 0) 150))
        (send *rs-sim* :daisya-velocity-vector (float-vector 150 -0 10))
        (if (< 10 (aref psd-vec 1) 50) (move-arm #f(100 -100 0) 500))
        (warn "!!turn right VISION~%"))
       ;; ¤Ê¤Ë¤â¤Ê¤¤¤È¤­
       (t
        (send *rs-sim* :daisya-velocity-vector (float-vector 200 (random 100) (random 30))))
       )
      (unix:usleep (* time 1000))
      )
    ;;Âæ¼Ö¤ò»ß¤á¤ë
    (send *rs-sim* :wheel-reset)
    ;;ÏÓ¤Ë»ØÎá¤òÁ÷¤ë
    (send *rs-sim* :arm-angle-vector (float-vector 0 0 0 0 0) 3000)
    (unix:usleep (* 1000 3000))
    ;;ºÇ¸å¤Ëarm¤Îservo¤ò¤­¤ë
    (send *rs-sim* :arm-poweron-vector #f(0 0 0 0 0))
    )
  )

(defun myinit ()
  (setq *obstacle* (make-cube 100 100 200))
  (send *obstacle* :locate #f(-550 0 100))

  (setq *target* (make-cube 100 100 200))
  (send *target* :locate #f(550 0 100))


  (setq objects (list *obstacle*
		      *target*))
  (send-all objects :set-color :lightslateblue)
  (send *obstacle1* :set-color :blue)
  (send *obstacle2* :set-color :green)
  (send *target* :set-color :red)
  (setq init-coords (make-coords))
  (start-robotsim-server objects :init-coords init-coords))

