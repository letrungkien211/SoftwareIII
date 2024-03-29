(if (not (boundp *irtviewer*)))

(load "irteus/demo/sample-arm-model.l")
(setq *sarm* (instance sarmclass :init))
(send *sarm* :reset-pose)
(setq *target* (make-coords :pos #f(350 200 400)))
(objects (list *sarm* *target*))

(do-until-key
 ;; step 3
 (setq c (send *sarm* :end-coords))
 (send c :draw-on :flush t)
 ;; step 4
 (setq dp (scale 0.0001 (v- (send *target* :worldpos) (send c :worldpos)))
       dw (matrix-log (m* (transpose (send c :worldrot) (send *target* :worldrot)))))
 (format t "dp = ~7,3f ~7,3f ~7,3f, dw = ~7,3f ~7,3f ~7,3f ~%"
	 (elt dp 0) (elt dp 1) (elt dp 2)
	 (elt dw 0) (elt dw 1) (elt dw 2))
(when (< (+ (norm dp ) (norm dw)) 0.01) (return))

(setq l1 (send *sarm* :link-list (send *sarm* :end-coords :parent)))
(setq j (send *sarm* :calc-jacobian-from-link-list
	      l1 :move-target (send *sarm* :end-coords)
	      :translation-axis t :rotation-axis t))
(setq q (scale 1.0 (transform (pseudo-inverse j) (concatenate float-vector dp dw))))

(dotimes (i (length l1))
  (send (send (elt l1 i) :joint) :joint-angle (elt q i) :relative t))

(send *irtviewer* :draw-objects)
(x::window-main-one)
       

       