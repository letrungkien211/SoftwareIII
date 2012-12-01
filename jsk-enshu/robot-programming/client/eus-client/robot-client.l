#| **********************************************************
  SH台車で上がっているサーバから情報を取得したり命令を送信するためのクラス定義

  robot-serverが台車であがっているとすると  
   (connect-robot-server :host host)
    ただし、hostには "192.168.xx.y" のような台車IPを""でくくったものをいれること
    robot-serverアクセスへのインスタンス *rs* ができます
    (setq hoge (connect-robot-server)) のように好きな変数にバインドしてもいいです

  vision-serverが台車であがっているなら
   (connect-vision-server :host host)
   でつなげられて、vision-serverアクセスへのインスタンス *vs* ができます.

  それぞれ、コマンドを送ると命令が送れたり、センサデータや処理結果情報を取得することができます

  <robot-serverの場合>
   台車への指令
   1.車輪制御モードの変更 wheel-controlmode-vector
      PWM制御:0, 速度制御:1, 長さ制御: 2, 制御OFF:-1
      それぞれの車輪の制御モードを変更する. 普通は速度制御しか使わないかな
    (send *rs* :wheel-controlmode-vector #f(1 1 1))
   2.車輪目標角度の変更 wheel-angle-vector
      目標角度を送る：車輪が角度制御の場合、指定した量だけ車輪が回転する
    (send *rs* :wheel-angle-vector #f(100 0 0))
   3.車輪目標速度の変更 wheel-velocity-vector
      目標速度を送る：車輪が速度制御の場合、指定した速度で車輪が回転しつづける
    (send *rs* :wheel-velocity-vector #f(200 200 0))
   4.初期状態(servo-off状態, encoder=0, 各種目標値0)に戻す wheel-reset
      暴走したときなど、このコマンドを送ればストップする.
      プログラムが終ったら、とりあえずこのコマンドを送っておけば安心
    (send *rs* :wheel-reset)
   5.台車に目標xy速度、目標角速度[deg]/secを与える daisya-velocity-vector
      与えるvectorの各要素が順に、目標x速度、目標y速度、目標角速度 となる
      車輪を制御するのは面倒なので、実際はこの台車制御コマンドを使うことがほとんどだろう
    (send *rs* :daisya-velocity-vector #f(200 0 200))
   腕への指令
   1.腕のservoの制御のONOFF arm-poweron-vector
    1:ON, 0:OFFな状態で、５個のservoそれぞれの制御をONOFFできる
    プログラムが終了したら、これを呼んでとりあえず全てOFFにしておくのが安心
    (send *rs* :arm-poweron-vector #f(0 0 0 0 0))
   2.腕servoの補間方式を変更する arm-interpolation-method
     線形補間 1, やくど最小補間 2, となっているので好きな方に切替えてください
     defaultは線形補間
    (send *rs* :arm-interpolation-method 1)
   3.腕の目標角度指令を送る arm-angle-vector
     第一引数はvectorで５個それぞれのservoの目標角度[deg]を表す
     第二引数は遷移時間で[msec]で与える
    (send *rs* :arm-angle-vector #f(20 10 20 0 0) 1000)
   センサ情報の取得
   1.bumperのONOFF状況の取得 bumper-vector
    6つあるbumperのONOFF状態がかえって来る。
    1だとONで、0だとOFFとなる
    (send *rs* :bumper-vector)
   2.距離センサ値の取得 psd-vector
    3つあるpsdセンサの値がかえってくる
      ただし、psdセンサはおそらく一つは台車の仕様上読めないが気にしない
    (send *rs* :psd-vector)

  <vision-serverの場合>
   1.処理結果の取得 result
    robot-programming/server/vision-server/vision-server.c
   の interpreter関数内で定義した仕様の結果がかえって来る。
   演習初期状態では、おそらく赤色抽出した結果の重心座標がかえってくる
    (send *vs* :result)
   とすると、
    ((:centroid #f(100 200))) 
   のようなデータがかえって来るはずである。
   各自、適宜vision-server内の仕様を変えて、好きなデータをとってきてみてください。

   たとえば、面積も計算できるようにして、
    ((:centroid #f(100 200)) (:menseki 200))
   のような結果がかえって来るようになっていれば、行動プログラムの幅が広がりますよね？

****************************************************************|#
(defvar *rs* nil) ;;robot serverの略ね
(defvar *vs* nil) ;;vision serverの略ね

;;wheelの制御モード(予約番号)
(defvar *PWM_CONTROL* 0)
(defvar *VELOCITY_CONTROL* 1)
(defvar *ANGLE_CONTROL* 2)
;;servoの補間方式(予約番号)
(defvar *INTERPOLATE_FINISH* 0)
(defvar *INTERPOLATE_LINEAR* 1)
(defvar *INTERPOLATE_MINJERK* 2)

(setq *robot-port* 5000)
(setq *vision-port* 9000)
(setq *hostname* "192.168.x.yy")  ;;shlinuxマシンのIP
(warn "(connect-robot-server)~%")
(warn "(connect-vision-server)~%")
;;
;;接続用の関数
(defun connect-robot-server
  (&key (host *hostname*) (port *robot-port*))
  (setq *rs* (instance robot-client :init host port)))
(defun connect-vision-server
  (&key (host *hostname*) (port *vision-port*))
  (setq *vs* (instance vision-client :init host port)))

;;socketのクライアントになる基本クラス
(defclass socket-client
  :super propertied-object
  :slots
  (socket-strm))
(defmethod socket-client
  (:init 
   (host port)
   (setq socket-strm (connect-server-until-success host port))
   self)
  ;;commandを送信
  (:command
   (command 
    &key (returnval nil) ;;返値を待つかどうか
    )
   (finish-output socket-strm) ;;最初に綺麗にする？
   (format socket-strm "~a~%" command)
   ;;(print command)
   (finish-output socket-strm)
   ;;
   (when returnval
     (when (select-stream (list socket-strm) 5)
       (read socket-strm))))
  ;;close 一応用意したけど使わないか
  (:close
   ()
   (when (streamp socket-strm)
     (close socket-strm)))
  )

;;vision-serverのクライアントになるクラス
(defclass vision-client
  :super socket-client
  :slots
  (result))
(defmethod vision-client
  (:init
   (host port)
   (setq socket-strm (connect-server-until-success host port))
   self)
  ;;画像処理結果を取得する
  (:result () (setq result (send self :command "result" :returnval t)))
  )

;;robot-serverのクライアントになるクラス
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
  ;;APIメソッドの定義
  ;;
  ;; wheel
  ;; 
  ;;車輪制御モードの変更 wheel-controlmode-vector
  ;;  PWM制御:0, 速度制御:1, 長さ制御: 2, 制御OFF:-1
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
  ;;車輪目標角度の変更 wheel-angle-vector
  ;; Ex. (send *rs* :wheel-angle-vector #f(100 0 0) 1000)
  ;; 最初の#f(. . .)は各車輪の目標角度, 1000は遷移時間[msec]
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
  ;;初期状態(servo-off状態, encoder=0, 各種目標値0)に戻す
  (:wheel-reset () (send self :command "wheel-reset"))
  ;;
  ;;台車に目標xy速度、目標角速度[deg]/secを与える
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
  ;;(send *rs* :arm-poweron-vector #f(0 0 0 0 0))でOFF
  ;;(send *rs* :arm-poweron-vector #f(1 1 1 1 1))でON
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
  ;; robotstateの取得 (および各種センサのaccessor)
  (:get-robot-state nil
   (setq robotstate (send self :command "get-robot-state" :returnval t)))
  (:get-robot-state-by-name  ;;nameで指定したデータ列を返す
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

  ;;位置制御のためのgain(あまり使わないかな)
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
  ;; 台車の位置制御周りのメソッド 
  ;;
  ;; 制御を変更 1:velocity, 2:angle(position)
  ;;
  ;;   defaultは速度制御で、daisya-velocity-vectorで制御するけど
  ;;   これを位置(角度)制御にすると、daisya-position-vectorで制御できる
  (:daisya-controlmode
   (ctrlmode)
   (let ((com "daisya-controlmode"))
     (setq com (concatenate string com " " (string ctrlmode)))
     (send self :command com)
     ctrlmode))
  ;;
  ;; 台車の位置制御
  ;;   引数なしだと、現在のx、y, theta[deg]が帰る
  ;;   引数あり(vector + time)だと、指定した時間でその位置まで動く
  ;;   時間の単位は[msec]
  (:daisya-position-vector
   (&optional pos-vec (time 1000))
   (let (com)
     (cond
      (pos-vec
       (setf (aref pos-vec 2) (deg2rad (aref pos-vec 2))) ;;rad表記に変更
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
       (setf (aref pos-vec 2) (rad2deg (aref pos-vec 2))) ;;deg表記に変更
       pos-vec
       ))))
  ;;
  ;; 台車位置制御のgain
  ;;   引数なしだと、現在のx,y,thetaそれぞれのpgain
  ;;   引数あり(vector)だと、そのようにセットされる
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
  ;; 台車位置制御各種パラメタのreset
  ;;  (現在位置等を全て0にしてやりなおしする)
  (:daisya-reset
   ()
   (send self :command "daisya-reset"))
  )
;;
;; socket通信用の関数 (from jsk.l)
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
