(defun make-servo nil
  (let (b1 b2)
    (setq b1 (make-cube 35 20 46))
    (send b1 :locate #f(9.5 0 0))
    (setq b2 (make-cylinder 3 60))
    (send b2 :locate #f(0 0 -30))
    (setq b1 (body+ b1 b2))
    (send b1 :set-color :gray20)
    b1))

(defun make-hinji nil
  (let ((b2 (make-cube 22 16 58))
	(b1 (make-cube 26 20 54)))
    (send b2 :locate #f(-4 0 0))
    (setq b2 (body- b2 b1))
    (send b1 :set-color :gray80)
    b2))


(defclass servo-model
  :super cascaded-link
  :slots (h1 s1 j1))

(defmethod servo-model
  (:init ()
	 (let ()
	   (send-super :init)
	   (setq h1 (instance bodyset-link :init (make-cascoords) :bodies (list (make-hinji))))
	   (setq s1 (instance bodyset-link :init (make-cascoords) :bodies (list (make-servo))))
	   (setq j1 (instance rotational-joint :init :parent-link h1 :child-link s1 :axis :z))
	   
	   (setq links (list h1 s1))
	   (setq joint-list (list j1))
	   (send self :assoc h1)
	   (send h1 :assoc s1)
	   (send self :init-ending)
	   self))
  (:j1 (&rest args) (forward-message-to j1 args)))

(defclass hinji-servo-robot
  :super cascaded-link)
(defmethod hinji-servo-robot
  (:init 
   ()
   (let (h1 s1 h2 s2 l1 l2 l3)
     (send-super :init)
     (setq h1 (make-hinji))
     (setq s1 (make-servo))
     (setq h2 (make-hinji))
     (setq s2 (make-servo))
     (send h2 :locate #f(42 0 0))
     (send s1 :assoc h2)
     (setq l1 (instance bodyset-link :init (make-cascoords) :bodies (list h1)))
     (setq l2 (instance bodyset-link :init (make-cascoords) :bodies (list s1 h2)))
     (setq l3 (instance bodyset-link :init (make-cascoords) :bodies (list s2)))
     (send l3 :locate #f(42 0 0))
     
     (send self :assoc l1)
     (send l1 :assoc l2)
     (send l2 :assoc l3)
     
     (setq joint-list
	   (list 
	    (instance rotational-joint 
		      :init :parent-link l1 :child-link l2
		      :axis :z)
	    (instance rotational-joint
		      :init :parent-link l2 :child-link l3
		      :axis :z)))
     (setq links (list l1 l2 l3))
     (send self :init-ending)
     )))

(defclass 3dof-robot 
  :super cascaded-link
  :slots (end-coords l1 l2 l3 l4 j1 j2 j3))

(defmethod 3dof-robot
  (:init ()
	 (let (b)
	   (send-super :init)
	   
	   (setq b (make-cube 10 10 20))
	   (send b :locate #f(0 0 10))
	   (send b :set-color :red)
	   (setq l4 (instance bodyset-link :init  (make-cascoords) :bodies (list b) :name 'l4))
	   (setq end-coords (make-cascoords :pos #f(0 0 20)))
	   (send l4 :assoc end-coords)
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
	   (setq l1 (instance bodyset-link :init (make-cascoords) :bodies (list b) :name 'l2))
	   (send l1 :assoc l2)
	   

	   (setq j1 (instance rotational-joint :init :name 'j1
			      :parent-link l1 :child-link l2 :axis :y :min -100 :max 100)
		 j2 (instance rotational-joint :init :name 'j2
			      :parent-link l2 :child-link l3 :axis :y :min -100 :max 100)
		 j3 (instance rotational-joint :init :name 'j3
			      :parent-link l3 :child-link l4 :axis :y :min -100 :max 100))

	   (setq links (list l1 l2 l3 l4))
	   (setq joint-list (list j1 j2 j3))
	   
	   (send self :init-ending)
	   self))
  (:end-coords (&rest args) (forward-message-to end-coords args)))

			    