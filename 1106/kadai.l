(defclass 6dof-robot
  :super cascaded-link
  :slots (end-coords l1 l2 l3 l4 l5 l6 j1 j2 j3 j4 j5))

(defmethod 6dof-robot
  (:init nil
	 (let (b)
	   (send-super :init)
	   
	   (setq b (make-cube 10 10 20))
	   (send b :locate #f(0 0 10))
	   (send b :set-color :red)
	   (setq l6 (instance bodyset-link :init  (make-cascoords) :bodies (list b) :name 'l6))
	   (setq end-coords (make-cascoords :pos #f(0 0 20)))
	   (send l6 :assoc end-coords)
	   (send l6 :locate #f(0 0 100))
	   
	   (setq b (make-cube 10 10 100))
	   (send b :locate #f(0 0 50))
	   (send b :set-color :green)
	   (setq l5 (instance bodyset-link :init (make-cascoords) :bodies (list b) :name 'l5))
	   (send l5 :assoc l6)
	   (send l5 :locate #f(0 0 100))

	   (setq b (make-cube 10 10 100))
	   (send b :locate #f(0 0 50))
	   (send b :set-color :green)
	   (setq l4 (instance bodyset-link :init (make-cascoords) :bodies (list b) :name 'l4))
	   (send l4 :assoc l5)
	   (send l4 :locate #f(0 0 100))

	   (setq b (make-cube 10 10 100))
	   (send b :locate #f(0 0 50))
	   (send b :set-color :green)
	   (setq l3 (instance bodyset-link :init (make-cascoords) :bodies (list b) :name 'l3))
	   (send l3 :assoc l4)
	   (send l3 :locate #f(0 0 100))

	   (setq b (make-cube 10 10 100))
	   (send b :locate #f(0 0 50))
	   (send b :set-color :blue)
	   (setq l2 (instance bodyset-link :init (make-cascoords) :bodies (list b) :name 'l2))
	   (send l2 :assoc l3)
	   (send l2 :locate #f(0 0 20))

	   (setq b (body+ (make-cube 10 10 20 :pos #f(0 0 10)) (make-cube 300 300 2)))
	   (send b :set-color :white)
	   (setq l1 (instance bodyset-link :init (make-cascoords) :bodies (list b) :name 'l1))
	   (send l1 :assoc l2)
	   

	   (setq j1 (instance rotational-joint :init :name 'j1
			      :parent-link l1 :child-link l2 :axis :y :min -100 :max 100)
		 j2 (instance rotational-joint :init :name 'j2
			      :parent-link l2 :child-link l3 :axis :x :min -100 :max 100)
		 j3 (instance rotational-joint :init :name 'j3
			      :parent-link l3 :child-link l4 :axis :x :min -100 :max 100)
		 j4 (instance rotational-joint :init :name 'j4
			      :parent-link l4 :child-link l5 :axis :y :min -100 :max 100)
		 j5 (instance rotational-joint :init :name 'j5
			      :parent-link l5 :child-link l6 :axis :y :min -100 :max 100)
		 )

	   (setq links (list l1 l2 l3 l4 l5 l6))
	   (setq joint-list (list j1 j2 j3 j4 j5))
	   
	   (send self :init-ending)
	   self))
  (:end-coords (&rest args) (forward-message-to end-coords args)))

(if (not (boundp '*irtviewer*)) (make-irtviewer))
(setq r (instance 6dof-robot :init))
(objects (list r (send r :end-coords)))
(send r :link-list (send r :end-coords :parent))



(dotimes (i 1)
  (setq des (make-cascoords :pos (float-vector 100 100 100) :rpy (float-vector 0 pi 0)))
  (send r :inverse-kinematics des
	:link-list (send r :link-list (send r :end-coords :parent))
	:move-target (send r :end-coords)
	:translation-axis t
	:rotation-axis t
	:debug-view t
	:revert-if-fail nil)
  (x::window-main-one)
  (send *irtviewer* :draw-objects)
  (send des :draw-on :flush t)
  )