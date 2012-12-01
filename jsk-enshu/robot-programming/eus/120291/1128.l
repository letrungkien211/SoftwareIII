(setq *m*
      '((1 2) (2 3) (3 4) (4 9) (9 14) (9 8) (8 7) (7 12) (12 13) (12 11) (11 6)
	(11 16) (14 15) (16 17) (17 22) (21 22) (22 23) (23 28) (23 24) 
	(24 19) (19 20) (20 15) (15 10) (10 5) (20 25)))

					;(make-irtviewer)
(defun test1 nil
  (load "daisya.l")
  (setq *daisya* (instance daisyaclass :init))
  (objects (list *daisya*))
  (send *daisya* :arm-angle-vector #f(0 0 0 0 30))
  (load "maze.l")
  (setq *maze* (make-maze *m*))
  (objects (list *maze* *daisya*))

  (send *daisya* :locate (generate-coords-from-nodenum 1) :world)
  (send *irtviewer* :draw-objects)
  )

(test1)


(defun move-daisya
  (c ;; c is coordinate
   &key 
   (view t)
   (ticktime 50)
   (interpolation-num 10)
   )
  (let* ((current-pos (send *daisya* :worldpos))
	 (current-angle (rad2deg
			 (atan (aref (matrix-column (send *daisya* :worldrot) 0) 1)
			       (aref (matrix-column (send *daisya* :worldrot) 0) 0))))
	 (diff-vector (v- c current-pos))
	 (goal-angle (rad2deg (atan (aref diff-vector 1) (aref diff-vector 0))))
	 diff-angle)
    (cond 
     (view ;; current-vector -> goal-vector
      (setq diff-vector (scale (/ 1.0 interpolation-num) diff-vector))
      (setq diff-angle (/ (- goal-angle current-angle) interpolation-num))
      (dotimes (i interpolation-num)
	(send *daisya* :translate diff-vector :world) ;; translational motion
	(send *daisya* :rotate (deg2rad diff-angle) :z) ;; rotational motion
	(send *daisya* :simulate (send *maze* :bodies)) ;; >>>???
	(send *irtviewer* :draw-objects) ;; draw
	(unix:usleep (* 1000 ticktime)))
      (t
       (send *daisya* :translate diff-vector :world)
       (send *daisya* :rotate (deg2rad (- goal-angle current-angle)) :z)
)))))

(defun maze-demo
  (start goal-angle
	 &key (extender #'depth-extender)) ;; 
  (move-daisya
   (generate-coords-from-nodenum start
				 :column-num (get *maze* :column-num)
				 :maze-length (get *maze* :maze-length))
   :view nil)
  (send *irtviewer* :draw-objects)
  (unix:usleep 500) ;;

  (let ((path (i-search start goal (get *maze* :make-list) :extender extender)))
    (warn "solved path is ~a%" path)
    (dolist (p path)
      (move-daisya
       (generate-coords-from-nodenum p :column-num (get *maze* :column-num)
				     :maze-length (get *maze* :maze-length)))
       ))
  )