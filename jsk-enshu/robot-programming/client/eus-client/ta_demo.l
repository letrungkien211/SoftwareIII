(load "robot-client.l")
#|
 C言語で記述した関数の共有オブジェクトを指定
|#
;;(setq *enshu-dir* (format nil "~a/prog/robot-programming" (unix:getenv "HOME")))
(setq *enshu-dir* (format nil "~a/prog/jsk-enshu/robot-programming" (unix:getenv "HOME")))
(unless (boundp '*vision-so*)
  (setq *vision-so* (load-foreign (format nil "~A/client/vision-viewer/visionlib.so" *enshu-dir*))))

#|
 C言語で記述した関数をEuslisp側で呼び出せるように設定
 (多言語インタフェース)
|#
(defforeign init-cap
  *vision-so* "init_vision" (:string :integer) :integer)
(defforeign proc-vision
  *vision-so* "proc_vision" () :integer)
(defforeign proc-jpg-vision
  *vision-so* "proc_jpg_vision" () :integer)
(defforeign get-vision
  *vision-so* "get_vision" (:string) :integer)
(defforeign quit-vision
  *vision-so* "quit_vision" () :integer)
(defforeign init-facedetect
  *vision-so* "init_facedetect" () :integer)
(defforeign face-pos
  *vision-so* "detect_and_draw" () :integer)

#|
 画像処理のサンプル
|#
(warn "(test-eus-vision)~%")

(defun ta_demo ()
  (when (not *rs-sim*) (connect-robotsim-server))
  (send *rs-sim* :daisya-controlmode 2) ;;位置制御 
  ;;  (&key (jpg nil))
  ;;OpenCVのための初期処理を呼び出し,ソケット通信の確立 (visionlib.cでのinit_vision)
  (init-cap *hostname* 9000)

  (setq count 0)

  ;;顔認識に必要なデータをロード (visionlib.cでのinit_facedetect9
  (init-facedetect)

  ;;ループ処理(Enterを押すまで続く)
  (do-until-key
   ;;ソケット通信からの画像取得，画像の表示 (visionlib.cでのproc_vision)
   ;; if using jpgvision-server, proc-jpg-vision
   ;; if using vision-server, proc-vision
   (if (= (mod count 2) 0)
       (send *rs-sim* :arm-angle-vector #f(-30 30 0 0 0 ) 2000)
     (send *rs-sim* :arm-angle-vecgtor #f(30 30 0 0 0) 2000))
   (unix::system "splay \"*.mp3\"")
;;    (if jpg
;;        (proc-jpg-vision)
;;      (proc-vision)
;;      )
   ;;顔認識処理の実行 (visionlib.cでの detect_and_draw)
   (setq result (face-pos))

   ;;顔認識結果(水平座標）の表示
   (format t "pos=~A~%" result)
   (cond ((< (car (cadr (assoc ':center result)))320)
          (send *rs-sim* :daisya-position-vector (float-vector 0 0 30) 1000))
         (t
          (send *rs-sim* :daisya-velocity-vector (float-vector 0 0 -30) 1000)))
   (unix:sleep 1)
   (send *rs-sim* :daisya-position-vector (float-vector 50 0 0) 1000)
   (unix:sleep 1)
   (incf count)
   )
  ;;10[msec]休む
  ;; (unix:usleep (* 10 1000))
  ;; )

  (send *rs-sim* :daisya-controlmode 1)
  (send *rs-sim* :daisya-velocity-vector #f(0 0 0))
  )

(defun ta_demo ()
  (when (not *rs-sim*) (connect-robotsim-server))
  (send *rs-sim* :daisya-controlmode 2) ;;位置制御 
  ;;  (&key (jpg nil))
  ;;OpenCVのための初期処理を呼び出し,ソケット通信の確立 (visionlib.cでのinit_vision)
  (init-cap *hostname* 9000)

  (setq count 0)

  ;;顔認識に必要なデータをロード (visionlib.cでのinit_facedetect9
  (init-facedetect)

  ;;ループ処理(Enterを押すまで続く)
  (do-until-key
   ;;ソケット通信からの画像取得，画像の表示 (visionlib.cでのproc_vision)
   ;; if using jpgvision-server, proc-jpg-vision
   ;; if using vision-server, proc-vision
   (if (= (mod count 2) 0)
       (send *rs-sim* :arm-angle-vector #f(-30 30 0 0 0 ) 2000)
     (send *rs-sim* :arm-angle-vecgtor #f(30 30 0 0 0) 2000))
   (unix::system "splay \"*.mp3\"")
   ;;    (if jpg
;;        (proc-jpg-vision)
;;      (proc-vision)
;;      )
   ;;顔認識処理の実行 (visionlib.cでの detect_and_draw)
   (setq result (face-pos))

   ;;顔認識結果(水平座標）の表示
   (format t "pos=~A~%" result)
   (cond ((< (elt result 0) 320)
          (send *rs-sim* :daisya-position-vector (float-vector 0 0 30) 1000))
         (t
          (send *rs-sim* :daisya-velocity-vector (float-vector 0 0 -30) 1000)))
   (unix:sleep 1)
   (send *rs-sim* :daisya-position-vector (float-vector 50 0 0) 1000)
   (unix:sleep 1)
   (incf count)
   )
  ;;10[msec]休む
  ;; (unix:usleep (* 10 1000))
  ;; )

  (send *rs-sim* :daisya-controlmode 1)
  (send *rs-sim* :daisya-velocity-vector #f(0 0 0))
  ;;OpenCVまわりのインスタンスの解放（終了処理）
  (quit-vision)
  )
