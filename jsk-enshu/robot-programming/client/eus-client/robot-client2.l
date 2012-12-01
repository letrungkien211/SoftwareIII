#| **********************************************************
 robot-client2.l
  robot-client.lに対してvisionサーバ周りの機能を追加したもの
  vision-server2.cのように、いろの閾値が設定できるようになったサーバに対し
  新たに、color-thresholdというコマンドを送るmethod
 
   :color-thresholdを定義

****************************************************************|#
(load "robot-client.l")

;; 
;; ブロックの色閾値の例
(defvar *blue-threshold* #f(0.0 200.0 0.0 200.0 200.0 255.0))
(defvar *red-threshold* #f(200.0 255.0 0.0 200.0 0.0 200.0))
(defvar *green-threshold* #f(0.0 200.0 200.0 255.0 200.0 250.0))

;;vision-clientにメソッドを追加
(defmethod vision-client
  ;;閾値を変更する 与える閾値は６個のベクトル
  ;; #f(Red_min Red_max Green_min Green_max Blue_min Blue_Max)である
  ;; 引数を与えなければ現在のthresholdの値を返す
  (:color-threshold 
   (&optional cthre-vector)
   (let (com)
     (cond
      ;;引数があったら
      (cthre-vector 
       (setq com "color-threshold")
       (mapcar #'(lambda (x) 
                   (setq com (concatenate string com " " (string x))))
               (coerce cthre-vector cons))
       (send self :command com)
       cthre-vector)
      ;;引数がなかったら
      (t
       (setq com "get-color-threshold")
       (send self :command com :returnval t))
      )))
  ;;
  ;; Labelingサーバの場合、labelingする個数を指定できる
  ;;  引数がなければ現在セットされている値を返す
  (:displaylabel-num
   (&optional dpn)
   (let (com)
     (cond
      ;;引数があったら
      (dpn
       (setq com (format nil "set-displaylabel-num ~a" dpn))
       (send self :command com)
       dpn)
      ;;引数がなかったら
      (t
       (setq com "get-displaylabel-num")
       (send self :command com :returnval t))
      )))
  ;; Labelingサーバの場合、labelingサイズの最小面積を指定できる
  ;;  引数がなければ現在セットされている値を返す
  (:minimum-area-size
   (&optional mas)
   (let (com)
     (cond
      ;;引数があったら
      (mas
       (setq com (format nil "set-minarea ~a" mas))
       (send self :command com)
       mas)
      ;;引数がなかったら
      (t
       (setq com "get-minarea")
       (send self :command com :returnval t))
      )))
  )

