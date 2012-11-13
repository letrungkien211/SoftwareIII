(if (not (boundp '*irtviewer*)) (make-irtviewer))
(setq sun (make-sphere 50))
(setq earth (make-sphere 20))
(setq moon (make-sphere 5))

(send sun :set-color :red)
(send earth :set-color :green)
(send moon :set-color :yellow)

(send sun :assoc earth)
(send earth :assoc moon)

(send earth :locate #f(200 0 0))
(send moon :locate #f(30 0 0))

(send sun :assoc earth)
(send earth :assoc moon)

(objects (list sun earth moon))
(send *irtviewer* :draw-objects)
(defun draw nil
  (send *irtviewer* :draw-objects))

(do-until-key
 (send sun :rotate (deg2rad 0.1) :z) 
 (send earth :rotate (deg2rad 0.1) :z )
 (send moon :rotate (deg2rad 1) :z )
 (send *irtviewer* :draw-objects)
 (x::window-main-one)) 