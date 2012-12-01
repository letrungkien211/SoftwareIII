;;
;; joydirect (copy from prog/hrp2/joystick)
;;
(defclass joydirect
  :super propertied-object
  :slots (joy-data state-thread)
  )
(defmethod joydirect
  (:init
   ()
   (joyInit 0)
   (joyUpdate)
   (send self :start-thread))
  (:quit
   ()
   (joyQuit))
  (:state
   ()
   (setq joy-data (joyGetState)))
  (:get-state
   ()
   (return-from :get-state joy-data))
  (:start-thread
   ()
   (need-thread 1)
   (setq state-thread (sys::thread-no-wait #'send self :state-thread)))
  (:stop-thread
   ()
   (setq state-thread nil))
  (:state-thread
   ()
   (unix:sleep 1)
   (while state-thread
     (send self :state)
     (unix:usleep (* 10 1000))))
  (:buttons
   ()
   (cdr (assoc :button joy-data)))
  (:button
   (no)
   (let (btn-data result)
     (setq btn (cdr (assoc :button joy-data)))
     (if (memq no btn) (setq result t)
       (setq result nil))
     (return-from :button result)
     ))
  (:read-data
   (name no)
   (let (data)
     (setq data (concatenate float-vector (cdr (assoc name joy-data))))
     (case 
	 no
       (0 (elt data 0))
       (1 (elt data 1))
       (t (format *error-output* "exception occured in the method ~A of joystick~%" name))
       )))
  (:arrow1
   (no)
   (send self :read-data :arrow1 no))
  (:arrow2
   (no)
   (send self :read-data :arrow2 no))
  (:pov
   (no)
   (send self :read-data :pov no))
  )

(defclass tekkidirect
  :super joydirect)
(defmethod tekkidirect
  (:state
   ()
   (setq joy-data (tekkiGetState)))
  (:sight
   (no)
   (send self :read-data :sight no))
  (:rotation
   (no)
   (send self :read-data :rotation no))
  (:aiming
   (no)
   (send self :read-data :aiming no))
  (:gear
   (no)
   (send self :read-data :gear no))
  (:pedals
   (no)
   (send self :read-data :pedals no))
  (:tuner
   (no)
   (send self :read-data :tuner no))
  )
;;
;; setup joystick
;;
(defun setup-joystick ()
  (let ()
    (setq *joy-dll* (load-foreign "joy"))
    (defforeign joyInit    *joy-dll* "joyInit" () :integer)
    (defforeign joyUpdate  *joy-dll* "joyUpdate" () :integer)    
    (defforeign joyQuit    *joy-dll* "joyQuit" () :integer)
    (defforeign joyGetXPos *joy-dll* "joyGetXPos" () :float)
    (defforeign joyGetYPos *joy-dll* "joyGetYPos" () :float)
    (defforeign joyGetZPos *joy-dll* "joyGetZPos" () :float)
    (defforeign joyGetXRot *joy-dll* "joyGetXRot" () :float)
    (defforeign joyGetYRot *joy-dll* "joyGetYRot" () :float)
    (defforeign joyGetZRot *joy-dll* "joyGetZRot" () :float)
    (defforeign joyGet0Sli *joy-dll* "joyGet0Sli" () :float)
    (defforeign joyGet1Sli *joy-dll* "joyGet1Sli" () :float)
    (defforeign joyGetPOV  *joy-dll* "joyGetPOV" (:integer) :integer)
    (defforeign joyGetButtons  *joy-dll* "joyGetButtons" (:integer) :integer)
    (defforeign joyGetAxis  *joy-dll* "joyGetAxis" (:integer) :float)

    (defforeign joyForces *joy-dll* "joyForces" () :integer)
    (defforeign joyRumbleMagnitude *joy-dll* "joyRumbleMagnitude" (:integer) :integer)
    (defforeign joyRumbleEnvelope *joy-dll* "joyRumbleEnvelope" (:integer :float :float :float) :integer)
    ))

;;
;; GetState
;;
(defun joyGetState ()
  (joyUpdate)
  (let ((x (joyGetXPos))
	(y (joyGetYPos))
	(z (joyGetZRot))
	(v (joyGet0Sli))
	(pov (joyGetPOV 0))
	(b nil)
	(px 0) (py 0) p)
    (when (>= pov 0)
      (setq p (/ pov 4500))
      (if (or (= p 0) (= p 1) (= p 7)) (setq py 1))
      (if (or (= p 3) (= p 4) (= p 5)) (setq py -1))
      (if (or (= p 1) (= p 2) (= p 3)) (setq px 1))
      (if (or (= p 5) (= p 6) (= p 7)) (setq px -1)))
    (dotimes (i 12)
      (if (> (joyGetButtons i) 0)
	  (push (1+ i) b)))
    (list
     (list :arrow1 x (- y))
     (list :arrow2 z (- v))
     (list :pov px py)
     (flatten (list :button (nreverse b))))))

(defun tekkiGetState ()
  (let (a b)
    (joyUpdate)
    (dotimes (i 11)
      (push (joyGetAxis i) a))
    (dotimes (i 37)
      (if (> (joyGetButtons i) 0)
	  (push i b)))
    (list
     (list :sight (nth 10 a) (- (nth 9 a)))
     (list :rotation (nth 8 a))
     (list :aiming (nth 7 a) (- (nth 6 a)))
     (list :gear (nth 5 a))
     (list :pedals (nth 4 a) (nth 3 a) (nth 2 a))
     (list :tuner (nth 1 a) (nth 0 a))
     (flatten (list :button (nreverse b))))))

;;
;; Calib
;;
(defun joyCalib ()
  (let (a r loop ret old-r last-r get-button)
    (joyInit)
    (joyUpdate)
    (format t "Calibrating a joystick for SNES like use:~%")
    (setq button-list '(A B X Y L1 L2 R1 R2 start select))
    (setq old-r (joyGetState))
    (dolist (button button-list)
      (format t "push '~A' key:~%" button)
      (setq loop t)
      (while loop
	(unix:usleep 10000)
	(when (and (not (equal old-r (setq r (joygetstate))))
		   (not (equal last-r r))
		   (setq get-button (cadr (assoc :button r))))
	  (push (cons (read-from-string (format nil ":~A" button)) get-button) ret)
	  (setq loop nil)
	  )
	(setq last-r r))
      )
    (format t "push any arrow key:~%")
    (setq loop t)
    (block :stick
      (while loop
	(unix:usleep 10000)
	(when (not (equal old-r (setq r (joygetstate))))
	  (dolist (arrow (list :arrow1 :arrow2 :pov))
	    (when (not (equal (assoc arrow old-r) (assoc arrow r)))
	      (push (cons :stick arrow) ret)
	      (return-from :stick)
	      ))
	  ))
      )
    (with-open-file
     (f "joyCalib.dat" :direction :output)
     (format f "~A" (reverse ret)))
    (nreverse ret)
    ))

(defun joyReadCalib ()
  (if (probe-file "joyCalib.dat")
      (with-open-file
       (f "joyCalib.dat")
       (read f))
    (joyCalib)))

(if (not (boundp '*joy-dll*))
    (setup-joystick))

#|
(defun test-tekki-bak nil
  (setup-joystick)
  (do-until-key
    (print (tekkiGetState))
    (unix:usleep (* 100 1000)))
  (joyQuit))

(defun test-tekki nil
  (setq *tekki* (instance tekkidirect :init))
  (do-until-key
    (print (send *tekki* :get-state))
    (unix:usleep (* 100 1000)))
  (send *tekki* :quit))
	

(defun test1 nil
  (joyInit)
  (joyUpdate)
  (joyRumbleMagnitude 10000)
  (unix:sleep 1)
  (joyRumbleMagnitude 0)
  (joyQuit))

(defun test2 nil
  (joyInit)
  (joyUpdate)
  (dotimes (i 10)
    (joyUpdate)
    (joyRumbleEnvelope 8000 0.1 0.1 0.6)
    (unix:sleep 1)
    )
  (joyRumbleMagnitude 0)
  (joyQuit)
  )

(defun test3 nil
  (let (m)
    (joyInit)
    (joyUpdate)
    (dotimes (i 10)
      (joyUpdate)
      (setq m (* i 2000))
      (if (> m 10000) (setq m 10000))
      (joyRumbleEnvelope m 0.8 0.0 1.0)
      (unix:sleep 1)
      )
    (joyRumbleMagnitude 0)
    (joyQuit)
  ))

(defun test4 nil
  (let (r)
    (joyInit)
    (joyUpdate)
    (dotimes (i 15)
      (setq r (joyGetState))
      (print r)
      (print (cdr (assoc :button r)))
      (print (memq 1 (cdr (assoc :button r))))
      (if (memq 1 (cdr (assoc :button r)))
	  (joyRumbleEnvelope 8000 0.1 0.1 0.6))
      (if (memq 2 (cdr (assoc :button r)))
	  (joyRumbleEnvelope 10000 1.0 1.0 3.0))
      (unix:sleep 1)
      )
    (joyRumbleMagnitude 0)
    (joyQuit)
    ))
  
(defun test5 nil
  (let (i)
    (unless (boundp '*joy*)
      (setq *joy* (instance joydirect :init)))
    (dotimes (i 10)
      (send *joy* :state)
      (setq a (send *joy* :arrow1 1))
      (setq b (send *joy* :button 3))
      (format t "~A ~A ~%" a b)
      (unix:sleep 1)
      )))


(format t ";;loading joydirect.l~%")
(format t ";;(test1)(test2)(test3)(test4) for demo~%")


|#

(defun test-joystick nil
  (let (r)
    (joyInit)
    (joyUpdate)
    (dotimes (i 15)
      (setq r (joyGetState))
      (print r)
      (print (cdr (assoc :button r)))
      (print (memq 1 (cdr (assoc :button r))))
      (if (memq 1 (cdr (assoc :button r)))
	  (joyRumbleEnvelope 8000 0.1 0.1 0.6))
      (if (memq 2 (cdr (assoc :button r)))
	  (joyRumbleEnvelope 10000 1.0 1.0 3.0))
      (unix:sleep 1)
      )
    (joyRumbleMagnitude 0)
    (joyQuit)
    ))