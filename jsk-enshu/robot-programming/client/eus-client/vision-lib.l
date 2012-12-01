(load "robot-client.l")
#|
 C言語で記述した関数の共有オブジェクトを指定
|#
(setq *enshu-dir* (format nil "~a/work/jsk-enshu/robot-programming" (unix:getenv "HOME")))
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

(defun test-eus-vision 
  (&key (jpg nil))
  ;;OpenCVのための初期処理を呼び出し,ソケット通信の確立 (visionlib.cでのinit_vision)
  (init-cap *hostname* 9000)

  ;;顔認識に必要なデータをロード (visionlib.cでのinit_facedetect9
  (init-facedetect)

  ;;ループ処理(Enterを押すまで続く)
  (do-until-key
   ;;ソケット通信からの画像取得，画像の表示 (visionlib.cでのproc_vision)
   ;; if using jpgvision-server, proc-jpg-vision
   ;; if using vision-server, proc-vision
   (if jpg
       (proc-jpg-vision)
     (proc-vision)
     )
   ;;顔認識処理の実行 (visionlib.cでの detect_and_draw)
   (setq result (face-pos))

   ;;顔認識結果(水平座標）の表示
   (format t "facepos=~A~%" result)

   ;;10[msec]休む
   (unix:usleep (* 10 1000))
   )

  ;;OpenCVまわりのインスタンスの解放（終了処理）
  (quit-vision)
  )



#|
下坂先生の授業でやったcog.cのサンプル.
client/vision-viewerを更新してmakeしたか確認
|#

(defforeign init-cog
  *vision-so* "init_cog" () :integer)
(defforeign cog-pos
  *vision-so* "detect_and_cog" () (:string))
(defforeign quit-cog-vision
  *vision-so* "quit_cog_vision" () :integer)

(warn "(test-eus-cog)~%")

(defun test-eus-cog ()
  (init-cap *hostname* 9000)
  (init-cog)
  (do-until-key
   (proc-vision)
   (setq result (cog-pos))
   (if (stringp result)
       (format t "cogpos=~A~%" (assoc :cog (read-from-string result))))
   (unix:usleep (* 10 1000))
   )
  (quit-cog-vision)
  )