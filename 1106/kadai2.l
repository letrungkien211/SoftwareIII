(defclass drawer
  :slots (l1 l2 l3 l4)
  :super cascaded-link)

(defmethod drawer
  (:init nil
	 (let (d b1 b2 b3 tmp)

	   (send-super :init)

	   (setq b1 (make-cube 10 30 10))
	   (send b1 :locate #f(0 0 7))
	   (setq b2 (make-cube 10 30 10))
	   (send b2 :locate #f(0 0 19))
	   (setq b3 (make-cube 10 30 10))
	   (send b3 :locate #f(0 0 31))
	   (setq tmp (make-cube 14 34 38))
	   (send tmp :locate #f(-3 0 19))
	   (setq d (body- tmp b1 b2 b3))
	   (send d :locate #f(1 0 0))
	   (send d :set-color :orange)

	   (setq b1 (body- b1 (make-cube 8 28 10 :pos #f(0 0 9))))
	   (send b1 :set-color :yellow)
	   (setq b2 (body- b2 (make-cube 8 28 10 :pos #f(0 0 21))))
	   (send b2 :set-color :yellow)
	   (setq b3 (body- b3 (make-cube 8 28 10 :pos #f(0 0 33))))
	   (send b3 :set-color :yellow)

	   (setq l1 (instance bodyset-link :init (make-cascoords)
			      :bodies (list d)))
	   (setq l2 (instance bodyset-link :init (make-cascoords)
			      :bodies (list b1)))
	   (setq l3 (instance bodyset-link :init (make-cascoords)
			      :bodies (list b2)))
	   (setq l4 (instance bodyset-link :init (make-cascoords)
			      :bodies (list b3)))
	   
	   (send self :assoc l1)
	   (send l1 :assoc l2)
	   (send l2 :assoc l3)
	   (send l3 :assoc l4)

	   (setq joint-list
		 (list 
		  (instance linear-joint
			    :init :parent-link l1 :child-link l2
			    :axis :x)
		  (instance linear-joint
			    :init :parent-link l1 :child-link l3
			    :axis :x)
		  (instance linear-joint
			    :init :parent-link l1 :child-link l4
			    :axis :x)
		  )
		 )
	   (setq links (list l1 l2 l3 l4))
	   (send self :init-ending))))

(defun drawer nil
  (let (r (i 0))
    (setq r (instance drawer :init))
    (objects (list r))
    (dolist (b (cdr (send r :links)))
      (dotimes (j 400)
	(send r :angle-vector (float-vector
			       (if (> i 0) 10 (if (= i 0) (/ j 40.0) 0))
			       (if (> i 1) 10 (if (= i 1) (/ j 40.0) 0))
			       (if (> i 2) 10 (if (= i 2) (/ j 40.0) 0))
			       ))
	(send r :locate (float-vector 0 (if (< j 200) 0.2 -0.2) 0))
	(send *irtviewer* :draw-objects)
	(x::window-main-one))
      (send (car (send r :links)) :dissoc b)
      (setq i (incf i))
      )
    ))
