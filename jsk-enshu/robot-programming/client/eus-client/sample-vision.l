#|**************************************************
  vision�����Ф�robot�����Ф�Ĥʤ��ǡ�
  ư����Ƥߤ���ñ����

**************************************************|#
(load "robot-client.l")

;;server�ȤĤʤ��ؿ�
(defun connect-servers
  ()
  (connect-robot-server)
  (connect-vision-server))

(warn "(demo)~%")
(defun demo
  (&optional (time 500))
  (let (result (width 640.0) angle)
    ;;robot-server��vision-server�ȤĤʤ��äƤʤ��ä���Ĥʤ�
    (when (or (not *rs*) (not *vs*)) (connect-servers))
    ;;
    ;;�Ӥ�servo�򤤤�� �����ΤǤҤȤĤμ�����)
    (send *rs* :arm-poweron-vector #f(1 0 0 0 0))

    ;;key�򲡤����ޤ�³����
    (do-until-key
      (setq result (cadr (assoc :centroid (send *vs* :result))))
      (print result)
      ;;condition
      (cond
       (result  ;;if result exists(= if red area is detected)
	;;�ſ��ΰ��֤˱������Ӥ�ư����
	(setq angle (* 40 (/ (- (aref result 0) (* 0.5 width)) (* 0.5 width))))
	(print angle)
	;;�Ӥ˻��������
	(send *rs* :arm-angle-vector (float-vector angle 0 0 0 0) time)
	;;���ܻ��֤δ��Ԥ�
	(unix:usleep (* time 1000)))
       (t  ;; if result does not exist
	;; wait 100[msec]
	(print "no red area")
	(unix:usleep (* 100 1000)))
	)
      )
    ;;�Ǹ��arm��servo�򤭤�
    (send *rs* :arm-poweron-vector #f(0 0 0 0 0))
    ))
   