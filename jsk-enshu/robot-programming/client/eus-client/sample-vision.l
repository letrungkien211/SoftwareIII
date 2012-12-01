#|**************************************************
  visionサーバとrobotサーバをつないで、
  動作させてみた簡単な例

**************************************************|#
(load "robot-client.l")

;;serverとつなぐ関数
(defun connect-servers
  ()
  (connect-robot-server)
  (connect-vision-server))

(warn "(demo)~%")
(defun demo
  (&optional (time 500))
  (let (result (width 640.0) angle)
    ;;robot-serverやvision-serverとつながってなかったらつなぐ
    (when (or (not *rs*) (not *vs*)) (connect-servers))
    ;;
    ;;腕のservoをいれる 恐いのでひとつの軸だけ)
    (send *rs* :arm-poweron-vector #f(1 0 0 0 0))

    ;;keyを押されるまで続ける
    (do-until-key
      (setq result (cadr (assoc :centroid (send *vs* :result))))
      (print result)
      ;;condition
      (cond
       (result  ;;if result exists(= if red area is detected)
	;;重心の位置に応じて腕を動かす
	(setq angle (* 40 (/ (- (aref result 0) (* 0.5 width)) (* 0.5 width))))
	(print angle)
	;;腕に指令を送る
	(send *rs* :arm-angle-vector (float-vector angle 0 0 0 0) time)
	;;遷移時間の間待つ
	(unix:usleep (* time 1000)))
       (t  ;; if result does not exist
	;; wait 100[msec]
	(print "no red area")
	(unix:usleep (* 100 1000)))
	)
      )
    ;;最後にarmのservoをきる
    (send *rs* :arm-poweron-vector #f(0 0 0 0 0))
    ))
   
