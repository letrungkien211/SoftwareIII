(setq *m*
      '((1 2) (2 3) (3 4) (4 9) (9 14) (9 8) (8 7) (7 12) (12 13) (12 11)
	(11 6) (11 16) (14 15) (16 17) (17 22) (21 22) (22 23) (23 18) (23 24)
	(24 19) (19 20) (20 15) ( 15 10) (10 5) (20 25)))

(defun maze-search (s f m &key ( extender #'depth-extender))
  (g-search s f m :extender extender))


	