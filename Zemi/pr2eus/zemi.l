#!/usr/bin/env roseus
;;;;
;;;; send robot joint angle-vector to pr2 robot
;;;;

(load "package://pr2eus/pr2-interface.l")

(pr2)
(if (not (boundp '*irtviewer*)) (make-irtviewer))
(objects (list *pr2*))
(send *irtviewer* :draw-objects)

(setq *ri* (instance pr2-interface :init))

(defun pr2-inverse-kinematics (des)
  (send *pr2* :inverse-kinematics
	(make-coords :pos des)
	:rotation-axis nil
	:move-target (send *pr2* :larm :end-coords)
	:link-list (send *pr2* :link-list
			 (send *pr2* :larm :end-coords :parent)
			 (send *pr2* :torso_lift_link))
	:debug-view t)
  )

(defun pr2-ri-angle-vector ()
  (send *ri* :angle-vector (send *pr2* :angle-vector) 10)
  (send *ri* :wait-interpolation))

(send *pr2* :angle-vector (send *ri* :state :potentio-vector))

(defun pr2-hand-move (l)
  (send *pr2* :torso :waist-z :joint-angle (elt l 0))
  (send *pr2* :larm :collar-y :joint-angle  (elt l 1))
  (send *pr2* :larm :shoulder-p :joint-angle (elt l 2))
  (send *pr2* :larm :shoulder-r :joint-angle (elt l 3))
  (send *pr2* :larm :elbow-p :joint-angle (elt l 4))
  (send *pr2* :larm :elbow-r :joint-angle (elt l 5))
  (send *pr2* :larm :wrist-p :joint-angle (elt l 6)))

(defun pr2-daruma-knock (l1 l2)
  (pr2-hand-move l1)
  (pr2-ri-angle-vector)
  (pr2-hand-move l2)
  (pr2-ri-angle-vector))

#|
Right hand
(setq ja-home (list 100 35 0 -90 -20 0 0))
(setq ja-des (list 100 -30 0 -90 -45 0 -45))

(pr2-hand-move ja-home)
(pr2-ri-angle-vector)

(pr2-hand-move ja-des)
(pr2-ri-angle-vector)

|#

(setq ja-home (list 100 35 0 90 30 0 20))
(setq ja-des (list 100 35 20 90 50 0 40))

