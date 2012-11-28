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

;(send *pr2* :reset-pose)
;(send *pr2* :head :neck-p :joint-angle 40)
;(send *ri* :angle-vector (send *pr2* :angle-vector) 10)

;(send *ri* :wait-interpolation)
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


(setq *flag* t)
(setq *pos* nil)
(defun pick (c)
  (if *flag*
      (send *ri* :stop-grasp :larm))
  (send *pr2* :inverse-kinematics
	c
	:rotation-axis nil
	:move-target (send *pr2* :larm :end-coords)
	:link-list (send *pr2* :link-list
			 (send *pr2* :larm :end-coords :parent)
			 (send *pr2* :torso_lift_link))
	:debug-view t)
  (send *pr2* :larm :wrist-r :joint-angle 90)
  (print "fdfdfdfdf")
  (send *ri* :angle-vector (send *pr2* :angle-vector) 10)
  (send *ri* :wait-interpolation)
  (send *ri* :start-grasp :larm)
  (setf *flag* nil))

(setq *flag1* t)
(setq *pos1* nil)
(setq *pos2* nil)

(defun pick-place (c1 c2)
  (if *flag1*
      (send *ri* :stop-grasp :larm))
  (send *ri* :move-end-coords-plan (send c1 :translate #f(0 0 15) :world)
	:move-arm :larm :use-torso t :send-trajectory nil)
  (send *ri* :start-grasp :larm)
  (send *ri* :move-end-coords-plan (send c2 :translate #f(0 0 15) :world)
	:move-arm :larm :use-torso t :send-trajectory nil)
  (send *ri* :stop-grasp :larm)
  (setf *flag1* nil))

;; 
;; callback
(ros::rate 10)
;(while (ros::ok)
(defun test nil
  (setq c (tf-object-update))
  (ros::spin-once)
  (send *irtviewer* :draw-objects)
  (send-all c :draw-on :flush t)
  
  ;; (when (and *flag* c)
  ;;   (setf *pos* (elt c 0)))

  ;; (when *pos*
  ;;     (pick *pos*)
  ;;     (setf *pos* nil))

  ;; (when (and *flag1* (= 2 (length c)))
  ;;   (setf *pos1* (elt c 0))
  ;;   (setf *pos2* (elt c 1)))

  ;; (when *pos1*
  ;;   (setq *pos1* (make-coords :pos (send (elt c 0) :pos)) )
  ;;   (setq *pos2* (make-coords :pos (send (elt c 1) :pos)) )
  ;;   (pick-place *pos1* *pos2*)
  ;;   (setf *pos1* nil))

  ;;(setq pos1 (make-coords :pos (send *pr2* :larm :end-coords :pos) ))
  ;;(setq pos2 (make-coords :pos (send *pr2* :larm :end-coords :pos) ))
  (setq pos1 (send *pr2* :larm :end-coords :copy-worldcoords))
  (setq pos2 (send *pr2* :larm :end-coords :copy-worldcoords))
  (send pos1 :translate #f(100 0 200) :world)
  (send pos2 :translate #f(100 0 200) :world)
  (send pos1 :translate #f(0 0 20) :world)
  (send-all (list pos1 pos2) :draw-on :flush t)

  (when (and *flag* (= (length c) 2))
    (pick-place pos1 pos2)
    (setf *flag* nil))

    
  (x::window-main-one)
  (ros::sleep)
  )
(test)

