(defun summit1 (lst)
  (apply #'+ (remove nil lst)))

(defun summit (lst)
  (if (null lst)
      0
    (let ((x (car lst)))
      (if (null x)
	  (summit (cdr lst))
	(+ x (summit (cdr lst)))))))
