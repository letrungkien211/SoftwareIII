#!/usr/bin/env roseus

;; Include header files 
;; 
(ros::roseus-add-msgs "image_view2")
(ros::roseus-add-msgs "posedetection_msgs")

;;;
;;; Pr2 model 
(load "package://pr2eus/pr2.l")
(load "package://pr2eus/pr2-interface.l")

(if (not (boundp '*irtviewer*)) (make-irtviewer))
(if (not (boundp '*pr2*)) (pr2))
(objects (list *pr2*))

;;;
;;; Client node definition
(ros::roseus "tabletop_objectdetection_client")

;;; Calculate object world position 
;;; 
(setq *tfb* (instance ros::transform-broadcaster :init))
(setq *tfl* (instance ros::transform-listener :init))

(defun tf-object-update (&optional (root-frame-id "/base_footprint"))
  (let (c obj-frame-id ret)
    (dolist (obj-frame-id (list "/tabletop0" "/tabletop1" "/tabletop2" "/tabletop3"))
      ;; advertise
      (when (send *tfl* :get-latest-common-time root-frame-id obj-frame-id)
	(setq c (send *tfl* 
		      :lookup-transform 
		      root-frame-id 
		      obj-frame-id 
		      (ros::time 0)))
	(when c
	  (ros::ros-info "~A ~A" obj-frame-id c)
	  (push c ret))))
    ret))

;;
;; When recieve a meesage from "ObjectDetection" topic
(defun objectdetection-cb (msg)
  (let ((frame-id (send msg :header :frame_id)) type ret)
    (print msg) ; print the msg
    (unless (eq (char frame-id 0) #\/) (setq frame-id (concatenate string "/" frame-id))) 
    (dolist (obj-pose (send msg :objects)) ;; for every objects in the message
      (setq type (send obj-pose :type)) ;; 
      (unless (eq (char type 0) #\/) (setq type (concatenate string "/" type)))
      (setq ret (ros::tf-pose->coords (send obj-pose :pose)))
      (send *tfb* :send-transform ret frame-id type)
      (ros::ros-info "~A ~A ~A" ret frame-id type))
    ))
;; Subcribe to Objectdetection
;; Run (objectdetection-cb) whenever msgs comes
(ros::subscribe "ObjectDetection" posedetection_msgs::ObjectDetection #'objectdetection-cb)


;; 
;; MainLoop
(ros::rate 10)
(while (ros::ok)
  ;; c: list of all objects 
  (setq c (tf-object-update))
  (ros::spin-once)
  (send *irtviewer* :draw-objects)
  (if c 
      (
       (send-all c :draw-on :flush t)
       (send *pr2* :inverse-kinematics 
	     (make-coords :pos (send (elt c 0) :pos))
	     :rotation-axis nil
	     :move-target (send *pr2* :larm :end-coords)
	     :link-list (send *pr2* :link-list 
			      (send *pr2* :larm :end-coords :parent)
			      (send *pr2* :torso_lift_link))
	     :debug-view t)
       ))
  (x::window-main-one)
  (ros::sleep)
  )


