#| **********************************************************
  SH��֤Ǿ夬�äƤ��륵���Ф����������������̿����������뤿��Υ��饹���

  robot-server����֤Ǥ����äƤ���Ȥ����  
   (connect-robot-server :host host)
    ��������host�ˤ� "192.168.xx.y" �Τ褦�����IP��""�Ǥ����ä���Τ򤤤�뤳��
    robot-server���������ؤΥ��󥹥��� *rs* ���Ǥ��ޤ�
    (setq hoge (connect-robot-server)) �Τ褦�˹������ѿ��˥Х���ɤ��Ƥ⤤���Ǥ�

  vision-server����֤Ǥ����äƤ���ʤ�
   (connect-vision-server :host host)
   �ǤĤʤ����ơ�vision-server���������ؤΥ��󥹥��� *vs* ���Ǥ��ޤ�.

  ���줾�졢���ޥ�ɤ������̿�᤬���줿�ꡢ���󥵥ǡ����������̾����������뤳�Ȥ��Ǥ��ޤ�

  <robot-server�ξ��>
   ��֤ؤλ���
   1.��������⡼�ɤ��ѹ� wheel-controlmode-vector
      PWM����:0, ®������:1, Ĺ������: 2, ����OFF:-1
      ���줾��μ��ؤ�����⡼�ɤ��ѹ�����. ���̤�®�����椷���Ȥ�ʤ�����
    (send *rs* :wheel-controlmode-vector #f(1 1 1))
   2.������ɸ���٤��ѹ� wheel-angle-vector
      ��ɸ���٤����롧���ؤ���������ξ�硢���ꤷ���̤������ؤ���ž����
    (send *rs* :wheel-angle-vector #f(100 0 0))
   3.������ɸ®�٤��ѹ� wheel-velocity-vector
      ��ɸ®�٤����롧���ؤ�®������ξ�硢���ꤷ��®�٤Ǽ��ؤ���ž���ĤŤ���
    (send *rs* :wheel-velocity-vector #f(200 200 0))
   4.�������(servo-off����, encoder=0, �Ƽ���ɸ��0)���᤹ wheel-reset
      ˽�������Ȥ��ʤɡ����Υ��ޥ�ɤ�����Х��ȥåפ���.
      �ץ�����ब���ä��顢�Ȥꤢ�������Υ��ޥ�ɤ����äƤ����а¿�
    (send *rs* :wheel-reset)
   5.��֤���ɸxy®�١���ɸ��®��[deg]/sec��Ϳ���� daisya-velocity-vector
      Ϳ����vector�γ����Ǥ���ˡ���ɸx®�١���ɸy®�١���ɸ��®�� �Ȥʤ�
      ���ؤ����椹��Τ����ݤʤΤǡ��ºݤϤ���������楳�ޥ�ɤ�Ȥ����Ȥ��ۤȤ�ɤ�����
    (send *rs* :daisya-velocity-vector #f(200 0 200))
   �Ӥؤλ���
   1.�Ӥ�servo�������ONOFF arm-poweron-vector
    1:ON, 0:OFF�ʾ��֤ǡ����Ĥ�servo���줾��������ONOFF�Ǥ���
    �ץ�����ब��λ�����顢�����Ƥ�ǤȤꤢ��������OFF�ˤ��Ƥ����Τ��¿�
    (send *rs* :arm-poweron-vector #f(0 0 0 0 0))
   2.��servo������������ѹ����� arm-interpolation-method
     ������� 1, �䤯�ɺǾ���� 2, �ȤʤäƤ���Τǹ������������ؤ��Ƥ�������
     default���������
    (send *rs* :arm-interpolation-method 1)
   3.�Ӥ���ɸ���ٻ�������� arm-angle-vector
     ��������vector�ǣ��Ĥ��줾���servo����ɸ����[deg]��ɽ��
     ������������ܻ��֤�[msec]��Ϳ����
    (send *rs* :arm-angle-vector #f(20 10 20 0 0) 1000)
   ���󥵾���μ���
   1.bumper��ONOFF�����μ��� bumper-vector
    6�Ĥ���bumper��ONOFF���֤������ä���롣
    1����ON�ǡ�0����OFF�Ȥʤ�
    (send *rs* :bumper-vector)
   2.��Υ�����ͤμ��� psd-vector
    3�Ĥ���psd���󥵤��ͤ������äƤ���
      ��������psd���󥵤Ϥ����餯��Ĥ���֤λ��;��ɤ�ʤ������ˤ��ʤ�
    (send *rs* :psd-vector)

  <vision-server�ξ��>
   1.������̤μ��� result
    robot-programming/server/vision-server/vision-server.c
   �� interpreter�ؿ��������������ͤη�̤������ä���롣
   �齬������֤Ǥϡ������餯�ֿ���Ф�����̤νſ���ɸ�������äƤ���
    (send *vs* :result)
   �Ȥ���ȡ�
    ((:centroid #f(100 200))) 
   �Τ褦�ʥǡ����������ä����Ϥ��Ǥ��롣
   �Ƽ���Ŭ��vision-server��λ��ͤ��Ѥ��ơ������ʥǡ�����ȤäƤ��ƤߤƤ���������

   ���Ȥ��С����Ѥ�׻��Ǥ���褦�ˤ��ơ�
    ((:centroid #f(100 200)) (:menseki 200))
   �Τ褦�ʷ�̤������ä����褦�ˤʤäƤ���С���ư�ץ�����������������ޤ���͡�

****************************************************************|#
(defvar *rs* nil) ;;robot server��ά��
(defvar *vs* nil) ;;vision server��ά��

;;wheel������⡼��(ͽ���ֹ�)
(defvar *PWM_CONTROL* 0)
(defvar *VELOCITY_CONTROL* 1)
(defvar *ANGLE_CONTROL* 2)
;;servo���������(ͽ���ֹ�)
(defvar *INTERPOLATE_FINISH* 0)
(defvar *INTERPOLATE_LINEAR* 1)
(defvar *INTERPOLATE_MINJERK* 2)

(setq *robot-port* 5000)
(setq *vision-port* 9000)
(setq *hostname* "192.168.x.yy")  ;;shlinux�ޥ����IP
(warn "(connect-robot-server)~%")
(warn "(connect-vision-server)~%")
;;
;;��³�Ѥδؿ�
(defun connect-robot-server
  (&key (host *hostname*) (port *robot-port*))
  (setq *rs* (instance robot-client :init host port)))
(defun connect-vision-server
  (&key (host *hostname*) (port *vision-port*))
  (setq *vs* (instance vision-client :init host port)))

;;socket�Υ��饤����Ȥˤʤ���ܥ��饹
(defclass socket-client
  :super propertied-object
  :slots
  (socket-strm))
(defmethod socket-client
  (:init 
   (host port)
   (setq socket-strm (connect-server-until-success host port))
   self)
  ;;command������
  (:command
   (command 
    &key (returnval nil) ;;���ͤ��ԤĤ��ɤ���
    )
   (finish-output socket-strm) ;;�ǽ�����ˤ��롩
   (format socket-strm "~a~%" command)
   ;;(print command)
   (finish-output socket-strm)
   ;;
   (when returnval
     (when (select-stream (list socket-strm) 5)
       (read socket-strm))))
  ;;close ����Ѱդ������ɻȤ�ʤ���
  (:close
   ()
   (when (streamp socket-strm)
     (close socket-strm)))
  )

;;vision-server�Υ��饤����Ȥˤʤ륯�饹
(defclass vision-client
  :super socket-client
  :slots
  (result))
(defmethod vision-client
  (:init
   (host port)
   (setq socket-strm (connect-server-until-success host port))
   self)
  ;;����������̤��������
  (:result () (setq result (send self :command "result" :returnval t)))
  )

;;robot-server�Υ��饤����Ȥˤʤ륯�饹
(defclass robot-client
  :super socket-client
  :slots
  (robotstate))
(defmethod robot-client
  (:init 
   (host port)
   (setq socket-strm (connect-server-until-success host port))
   self)
  ;;
  ;;API�᥽�åɤ����
  ;;
  ;; wheel
  ;; 
  ;;��������⡼�ɤ��ѹ� wheel-controlmode-vector
  ;;  PWM����:0, ®������:1, Ĺ������: 2, ����OFF:-1
  ;; Ex. (send *rs* :wheel-controlmode-vector #f(1 1 1)) 
  (:wheel-controlmode-vector
   (ctrl-vector)
   (let ((com "wheel-controlmode-vector"))
     (mapcar #'(lambda (x) 
                 (setq com (concatenate string com " " (string x))))
             (coerce ctrl-vector cons))
     (send self :command com)
     ))
  ;;
  ;;������ɸ���٤��ѹ� wheel-angle-vector
  ;; Ex. (send *rs* :wheel-angle-vector #f(100 0 0) 1000)
  ;; �ǽ��#f(. . .)�ϳƼ��ؤ���ɸ����, 1000�����ܻ���[msec]
  (:wheel-angle-vector
   (angle-vector &optional (time 1000))
   (let ((com "wheel-angle-vector"))
     (mapcar #'(lambda (x) 
                 (setq com (concatenate string com " " (string x))))
             (coerce angle-vector cons))
     (setq com (concatenate string com (format nil " ~a" time)))
     (send self :command com)
     ))
  ;;
  (:wheel-velocity-vector
   (vel-vector)
   (let ((com "wheel-velocity-vector"))
     (mapcar #'(lambda (x) 
                 (setq com (concatenate string com " " (string x))))
             (coerce vel-vector cons))
     (send self :command com)
     ))
  ;;
  ;;�������(servo-off����, encoder=0, �Ƽ���ɸ��0)���᤹
  (:wheel-reset () (send self :command "wheel-reset"))
  ;;
  ;;��֤���ɸxy®�١���ɸ��®��[deg]/sec��Ϳ����
  (:daisya-velocity-vector 
   (daisyavel-vector)
   (let ((com "daisya-velocity-vector"))
     (mapcar #'(lambda (x) 
                 (setq com (concatenate string com " " (string x))))
             (coerce daisyavel-vector cons))
     (send self :command com)
     ))
  ;;
  ;; arm(servo)
  ;;
  ;;(send *rs* :arm-poweron-vector #f(0 0 0 0 0))��OFF
  ;;(send *rs* :arm-poweron-vector #f(1 1 1 1 1))��ON
  (:arm-poweron-vector
   (armpon-vector)
   (let ((com "servo-poweron-vector"))
     (mapcar #'(lambda (x) 
                 (setq com (concatenate string com " " (string x))))
             (coerce armpon-vector cons))
     (send self :command com)))
  (:arm-interpolation-method
   (im)
   (send self :command
         (format nil "servo-interpolation-method ~a" im)))
  (:arm-angle-vector
   (angle-vector &optional (time 1000))
   (let ((com "servo-angle-vector"))
     (mapcar #'(lambda (x)
                 (setq com (concatenate string com " " (string x))))
             (coerce angle-vector cons))
     (setq com (concatenate string com (format nil " ~a" time)))
     (send self :command com)
     ))
  ;;
  ;; robotstate�μ��� (����ӳƼ糧�󥵤�accessor)
  (:get-robot-state nil
   (setq robotstate (send self :command "get-robot-state" :returnval t)))
  (:get-robot-state-by-name  ;;name�ǻ��ꤷ���ǡ�������֤�
   (name)
   (let (vallist ret)
     (send self :get-robot-state)
     (setq vallist (assoc name robotstate))
     (setq ret (instantiate float-vector (second vallist)))
     (dotimes (i (length ret))
       (setf (aref ret i) (elt vallist (+ i 2))))
     ret
     ))
  (:get-wheels-angle () (send self :get-robot-state-by-name 'wheels-angle))
  (:get-wheels-controlmode () (send self :get-robot-state-by-name 'wheels-control-mode))
  (:bumper-vector () (send self :get-robot-state-by-name 'bumper-onoff))
  (:psd-vector () (send self :get-robot-state-by-name 'psd-data))
  ;;
  (:wheel-velocity-pgain-vector
   (&optional wvp-vec)
   (let (com)
     (cond
      (wvp-vec
       (setq com "set-wheel-velocity-pgain-vector")
       (mapcar #'(lambda (x) 
                   (setq com (concatenate string com " " (string x))))
               (coerce wvp-vec cons))
       (send self :command com)
       wvp-vec)
      (t
       (setq com "get-wheel-velocity-pgain-vector")
       (send self :command com :returnval t))
      )))
  (:wheel-velocity-dgain-vector
   (&optional wvd-vec)
   (let (com)
     (cond
      (wvd-vec
       (setq com "set-wheel-velocity-dgain-vector")
       (mapcar #'(lambda (x) 
                   (setq com (concatenate string com " " (string x))))
               (coerce wvd-vec cons))
       (send self :command com)
       wvd-vec)
      (t
       (setq com "get-wheel-velocity-dgain-vector")
       (send self :command com :returnval t))
      )))
  (:wheel-velocity-igain-vector
   (&optional wvi-vec)
   (let (com)
     (cond
      (wvi-vec
       (setq com "set-wheel-velocity-igain-vector")
       (mapcar #'(lambda (x) 
                   (setq com (concatenate string com " " (string x))))
               (coerce wvi-vec cons))
       (send self :command com)
       wvi-vec)
      (t
       (setq com "get-wheel-velocity-igain-vector")
       (send self :command com :returnval t))
      )))

  ;;��������Τ����gain(���ޤ�Ȥ�ʤ�����)
  (:wheel-angle-pgain-vector
   (&optional wap-vec)
   (let (com)
     (cond
      (wap-vec
       (setq com "set-wheel-angle-pgain-vector")
       (mapcar #'(lambda (x) 
                   (setq com (concatenate string com " " (string x))))
               (coerce wap-vec cons))
       (send self :command com)
       wap-vec)
      (t
       (setq com "get-wheel-angle-pgain-vector")
       (send self :command com :returnval t))
      )))
  (:wheel-angle-dgain-vector
   (&optional wad-vec)
   (let (com)
     (cond
      (wad-vec
       (setq com "set-wheel-angle-dgain-vector")
       (mapcar #'(lambda (x) 
                   (setq com (concatenate string com " " (string x))))
               (coerce wad-vec cons))
       (send self :command com)
       wad-vec)
      (t
       (setq com "get-wheel-angle-dgain-vector")
       (send self :command com :returnval t))
      )))
  (:wheel-angle-igain-vector
   (&optional wai-vec)
   (let (com)
     (cond
      (wai-vec
       (setq com "set-wheel-angle-igain-vector")
       (mapcar #'(lambda (x) 
                   (setq com (concatenate string com " " (string x))))
               (coerce wai-vec cons))
       (send self :command com)
       wai-vec)
      (t
       (setq com "get-wheel-angle-igain-vector")
       (send self :command com :returnval t))
      )))
  ;;
  ;; ��֤ΰ����������Υ᥽�å� 
  ;;
  ;; ������ѹ� 1:velocity, 2:angle(position)
  ;;
  ;;   default��®������ǡ�daisya-velocity-vector�����椹�뤱��
  ;;   ��������(����)����ˤ���ȡ�daisya-position-vector������Ǥ���
  (:daisya-controlmode
   (ctrlmode)
   (let ((com "daisya-controlmode"))
     (setq com (concatenate string com " " (string ctrlmode)))
     (send self :command com)
     ctrlmode))
  ;;
  ;; ��֤ΰ�������
  ;;   �����ʤ����ȡ����ߤ�x��y, theta[deg]������
  ;;   ��������(vector + time)���ȡ����ꤷ�����֤Ǥ��ΰ��֤ޤ�ư��
  ;;   ���֤�ñ�̤�[msec]
  (:daisya-position-vector
   (&optional pos-vec (time 1000))
   (let (com)
     (cond
      (pos-vec
       (setf (aref pos-vec 2) (deg2rad (aref pos-vec 2))) ;;radɽ�����ѹ�
       (setq com "set-daisya-position-vector")
       (mapcar #'(lambda (x) 
                   (setq com (concatenate string com " " (string x))))
               (coerce pos-vec cons))
       (setq com (concatenate string com " " (string time)))
       (send self :command com)
       pos-vec)
      (t
       (setq com "get-daisya-position-vector")
       (setq pos-vec (send self :command com :returnval t))
       (setf (aref pos-vec 2) (rad2deg (aref pos-vec 2))) ;;degɽ�����ѹ�
       pos-vec
       ))))
  ;;
  ;; ��ְ��������gain
  ;;   �����ʤ����ȡ����ߤ�x,y,theta���줾���pgain
  ;;   ��������(vector)���ȡ����Τ褦�˥��åȤ����
  (:daisya-position-pgain-vector
   (&optional p-vec)
   (let (com)
     (cond
      (p-vec
       (setq com "set-daisya-position-pgain-vector")
       (mapcar #'(lambda (x) 
                   (setq com (concatenate string com " " (string x))))
               (coerce p-vec cons))
       (send self :command com)
       p-vec)
      (t
       (setq com "get-daisya-position-pgain-vector")
       (send self :command com :returnval t)))))
  ;;
  ;; ��ְ�������Ƽ�ѥ�᥿��reset
  ;;  (���߰�����������0�ˤ��Ƥ��ʤ�������)
  (:daisya-reset
   ()
   (send self :command "daisya-reset"))
  )
;;
;; socket�̿��Ѥδؿ� (from jsk.l)
(defun connect-server-until-success (host port)
  (let (s max-port)
    (setq max-port (+ port 20))
    (while (and (not (streamp (setq s (connect-server host port))))
		(< port max-port))
      (incf port))
    (cond ((< port max-port)
	   (warn ";;; Connected server: Port ~a~%" port)
	   s)
	  (t
	   (warn "Can't connect server.~%")
	   nil))
    ))