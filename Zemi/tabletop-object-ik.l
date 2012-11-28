#!/usr/bin/env roseus

					;(load "zemi.l")

;; Initialization
(ros::roseus-add-msgs "image_view2")
(ros::roseus-add-msgs "posedetection_msgs")
(load "package://pr2eus/pr2.l")
(load "package://pr2eus/pr2-interface.l")
(load "package://pr2eus_openrave/pr2eus-openrave.l")

;;;
;;; Pr2 model 
(if (not (boundp '*irtviewer*)) (make-irtviewer))
(if (not (boundp '*pr2*)) (pr2))
(setq *ri* (instance pr2-interface :init))
(objects (list *pr2*))

(print "AFDFDFDF")
					;(send *pr2* :reset-pose)
;;(send *pr2* :angle-vector (send *ri* :state :potentio-vector))
;;(send *pr2* :angle-vector #f(49.7471 27.6494 6.57449 85.9572 -63.1381 27.0968 -27.4865 89.9958 -60.0008 0.003072 -70.0002 -119.999 -19.9988 -29.9989 90.0004 -0.002237 41.334))
(send *pr2* :reset-pose)
(send *pr2* :arms :shoulder-p :joint-angle 0)
(send *pr2* :head :neck-p :joint-angle 40)
(send *pr2* :arms :wrist-r :joint-angle 90)
(send *pr2* :torso :waist-z :joint-angle 100)
(send *pr2* :larm :collar-y :joint-angle 90)
(send *pr2* :rarm :collar-y :joint-angle -90)
(send *ri* :angle-vector (send *pr2* :angle-vector) 10)
(send *ri* :wait-interpolation)


;;;
;;; Client node defination
(ros::roseus "tabletop_objectdetection_client")

;;; 
;;; 
(setq *tfb* (instance ros::transform-broadcaster :init))
(setq *tfl* (instance ros::transform-listener :init))

(defun tf-object-update (&optional (root-frame-id "/base_footprint"))
  (let (c obj-frame-id ret)
    (dolist (obj-frame-id (list "/tabletop0" "/tabletop1" "/tabletop2"))
      ;; advertise
      (when (send *tfl* :get-latest-common-time root-frame-id obj-frame-id)
	(setq c (send *tfl* :lookup-transform root-frame-id obj-frame-id (ros::time 0)))
	(when c
	  (ros::ros-info "~A ~A" obj-frame-id c)
	  (push c ret))))
    ret))

(defun objectdetection-cb (msg)
  (let ((frame-id (send msg :header :frame_id)) type ret)
    (print msg)
    (unless (eq (char frame-id 0) #\/) (setq frame-id (concatenate string "/" frame-id)))
    (dolist (obj-pose (send msg :objects))
      (setq type (send obj-pose :type))
      (unless (eq (char type 0) #\/) (setq type (concatenate string "/" type)))
      (setq ret (ros::tf-pose->coords (send obj-pose :pose)))
      (send *tfb* :send-transform ret frame-id type)
      (ros::ros-info "~A ~A ~A" ret frame-id type))
    ))



;; Subcribe to Objectdetection
;; Run (objectdetection-cb) whenever msgs comes
(ros::subscribe "ObjectDetection" posedetection_msgs::ObjectDetection #'objectdetection-cb)

;; (setq *flag* t)
;; (setq *pos* nil)
;; (defun pick (c)
;;   (if *flag*
;;       (send *ri* :stop-grasp :larm))
;;   (send *pr2* :inverse-kinematics
;; 	c
;; 	:rotation-axis nil
;; 	:move-target (send *pr2* :larm :end-coords)
;; 	:link-list (send *pr2* :link-list
;; 			 (send *pr2* :larm :end-coords :parent)
;; 			 (send *pr2* :torso_lift_link))
;; 	:debug-view t)
;;   (send *pr2* :larm :wrist-r :joint-angle 90)
;;   (print "fdfdfdfdf")
;;   (send *ri* :angle-vector (send *pr2* :angle-vector) 10)
;;   (send *ri* :wait-interpolation)
;;   (send *ri* :start-grasp :larm)
;;   (setf *flag* nil))

;; (defun pick-place (c1 c2)
;;   (if *flag1*
;;       (send *ri* :stop-grasp :larm))
;;   (send *ri* :move-end-coords-plan (send c1 :translate #f(0 0 15) :world)
;; 	:move-arm :larm :use-torso t :send-trajectory nil)
;;   (send *ri* :start-grasp :larm)
;;   (send *ri* :move-end-coords-plan (send c2 :translate #f(0 0 15) :world)
;; 	:move-arm :larm :use-torso t :send-trajectory nil)
;;   (send *ri* :stop-grasp :larm)
;;   (setf *flag1* nil))


(defun pick-place1 (c1 c2)
  (send *ri* :stop-grasp :larm)
  (print "1")
  (send *ri* :move-end-coords-plan c1
	:move-arm :larm :use-torso t :send-trajectory nil)
  (print "2")
  (send *ri* :start-grasp :larm)

  (send *ri* :stop-grasp :larm)
  (print "3")
  (send *ri* :move-end-coords-plan c2
	:move-arm :larm :use-torso t :send-trajectory nil)
  (print "4")
  (send *ri* :start-grasp :larm)
;;  (send *ri* :stop-grasp :larm)
  (print "5"))


(setq *flag* t)
(defun pick-place (c1 c2 &key (arm :larm))
  (when *flag* 
    (send *ri* :stop-grasp :larm)
    (setf *flag* nil))
  (print "1")
  (send *pr2* :inverse-kinematics
	c1
;;	(send c1 :rotate (deg2rad 180) :z)
	:rotation-axis :x
	:move-target (send *pr2* arm :end-coords)
	:link-list (send *pr2* :link-list
			 (send *pr2* arm :end-coords :parent)
			 (send *pr2* :torso_lift_link))
	:debug-view t)
  ;(send *ri* :angle-vector (send *pr2* :angle-vector) 2000)
  ;(send *ri* :wait-interpolation)
  ;(send *ri* :start-grasp arm)

  (send *pr2* :inverse-kinematics
	c2
	;;(send c2 :rotate (deg2rad 180) :z)
;;	(send c2 :rotate (deg2rad 90) :x)
	:rotation-axis :x
	:move-target (send *pr2* arm :end-coords)
	:link-list (send *pr2* :link-list
			 (send *pr2* arm :end-coords :parent)
			 (send *pr2* :torso_lift_link))
	:debug-view t)
  ;(send *ri* :angle-vector (send *pr2* :angle-vector) 2000)
  ;(send *ri* :wait-interpolation)
  
  ;(send *ri* :stop-grasp arm)
  (print "5"))




;; 
;; callback
(setq *flag* t)
(defun test nil
  (setq c (tf-object-update))
  (ros::spin-once)
  (print "1")
  (send *irtviewer* :draw-objects)
  (print "2")
  (send-all c :draw-on :flush t)
  (print "3")
  (when (and *flag* (>= (length c) 3))
    (sort c #'(lambda (x y) (> (elt (send x :pos ) 2) 
			       (elt (send y :pos ) 2))))
    (pick-place (elt c 1) (elt c 2))
    (setf *flag* nil))
  (print "4")
  (x::window-main-one)
  (ros::sleep)
  )
;;
;; 
(ros::rate 10)
;;(while (ros::ok)
;;  (test))

(test)

