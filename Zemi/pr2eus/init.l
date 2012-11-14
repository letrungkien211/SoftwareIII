(load "package://pr2eus/pr2-interface.l")
(pr2)
(if (not (boundp '*irtviewer*)) (make-irtviewer))
(objects (list *pr2*))
(send *irtviewer* :draw-objects)

(setq *ri* (instance pr2-interface :init))
