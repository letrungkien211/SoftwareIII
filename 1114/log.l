x86_64
@:~/Dropbox/git/Software3/1114$ irteusgl
set ARCHDIR to Linux64
set EUSDIR to /home/letrungkien7/ros/fuerte/jsk-ros-pkg/euslisp/jskeus/eus
configuring by "/home/letrungkien7/ros/fuerte/jsk-ros-pkg/euslisp/jskeus/eus/lib/eusrt.l"
;; readmacro ;; object ;; packsym ;; common ;; constants ;; stream ;; string ;; loader ;; pprint ;; process ;; hashtab ;; array ;; mathtran ;; eusdebug ;; eusforeign ;; coordinates ;; tty ;; history ;; toplevel ;; trans ;; comp ;; builtins ;; par ;; intersection ;; geoclasses ;; geopack ;; geobody ;; primt ;; compose ;; polygon ;; viewing ;; viewport ;; viewsurface ;; hid ;; shadow ;; bodyrel ;; dda ;; helpsub ;; eushelp ;; xforeign ;; Xdecl ;; Xgraphics ;; Xcolor ;; Xeus ;; Xevent ;; Xpanel ;; Xitem ;; Xtext ;; Xmenu ;; Xscroll ;; Xcanvas ;; Xtop ;; Xapplwin 
connected to Xserver DISPLAY=:0
X events are being asynchronously monitored.
;; pixword ;; RGBHLS ;; convolve ;; piximage ;; pbmfile ;; image_correlation ;; oglforeign ;; gldecl ;; glconst ;; glforeign ;; gluconst ;; gluforeign ;; glxconst ;; glxforeign ;; eglforeign ;; eglfunc ;; glutil ;; gltexture ;; glprim ;; gleus ;; glview ;; toiv-undefined ;; fstringdouble irtmath irtutil irtc irtgeoc irtgraph pgsql irtgeo euspqp pqp irtscene irtmodel irtdyna irtrobot irtsensor irtbvh irtcollada irtpointcloud irtx eusjpeg euspng png irtimage irtglrgb 
;; extending gcstack 0x5b1b110[16374] --> 0x5f79540[32748] top=36af
irtgl irtviewer 
EusLisp 8.26(r586M 862) for Linux64 created on letrungkien7-ThinkPad3-T400s(Tue Nov 13 00:41:29 JST 2012)
1.irteusgl$ load kadai.l
irteusgl 0 error: unbound variable kadai.l in (load kadai.l)
2.E1-irteusgl$ reset
3.irteusgl$ load "kadai.l"
t
4.irteusgl$ cat kadai1114.l
cat: kadai1114.l: No such file or directory
256
5.irteusgl$ cat kadai.l
(load "models/room73b2-scene.l")
(load "models/h7-robot.l")

(defun kadai1114 nil
  (setq *room* (room73b2))
  (setq *robot* (h7))
  (objects (list *robot* (h7)))

  (send *robot* :reset-pose)

  )0
6.irteusgl$ (kadai1114)
;; (make-irtviewer) executed
#f(-3.0 45.0 0.0 -110.0 0.0 0.0 0.0 0.0 -3.0 45.0 0.0 -110.0 0.0 0.0 0.0 0.0 0.0 0.0 -17.54 42.976 -25.435 0.0 0.0 0.0 0.0 0.0 -17.54 42.976 -25.435 0.0 0.0 0.0 0.0 -2.0 0.0 -2.0)
7.irteusgl$ (kadai)
irteusgl 0 error: undefined function kadai in #<compiled-code #X5b3ed70>
8.E1-irteusgl$ reset
9.irteusgl$ load "kadai.l"
t
10.irteusgl$ (kadai)
X Error of failed request:  BadValue (integer parameter out of range for operation)
  Major opcode of failed request:  141 (ATIFGLEXTENSION)
  Minor opcode of failed request:  72 ()
  Value in failed request:  0x5b11b00
  Serial number of failed request:  1011
  Current serial number in output stream:  1011
@:~/Dropbox/git/Software3/1114$ irteusgl
set ARCHDIR to Linux64
set EUSDIR to /home/letrungkien7/ros/fuerte/jsk-ros-pkg/euslisp/jskeus/eus
configuring by "/home/letrungkien7/ros/fuerte/jsk-ros-pkg/euslisp/jskeus/eus/lib/eusrt.l"
;; readmacro ;; object ;; packsym ;; common ;; constants ;; stream ;; string ;; loader ;; pprint ;; process ;; hashtab ;; array ;; mathtran ;; eusdebug ;; eusforeign ;; coordinates ;; tty ;; history ;; toplevel ;; trans ;; comp ;; builtins ;; par ;; intersection ;; geoclasses ;; geopack ;; geobody ;; primt ;; compose ;; polygon ;; viewing ;; viewport ;; viewsurface ;; hid ;; shadow ;; bodyrel ;; dda ;; helpsub ;; eushelp ;; xforeign ;; Xdecl ;; Xgraphics ;; Xcolor ;; Xeus ;; Xevent ;; Xpanel ;; Xitem ;; Xtext ;; Xmenu ;; Xscroll ;; Xcanvas ;; Xtop ;; Xapplwin 
connected to Xserver DISPLAY=:0
X events are being asynchronously monitored.
;; pixword ;; RGBHLS ;; convolve ;; piximage ;; pbmfile ;; image_correlation ;; oglforeign ;; gldecl ;; glconst ;; glforeign ;; gluconst ;; gluforeign ;; glxconst ;; glxforeign ;; eglforeign ;; eglfunc ;; glutil ;; gltexture ;; glprim ;; gleus ;; glview ;; toiv-undefined ;; fstringdouble irtmath irtutil irtc irtgeoc irtgraph pgsql irtgeo euspqp pqp irtscene irtmodel irtdyna irtrobot irtsensor irtbvh irtcollada irtpointcloud irtx eusjpeg euspng png irtimage irtglrgb 
;; extending gcstack 0x57b4110[16374] --> 0x5c12540[32748] top=36af
irtgl irtviewer 
EusLisp 8.26(r586M 862) for Linux64 created on letrungkien7-ThinkPad3-T400s(Tue Nov 13 00:41:29 JST 2012)
1.irteusgl$ load "kadai.l"
t
2.irteusgl$ irteusgl
set ARCHDIR to Linux64
set EUSDIR to /home/letrungkien7/ros/fuerte/jsk-ros-pkg/euslisp/jskeus/eus
configuring by "/home/letrungkien7/ros/fuerte/jsk-ros-pkg/euslisp/jskeus/eus/lib/eusrt.l"
;; readmacro ;; object ;; packsym ;; common ;; constants ;; stream ;; string ;; loader ;; pprint ;; process ;; hashtab ;; array ;; mathtran ;; eusdebug ;; eusforeign ;; coordinates ;; tty ;; history ;; toplevel ;; trans ;; comp ;; builtins ;; par ;; intersection ;; geoclasses ;; geopack ;; geobody ;; primt ;; compose ;; polygon ;; viewing ;; viewport ;; viewsurface ;; hid ;; shadow ;; bodyrel ;; dda ;; helpsub ;; eushelp ;; xforeign ;; Xdecl ;; Xgraphics ;; Xcolor ;; Xeus ;; Xevent ;; Xpanel ;; Xitem ;; Xtext ;; Xmenu ;; Xscroll ;; Xcanvas ;; Xtop ;; Xapplwin 
connected to Xserver DISPLAY=:0
X events are being asynchronously monitored.
;; pixword ;; RGBHLS ;; convolve ;; piximage ;; pbmfile ;; image_correlation ;; oglforeign ;; gldecl ;; glconst ;; glforeign ;; gluconst ;; gluforeign ;; glxconst ;; glxforeign ;; eglforeign ;; eglfunc ;; glutil ;; gltexture ;; glprim ;; gleus ;; glview ;; toiv-undefined ;; fstringdouble irtmath irtutil irtc irtgeoc irtgraph pgsql irtgeo euspqp pqp irtscene irtmodel irtdyna irtrobot irtsensor irtbvh irtcollada irtpointcloud irtx eusjpeg euspng png irtimage irtglrgb 
;; extending gcstack 0x4de7110[16374] --> 0x5245540[32748] top=36af
irtgl irtviewer 
EusLisp 8.26(r586M 862) for Linux64 created on letrungkien7-ThinkPad3-T400s(Tue Nov 13 00:41:29 JST 2012)
1.irteusgl$ (kadai)
irteusgl 0 error: undefined function kadai in #<compiled-code #X4e0ad70>
2.E1-irteusgl$ reset
3.irteusgl$ load "kadai.l"
t
4.irteusgl$ (kadai)
;; (make-irtviewer) executed
#f(-3.0 45.0 0.0 -110.0 0.0 0.0 0.0 0.0 -3.0 45.0 0.0 -110.0 0.0 0.0 0.0 0.0 0.0 0.0 -17.54 42.976 -25.435 0.0 0.0 0.0 0.0 0.0 -17.54 42.976 -25.435 0.0 0.0 0.0 0.0 -2.0 0.0 -2.0)
5.irteusgl$ (load)
irteusgl 0 error: mismatch argument in (load "kadai.l")
6.E1-irteusgl$ reset
7.irteusgl$ load kadai.l
irteusgl 0 error: unbound variable kadai.l in (load kadai.l)
8.E1-irteusgl$ reset
9.irteusgl$ load "kadai.l"
irteusgl 0 error: mismatch argument in (load "kadai.l")
10.E1-irteusgl$ reset
11.irteusgl$ (load "kadai.l")
irteusgl 0 error: mismatch argument in (load "kadai.l")
12.E1-irteusgl$  reset
13.irteusgl$ ls
kadai.l  kadai.l~
0
14.irteusgl$ (load "kadai.l")
irteusgl 0 error: mismatch argument in (load "kadai.l")
15.E1-irteusgl$ reset
16.irteusgl$ (load "kadai.l")
irteusgl 0 error: mismatch argument in (load "kadai.l")
17.E1-irteusgl$ reset
18.irteusgl$ *robot*
#<h7-robot #X755bc98 h7  0.0 0.0 0.0 / 0.0 0.0 0.0>
19.irteusgl$ (send *robot* :move-to (send *room* :spot "cook-spot") :world)
#<h7-robot #X755bc98 h7  1100.0 1600.0 0.0 / 3.142 0.0 0.0>
20.irteusgl$ (send *robot* :locate #f(0 0 550))
#<h7-robot #X755bc98 h7  1100.0 1600.0 550.0 / 3.142 0.0 0.0>
21.irteusgl$ (send *irtviewer* :look-all
      (geo::make-bounding-box
       (flatten (send-all *robot* :bodies) :vertices)))

irteusgl 0 error: float vector expected in (make-bounding-box (flatten (send-all *robot* :bodies) :vertices))
22.E1-irteusgl$ nil
22.E1-irteusgl$ (send *irtviewer* :look-all
      (geo::make-bounding-box
       (flatten (send-all (send *robot* :bodies) :vertices))))

1
23.E1-irteusgl$ nil
23.E1-irteusgl$ reset
24.irteusgl$ ls
kadai.l  kadai.l~
0
25.irteusgl$ (setq *kettle* (send *room* :object "room73b2-kettle"))
#<room73b2-kettle-object #X5be3dd0 room73b2-kettle  500.0 1500.0 825.0 / -2.449e-16 0.0 0.0>
26.irteusgl$ (setq *kettle* (send *room* :object "room73b2-kettle"))
(if (send  *kettle* :parent) (send *kettle* :parent) :dissoc *kettle*)
(send *robot* :head :look-at (send *kettle* :worldpos))

#<room73b2-kettle-object #X5be3dd0 room73b2-kettle  500.0 1500.0 825.0 / -2.449e-16 0.0 0.0>
27.irteusgl$ #<room73b2-scene #X5b5c750 room73b2  0.0 0.0 0.0 / 0.0 0.0 0.0>
28.irteusgl$ #f(-3.0 45.0 0.0 -110.0 0.0 0.0 0.0 0.0 -3.0 45.0 0.0 -110.0 0.0 0.0 0.0 0.0 0.0 0.0 -17.54 42.976 -25.435 0.0 0.0 42.3033 0.0 0.0 -17.54 42.976 -25.435 0.0 0.0 7.86338 0.0 -2.0 0.0 -2.0)
29.irteusgl$ nil
29.irteusgl$ (send *robot* :larm :inverse-kinematics
      (car (send *kettle* :handle))
      :link-list (send *robot* :link-list (send *robot* :larm :end-coords :parent))
      :move-target (send *robot* :larm :end-coords)
      :rotation-axis :z
      :debug-view t)

loop:   1
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  859.547 1350.921 735.891 / 3.089 0.436 8.674e-16>)
targe-coordst: (#<cascaded-coords #X7178668 handle0  500.0 1500.0 1020.0 / -2.449e-16 2.465e-32 1.571>)
vel-pos : 44.080 -26.989  85.607 
vel-rot : -0.499  -0.024 
vel-pos-norm : 100.000/  1.000
vel-rot-norm :   0.500/  0.017
angle :   -3.0    45.0     0.0  -110.0     0.0     0.0     0.0 
usrwei:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
ocost :100000000000000000000.000 100000000000000000000.000 100000000000000000000.000 100000000000000000000.000 100000000000000000000.000 100000000000000000000.000 100000000000000000000.000 
cost  :143.069   1.833   3.936   2.062   0.097   0.000   0.000 
weight:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
k     :  0.001 (manipulability:  0.028, gain:  0.001, limit:  0.100, len:7)
nspace: -0.499  -0.255   0.244   0.187  -0.007  -0.000  -0.000 
J     : -0.140  -0.253   0.003  -0.018  -0.000   0.000  -0.000 
         0.205  -0.000   0.120  -0.000   0.000   0.180   0.000 
        -0.066  -0.344   0.008  -0.430  -0.000  -0.000  -0.180 
        -0.423   0.000   0.940  -0.000  -1.000   0.000   0.000 
         0.000   1.000  -0.000   1.000   0.000   0.000   1.000 
J#t   : -1.107  -3.477   0.167   2.553   0.624   1.130   0.924 
         1.941  -1.070   1.293   0.234   0.394   2.449   0.835 
        -0.404   0.506   0.154  -4.152   0.315   0.351   3.642 
        -0.189   0.109   0.432  -0.010  -0.514  -0.071  -0.100 
        -0.228   0.180   0.064  -0.756   0.156   0.213   1.574 
x     :  0.044  -0.027   0.086  -0.499  -0.024 
J#x   : -2.046  -8.027 -13.263 -12.973  17.008   2.526  19.619 
Ny    : -0.126   0.068   0.121  -0.006   0.167   0.061  -0.061 
dav   : -2.172  -7.959 -13.142 -12.980  17.175   2.587  19.558 
dav^  : -2.172  -7.959 -13.142 -12.980  17.175   2.587  19.558 
loop:   2
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  798.626 1394.42 805.98 / 3.047 0.403 -0.522>)
targe-coordst: (#<cascaded-coords #X7178668 handle0  500.0 1500.0 1020.0 / -2.449e-16 2.465e-32 1.571>)
vel-pos : 51.942 -58.874  61.935 
vel-rot : -0.498  -0.049 
vel-pos-norm : 100.000/  1.000
vel-rot-norm :   0.500/  0.017
angle :   -5.2    37.0   -13.1  -123.0    17.2     2.6    19.6 
usrwei:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
ocost :143.069   1.833   3.936   2.062   0.097   0.000   0.000 
cost  : 48.023   1.297  34.885   6.790   0.227   0.037   1.682 
weight:  1.000   1.000   0.028   0.128   0.815   0.965   0.373 
k     :  0.001 (manipulability:  0.026, gain:  0.001, limit:  0.100, len:7)
nspace: -0.449  -0.212   0.012   0.042  -0.027  -0.000  -0.040 
J     : -0.116  -0.176  -0.006   0.066   0.000   0.000   0.000 
         0.252   0.179   0.084   0.127  -0.060   0.170   0.000 
         0.088  -0.314   0.023  -0.402  -0.008  -0.000  -0.180 
        -0.393  -0.004   0.971  -0.058  -0.941  -0.335   0.000 
        -0.459   0.868   0.123   0.954   0.045   0.000   1.000 
J#t   : -2.051  -3.291  -0.010   2.117  -0.889   4.543  -0.061 
         1.380  -0.633   0.093   0.514  -1.716   3.397   0.755 
         1.405  -1.999   0.268  -2.551  -0.686   1.523   4.791 
        -0.108   0.056   0.033  -0.032  -0.904  -0.215  -0.030 
        -0.070  -0.183   0.074  -0.550  -0.084   0.632   1.641 
x     :  0.052  -0.059   0.062  -0.498  -0.049 
J#x   : -2.508 -15.830  -0.548  -2.022  26.730  11.822  10.540 
Ny    : -0.063   0.028   0.013  -0.015   0.015   0.073  -0.042 
dav   : -2.571 -15.802  -0.534  -2.037  26.745  11.895  10.499 
dav^  : -2.571 -15.802  -0.534  -2.037  26.745  11.895  10.499 
loop:   3
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  734.75 1444.72 874.747 / 2.828 0.259 -1.068>)
targe-coordst: (#<cascaded-coords #X7178668 handle0  500.0 1500.0 1020.0 / -2.449e-16 2.465e-32 1.571>)
vel-pos : 69.316 -59.492  40.694 
vel-rot : -0.435  -0.246 
vel-pos-norm : 100.000/  1.000
vel-rot-norm :   0.500/  0.017
angle :   -7.7    21.2   -13.7  -125.0    43.9    14.5    30.1 
usrwei:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
ocost : 48.023   1.297  34.885   6.790   0.227   0.037   1.682 
cost  : 21.313   0.722  41.057   8.804   0.565   0.216   5.544 
weight:  1.000   1.000   0.024   0.102   0.639   0.822   0.153 
k     :  0.000 (manipulability:  0.030, gain:  0.001, limit:  0.100, len:7)
nspace: -0.393  -0.138   0.011   0.036  -0.070  -0.012  -0.039 
J     : -0.147  -0.140  -0.023   0.113   0.000  -0.000   0.000 
         0.181   0.309   0.095   0.297  -0.087   0.156   0.000 
         0.249  -0.217   0.057  -0.268  -0.045  -0.000  -0.180 
        -0.256  -0.171   0.980  -0.192  -0.838  -0.501   0.000 
        -0.847   0.514   0.181   0.697   0.250   0.000   1.000 
J#t   : -2.000  -3.426  -0.003   1.657  -1.930   4.784  -0.606 
         0.752  -0.046   0.187   0.815  -1.878   2.830   0.523 
         3.182  -3.641   0.900  -0.214  -0.801   2.806   4.716 
        -0.072   0.042   0.059  -0.025  -0.830  -0.458   0.131 
         0.375  -0.529   0.279  -0.098  -0.010   0.591   1.598 
x     :  0.069  -0.059   0.041  -0.435  -0.246 
J#x   : -6.583 -15.529  -3.961   5.312  17.710  19.003 -18.984 
Ny    : -0.019   0.007   0.013  -0.005   0.011   0.016  -0.021 
dav   : -6.602 -15.523  -3.948   5.308  17.721  19.020 -19.005 
dav^  : -6.602 -15.523  -3.948   5.308  17.721  19.020 -19.005 
loop:   4
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  667.794 1472.288 913.224 / 2.951 0.21 -1.456>)
targe-coordst: (#<cascaded-coords #X7178668 handle0  500.0 1500.0 1020.0 / -2.449e-16 2.465e-32 1.571>)
vel-pos : 71.710 -68.938  10.256 
vel-rot : -0.153  -0.188 
vel-pos-norm : 100.000/  1.000
vel-rot-norm :   0.242/  0.017
angle :  -14.3     5.7   -17.6  -119.7    61.6    33.5    11.1 
usrwei:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
ocost : 21.313   0.722  41.057   8.804   0.565   0.216   5.544 
cost  :  6.040   0.432 291.729   4.731   1.049   0.639   0.708 
weight:  1.000   1.000   0.003   1.000   0.488   0.610   1.000 
k     :  0.000 (manipulability:  0.036, gain:  0.001, limit:  0.100, len:7)
nspace: -0.266  -0.081   0.002   0.289  -0.090  -0.048  -0.035 
J     : -0.097  -0.112   0.012   0.127  -0.000   0.000  -0.000 
         0.065   0.417   0.041   0.358  -0.029   0.177   0.000 
         0.388  -0.036   0.154  -0.167  -0.099  -0.000  -0.180 
        -0.209   0.058   0.992   0.089  -0.818  -0.192  -0.000 
        -0.972   0.102  -0.116   0.396   0.552   0.000   1.000 
J#t   :  1.759  -4.667   0.020   4.936  -0.291   0.307   0.389 
         0.683   0.964   0.003   1.354  -0.043   0.373   0.053 
         5.143  -2.304   0.052   1.782  -1.149  -0.282   5.158 
        -0.000   0.047   0.013   0.037  -1.110  -0.369   0.594 
         0.919  -0.395   0.013   0.332  -0.182  -0.114   1.902 
x     :  0.072  -0.069   0.010  -0.153  -0.188 
J#x   : -2.320 -20.510  -0.156  12.094   9.988   4.089 -21.220 
Ny    :  0.004   0.005   0.001   0.011   0.010  -0.034  -0.007 
dav   : -2.316 -20.505  -0.155  12.106   9.998   4.055 -21.227 
dav^  : -2.316 -20.505  -0.155  12.106   9.998   4.055 -21.227 
loop:   5
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  595.526 1487.997 973.544 / 3.118 0.11 -1.58>)
targe-coordst: (#<cascaded-coords #X7178668 handle0  500.0 1500.0 1020.0 / -2.449e-16 2.465e-32 1.571>)
vel-pos : 84.311 -52.917  -9.563 
vel-rot :  0.006  -0.024 
vel-pos-norm : 100.000/  1.000
vel-rot-norm :   0.025/  0.017
angle :  -16.7   -14.8   -17.8  -107.6    71.6    37.6   -10.2 
usrwei:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
ocost :  6.040   0.432 291.729   4.731   1.049   0.639   0.708 
cost  :  4.405   0.211 333.849   1.737   1.575   0.779   0.640 
weight:  1.000   1.000   0.003   1.000   0.388   0.562   1.000 
k     :  0.000 (manipulability:  0.040, gain:  0.001, limit:  0.100, len:7)
nspace: -0.227  -0.029   0.002   0.165  -0.092  -0.056   0.029 
J     : -0.018  -0.081   0.066   0.114   0.000   0.000  -0.000 
        -0.002   0.466  -0.006   0.361   0.025   0.177   0.000 
         0.476   0.040   0.239  -0.145  -0.110  -0.000  -0.180 
        -0.109   0.262   0.899   0.357  -0.780   0.177   0.000 
        -0.994  -0.037  -0.353   0.250   0.610   0.000   1.000 
J#t   :  2.428  -4.473   0.012   5.758   0.788  -0.061   0.331 
         0.183   1.294  -0.009   0.947   0.871   0.181  -0.540 
         3.453  -0.267   0.023   0.311  -0.365   0.170   3.573 
        -0.012   0.012   0.013   0.006  -1.225   0.136   0.738 
         0.614  -0.051   0.007   0.050  -0.060   0.050   1.634 
x     :  0.084  -0.053  -0.010   0.006  -0.024 
J#x   :  8.442 -25.310   0.068  24.708   1.003  -0.955  -0.678 
Ny    :  0.001   0.017   0.001   0.013  -0.004  -0.070   0.001 
dav   :  8.444 -25.293   0.069  24.721   1.000  -1.025  -0.677 
dav^  :  8.444 -25.293   0.069  24.721   1.000  -1.025  -0.677 
loop:   6
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  514.779 1482.691 1038.528 / -3.128 0.052 -1.543>)
targe-coordst: (#<cascaded-coords #X7178668 handle0  500.0 1500.0 1020.0 / -2.449e-16 2.465e-32 1.571>)
vel-pos : 15.494  17.244 -17.996 
vel-rot : -0.027   0.014 
vel-pos-norm :  29.348/  1.000
vel-rot-norm :   0.030/  0.017
angle :   -8.2   -40.1   -17.7   -82.9    72.6    36.5   -10.9 
usrwei:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
ocost :  4.405   0.211 333.849   1.737   1.575   0.779   0.640 
cost  : 18.900   0.031 313.915   0.323   1.646   0.741   0.692 
weight:  0.050   1.000   1.000   1.000   0.378   1.000   0.591 
k     :  0.000 (manipulability:  0.044, gain:  0.001, limit:  0.100, len:7)
nspace: -0.019  -0.001   0.528   0.019  -0.091  -0.094   0.020 
J     : -0.005  -0.042   0.101   0.111   0.000  -0.000  -0.000 
         0.016   0.553   0.048   0.365   0.027   0.177  -0.000 
         0.557  -0.004   0.397  -0.140  -0.107  -0.000  -0.180 
        -0.052   0.156   0.721   0.354  -0.789   0.188   0.000 
        -0.998   0.019  -0.686   0.240   0.595   0.000   1.000 
J#t   :  0.162  -3.578   1.818   5.766   3.115  -1.717  -1.758 
         0.088   1.399   0.048   0.474   0.571   0.189  -0.360 
         0.331   0.988   2.502  -1.889   1.576  -0.143   1.540 
        -0.126  -0.020   0.140  -0.105  -1.080   0.422   0.638 
         0.024   0.163   0.485  -0.370   0.325   0.070   1.248 
x     :  0.015   0.017  -0.018  -0.027   0.014 
J#x   :  0.104  -2.654  -0.759   7.410   3.639  -1.793  -3.528 
Ny    : -0.032   0.051   0.039  -0.017   0.008  -0.133  -0.007 
dav   :  0.072  -2.604  -0.720   7.393   3.648  -1.926  -3.534 
dav^  :  0.072  -2.604  -0.720   7.393   3.648  -1.926  -3.534 
loop:   7
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  501.903 1499.644 1019.537 / -3.138 0.104 -1.57>)
targe-coordst: (#<cascaded-coords #X7178668 handle0  500.0 1500.0 1020.0 / -2.449e-16 2.465e-32 1.571>)
vel-pos :  1.843  -0.659  -0.361 
vel-rot : -0.000   0.003 
vel-pos-norm :   1.990/  1.000
vel-rot-norm :   0.003/  0.017
angle :   -8.1   -42.7   -18.4   -75.5    76.3    34.6   -14.4 
usrwei:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
ocost : 18.900   0.031 313.915   0.323   1.646   0.741   0.692 
cost  : 19.241   0.015 667.721   0.130   1.948   0.674   1.010 
weight:  0.049   1.000   0.001   1.000   0.339   1.000   0.498 
k     :  0.000 (manipulability:  0.046, gain:  0.001, limit:  0.100, len:7)
nspace: -0.019  -0.000   0.001   0.004  -0.089  -0.085   0.029 
J     :  0.006  -0.030   0.117   0.105   0.000   0.000   0.000 
        -0.000   0.571   0.040   0.373   0.037   0.174   0.000 
         0.570   0.013   0.438  -0.123  -0.102  -0.000  -0.180 
        -0.104   0.144   0.653   0.372  -0.797   0.248  -0.000 
        -0.995  -0.015  -0.750   0.195   0.568   0.000   1.000 
J#t   :  1.726  -4.548   0.059   7.618   1.975  -1.847  -0.917 
         0.054   1.437  -0.000   0.407   0.458   0.053  -0.265 
         2.299  -0.048   0.072  -0.456  -0.105   1.145   2.480 
        -0.007  -0.161   0.003  -0.026  -1.039   0.805   0.587 
         0.408  -0.065   0.014  -0.094   0.030   0.407   1.414 
x     :  0.002  -0.001  -0.000  -0.000   0.003 
J#x   :  0.207  -0.544   0.007   0.782   0.208  -0.154   0.113 
Ny    : -0.001   0.034   0.001   0.006  -0.027  -0.117   0.014 
dav   :  0.206  -0.510   0.008   0.788   0.181  -0.271   0.128 
dav^  :  0.206  -0.510   0.008   0.788   0.181  -0.271   0.128 
loop:   8
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  500.105 1500.044 1020.014 / -3.142 0.104 -1.571>)
targe-coordst: (#<cascaded-coords #X7178668 handle0  500.0 1500.0 1020.0 / -2.449e-16 2.465e-32 1.571>)
vel-pos :  0.106   0.003   0.044 
vel-rot : -0.000   0.000 
vel-pos-norm :   0.115/  1.000
vel-rot-norm :   0.000/  0.017
#f(-7.93891 -43.1955 -18.4211 -74.7014 76.4677 34.3341 -14.2589 0.0 -3.0 45.0 0.0 -110.0 0.0 0.0 0.0 0.0 0.0 0.0 -17.54 42.976 -25.435 0.0 0.0 42.3033 0.0 0.0 -17.54 42.976 -25.435 0.0 0.0 7.86338 0.0 -2.0 0.0 -2.0)
30.irteusgl$ nil
30.irteusgl$ (send *robot* :larm :end-coords :assoc *kettle*)
#<room73b2-kettle-object #X5be3dd0 room73b2-kettle  500.0 1500.0 825.0 / -2.359e-16 0.0 0.0>
31.irteusgl$ (send *robot* :larm :move-end-pos #f(0 0 100) :world
      :debug-view t :look-at-target t)
loop:   1
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  500.105 1500.044 1020.014 / -3.142 0.104 -1.571>)
targe-coordst: (#<coordinates #X6d505a8  500.105 1500.044 1120.014 / -3.142 0.104 -1.571>)
vel-pos :-10.398 -99.458   0.001 
vel-rot :  0.000   0.000   0.000 
vel-pos-norm : 100.000/  1.000
vel-rot-norm :   0.000/  0.017
angle :   -7.9   -43.2   -18.4   -74.7    76.5    34.3   -14.3 
usrwei:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
ocost :100000000000000000000.000 100000000000000000000.000 100000000000000000000.000 100000000000000000000.000 100000000000000000000.000 100000000000000000000.000 100000000000000000000.000 
cost  : 20.263   0.011 660.614   0.111   1.965   0.665   0.997 
weight:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
k     :  0.000 (manipulability:  0.031, gain:  0.001, limit:  0.100, len:7)
nspace: -0.389  -0.000   0.542   0.003  -0.263  -0.083   0.058 
J     :  0.005  -0.030   0.117   0.104  -0.000   0.000   0.000 
        -0.001   0.573   0.041   0.375   0.037   0.174  -0.000 
         0.572   0.012   0.443  -0.122  -0.102  -0.000  -0.180 
        -0.104   0.137   0.647   0.367  -0.800   0.246  -0.000 
        -0.995  -0.014  -0.756   0.193   0.564   0.000   1.000 
         0.000   0.990  -0.101   0.910   0.203   0.969  -0.000 
J#t   : -0.981  -3.213   2.853   5.211   3.632  -2.074  -1.919 
        -0.275   2.318   0.356   0.269   0.047  -2.592  -0.050 
         1.560   0.390   0.953  -0.992   0.352   0.558   2.269 
        -0.254   0.083   0.257  -0.226  -0.986   0.361   0.542 
         0.166   0.107   0.284  -0.280   0.145   0.152   1.353 
         0.239  -0.485  -0.252   0.138   0.157   1.338  -0.075 
x     : -0.010  -0.099   0.000   0.000   0.000   0.000 
J#x   :  2.152 -11.294  -3.729  -4.639  -2.432  16.005   1.426 
Ny    : -0.169   0.061   0.169  -0.160   0.120   0.081  -0.076 
dav   :  1.983 -11.233  -3.560  -4.799  -2.312  16.086   1.350 
dav^  :  1.983 -11.233  -3.560  -4.799  -2.312  16.086   1.350 
loop:   2
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  508.016 1482.051 1115.192 / -3.111 0.103 -1.552>)
targe-coordst: (#<coordinates #X6d505a8  500.105 1500.044 1120.014 / -3.142 0.104 -1.571>)
vel-pos :  6.824  -5.901 -18.117 
vel-rot : -0.016   0.030   0.001 
vel-pos-norm :  20.239/  1.000
vel-rot-norm :   0.034/  0.017
angle :   -6.0   -54.4   -20.0   -79.5    74.2    50.4   -12.9 
usrwei:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
ocost : 20.263   0.011 660.614   0.111   1.965   0.665   0.997 
cost  : 36.160   0.060 1647.127   0.231   1.763   1.515   0.867 
weight:  0.027   0.944   0.001   0.813   1.000   0.398   1.000 
k     :  0.001 (manipulability:  0.023, gain:  0.001, limit:  0.100, len:7)
nspace: -0.012   0.003   0.000   0.009  -0.250  -0.071   0.047 
J     :  0.004   0.062   0.125   0.154   0.000   0.000   0.000 
         0.010   0.556   0.040   0.327   0.026   0.175   0.000 
         0.564  -0.011   0.439  -0.137  -0.139   0.000  -0.180 
        -0.102   0.133   0.490   0.420  -0.621   0.223   0.000 
        -0.995   0.005  -0.870   0.174   0.771  -0.000   1.000 
         0.019   0.991  -0.061   0.891   0.142   0.975   0.000 
J#t   :  1.502  -2.963   0.040   6.695   2.415  -3.483  -1.495 
        -0.205   3.129  -0.004  -1.174  -0.803  -1.981   0.601 
         2.038   0.321   0.045  -0.758  -0.592   0.413   2.628 
         0.001  -0.017   0.001   0.035  -1.512   0.206   1.160 
         0.364   0.053   0.008  -0.129  -0.102   0.071   1.465 
         0.046  -0.567  -0.000   0.242   0.503   1.304  -0.381 
x     :  0.007  -0.006  -0.018  -0.016   0.030   0.001 
J#x   : -0.822  -2.480  -0.016   3.561   3.085  -1.095  -2.061 
Ny    : -0.002   0.003   0.000  -0.004  -0.001   0.001  -0.000 
dav   : -0.824  -2.478  -0.016   3.557   3.083  -1.094  -2.061 
dav^  : -0.824  -2.478  -0.016   3.557   3.083  -1.094  -2.061 
loop:   3
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  500.599 1498.909 1119.881 / -3.141 0.105 -1.571>)
targe-coordst: (#<coordinates #X6d505a8  500.105 1500.044 1120.014 / -3.142 0.104 -1.571>)
vel-pos :  0.476  -0.184  -1.136 
vel-rot :  0.000   0.001  -0.001 
vel-pos-norm :   1.245/  1.000
vel-rot-norm :   0.001/  0.017
angle :   -6.8   -56.9   -20.0   -75.9    77.2    49.3   -15.0 
usrwei:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
ocost : 36.160   0.060 1647.127   0.231   1.763   1.515   0.867 
cost  : 27.858   0.076 1647.127   0.141   2.040   1.426   1.071 
weight:  1.000   0.929   0.001   1.000   0.329   1.000   0.483 
k     :  0.001 (manipulability:  0.023, gain:  0.001, limit:  0.100, len:7)
nspace: -0.413   0.004   0.000   0.004  -0.088  -0.172   0.031 
J     :  0.004   0.069   0.129   0.153   0.000   0.000   0.000 
        -0.001   0.564   0.032   0.334   0.030   0.174   0.000 
         0.571  -0.001   0.459  -0.124  -0.137  -0.000  -0.180 
        -0.105   0.118   0.451   0.414  -0.630   0.258  -0.000 
        -0.994  -0.013  -0.890   0.144   0.758   0.000   1.000 
        -0.000   0.993  -0.065   0.899   0.168   0.966   0.000 
J#t   :  1.864  -3.341   0.005   7.545   2.368  -4.002  -1.065 
        -0.312   3.159   0.000  -1.328  -0.975  -1.837   0.659 
         2.493   0.023   0.003  -0.063  -0.399   0.106   2.788 
         0.003  -0.041   0.002   0.071  -1.445   0.230   1.087 
         0.442  -0.003   0.001   0.000  -0.064   0.015   1.486 
         0.060  -0.562  -0.001   0.238   0.567   1.291  -0.411 
x     :  0.000  -0.000  -0.001   0.000   0.001  -0.001 
J#x   : -0.089  -0.091   0.000   0.209   0.044  -0.175  -0.099 
Ny    : -0.003   0.003   0.000  -0.005  -0.002   0.001  -0.000 
dav   : -0.091  -0.087   0.000   0.205   0.042  -0.174  -0.100 
dav^  : -0.091  -0.087   0.000   0.205   0.042  -0.174  -0.100 
loop:   4
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  500.149 1500.043 1120.005 / -3.142 0.104 -1.571>)
targe-coordst: (#<coordinates #X6d505a8  500.105 1500.044 1120.014 / -3.142 0.104 -1.571>)
vel-pos :  0.043  -0.014  -0.001 
vel-rot :  0.000   0.000   0.000 
vel-pos-norm :   0.045/  1.000
vel-rot-norm :   0.000/  0.017
angle :   -6.9   -57.0   -20.0   -75.7    77.3    49.2   -15.1 
usrwei:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
ocost : 27.858   0.076 1647.127   0.141   2.040   1.426   1.071 
cost  : 27.117   0.077 1647.127   0.136   2.044   1.412   1.082 
weight:  1.000   0.929   0.001   1.000   0.328   1.000   0.480 
k     :  0.001 (manipulability:  0.023, gain:  0.001, limit:  0.100, len:7)
nspace: -0.411   0.004   0.000   0.004  -0.088  -0.171   0.031 
J     :  0.005   0.069   0.130   0.152   0.000   0.000  -0.000 
        -0.001   0.564   0.032   0.335   0.031   0.174   0.000 
         0.572  -0.001   0.459  -0.124  -0.136  -0.000  -0.180 
        -0.104   0.119   0.451   0.414  -0.632   0.260   0.000 
        -0.995  -0.012  -0.890   0.144   0.756   0.000   1.000 
         0.000   0.993  -0.065   0.899   0.170   0.966   0.000 
J#t   :  1.865  -3.355   0.005   7.564   2.364  -4.008  -1.059 
        -0.309   3.153   0.000  -1.320  -0.973  -1.838   0.656 
         2.488   0.029   0.003  -0.074  -0.397   0.111   2.783 
         0.003  -0.041   0.002   0.071  -1.440   0.232   1.080 
         0.441  -0.002   0.001  -0.002  -0.063   0.016   1.485 
         0.060  -0.561  -0.001   0.237   0.567   1.290  -0.411 
x     :  0.000  -0.000  -0.000   0.000   0.000   0.000 
J#x   :  0.005  -0.011   0.000   0.019   0.007  -0.008  -0.003 
Ny    : -0.003   0.003   0.000  -0.005  -0.002   0.001  -0.000 
dav   :  0.002  -0.007   0.000   0.015   0.005  -0.007  -0.004 
dav^  :  0.002  -0.007   0.000   0.015   0.005  -0.007  -0.004 
loop:   5
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  500.117 1500.052 1120.007 / -3.142 0.104 -1.571>)
targe-coordst: (#<coordinates #X6d505a8  500.105 1500.044 1120.014 / -3.142 0.104 -1.571>)
vel-pos :  0.011  -0.008   0.008 
vel-rot :  0.000   0.000   0.000 
vel-pos-norm :   0.016/  1.000
vel-rot-norm :   0.000/  0.017
#f(-6.86932 -57.0012 -19.9991 -75.7242 77.2858 49.1445 -15.0728 0.0 -3.0 45.0 0.0 -110.0 0.0 0.0 0.0 0.0 0.0 0.0 -17.54 42.976 -25.435 0.0 0.0 20.6288 0.0 0.0 -17.54 42.976 -25.435 0.0 0.0 8.87905 0.0 -2.0 0.0 -2.0)
32.irteusgl$ (send-all (send *room* :objects) :name)
("room73b2-73b2-ground" "room73b2-locker2" "room73b2-locker1" "room73b2-door-left" "room73b2-door-right" "room73b2-clock" "room73b2-broom" "room73b2-bamboo-broom" "room73b2-azuma-broom" "room73b2-azuma-short-broom" "room73b2-coe-800-shelf" "room73b2-coe-450-shelf" "room73b2-uchida-shelf-1100" "room73b2-uchida-shelf-1300" "room73b2-uchida-shelf-1300" "room73b2-uchida-shelf-1300" "room73b2-uchida-shelf-1300" "room73b2-uchida-shelf-1300" "room73b2-uchida-shelf-1300" "room73b2-bariera-1200-right" "room73b2-bariera-1200-middle3-0" "room73b2-bariera-1200-middle3-1" "room73b2-bariera-1200-middle2" "room73b2-bariera-1200-middle-0" "room73b2-bariera-1200-middle-1" "room73b2-bariera-1200-middle-2" "room73b2-bariera-1200-corner" "room73b2-hitachi-fiesta-refrigerator" "room73b2-chair1" "room73b2-chair0" "room73b2-empty-box" "room73b2-bottle" "room73b2-sushi-cup2" "room73b2-trashbox0" "room73b2-meeting-table" "room73b2-x-leg-desk" "room73b2-bed" "room73b2-hrp2-parts-drawer" "room73b2-plus-590-locker" "room73b2-sharp-52-aquostv" "room73b2-askul-1200x700-desk-0" "room73b2-askul-1200x700-desk-1" "room73b2-askul-1200x700-desk-2" "room73b2-askul-1200x700-desk-3" "room73b2-askul-1200x700-desk-4" "room73b2-askul-1200x700-desk-5" "room73b2-hrp2-rack" "room73b2-uchida-shelf-1100" "room73b2-askul-1000x700-desk" "room73b2-uchida-shelf-1300" "room73b2-askul-1200x700-desk-6" "room73b2-cupboard-right" "room73b2-cupboard-left" "room73b2-toshiba-clacio-refrigerator" "room73b2-bariera-1400-middle" "room73b2-bariera-900-middle-0" "room73b2-bariera-900-middle-1" "room73b2-bariera-900-left" "room73b2-askul-1400-desk" "room73b2-desk-0" "room73b2-desk-1" "room73b2-desk-2" "room73b2-unknown-1200-desk-0" "room73b2-unknown-1200-desk-1" "room73b2-unknown-1200-desk-2" "room73b2-unknown-1200-desk-3" "room73b2-unknown-1200-desk-4" "room73b2-panelwall-1" "room73b2-panelwall-0" "room73b2-sushi-cup" "room73b2-mug-cup" "room73b2-tray" "room73b2-kettle" "room73b2-knife" "room73b2-sponge" "room73b2-cup" "room73b2-dish" "room73b2-kitchen-shelf" "room73b2-kitchen" "/eng2/7f/room73B2-beside-bed" "/eng2/7f/room73B2-front-of-kitchenboard" "/eng2/7f/room73B2-sink-front" "/eng2/7f/room73B2-trashbox-front" "/eng2/7f/room73B2-beside-chair" "/eng2/7f/room73B2-far-chair-back" "/eng2/7f/room73B2-tmp-chair-back" "/eng2/7f/room73B2-chair-back" "/eng2/7f/room73B2-table-front" "/eng2/7f/room73B2-table-back" "/eng2/7f/room73B2-table-side" "/eng2/7f/room73B2-front-kitchen-table" "/eng2/7f/room73B2-front-of-tv" "door-spot" "coe-spot" "broom-spot" "table-spot" "cook-spot" "init-spot")
33.irteusgl$ (send *robot* :move-to (send *room* :spot "table-spot") :world)
#<h7-robot #X755bc98 h7  5000.0 1250.0 0.0 / 1.571 0.0 0.0>
34.irteusgl$ (send *robot* :locate #f(-100 -100 550)
)
#<h7-robot #X755bc98 h7  5100.0 1150.0 550.0 / 1.571 0.0 0.0>
35.irteusgl$ (send *robot* :locate #f(-500 -500 550)
)
#<h7-robot #X755bc98 h7  5600.0 650.0 1100.0 / 1.571 0.0 0.0>
36.irteusgl$ (send *robot* :locate #f(-500 000 550))
#<h7-robot #X755bc98 h7  5600.0 150.0 1650.0 / 1.571 0.0 0.0>
37.irteusgl$ (send *robot* :locate #f(-000 000 550))
#<h7-robot #X755bc98 h7  5600.0 150.0 2200.0 / 1.571 0.0 0.0>
38.irteusgl$ (send *robot* :move-to (send *room* :spot "table-spot") :world)
#<h7-robot #X755bc98 h7  5000.0 1250.0 0.0 / 1.571 0.0 0.0>
39.irteusgl$ (send *robot* :locate #f(-500 000 550))
#<h7-robot #X755bc98 h7  5000.0 750.0 550.0 / 1.571 0.0 0.0>
40.irteusgl$ (send *robot* :locate #f(-200 000 0))
#<h7-robot #X755bc98 h7  5000.0 550.0 550.0 / 1.571 0.0 0.0>
41.irteusgl$ (send *robot* :locate #f(-300 000 0))
#<h7-robot #X755bc98 h7  5000.0 250.0 550.0 / 1.571 0.0 0.0>
42.irteusgl$ (send *room* :spot "room73b2-bottle")
could not found spot(room73b2-bottle)nil
43.irteusgl$ (setq *table-front* (send *room* :object "room73b2-kettle"))
#<room73b2-kettle-object #X5be3dd0 room73b2-kettle  4900.006 849.99 924.993 / -1.571 8.634e-06 -1.003e-05>
44.irteusgl$ (send *robot* :larm :inverse-kinematics
      (*table-front*)
      :link-list (send *robot* :link-list (send *robot* :larm :end-coords :parent))
      :move-target (send *robot* :larm :end-coords)
      :rotation-axis :z
      :debug-view t)

irteusgl 0 error: undefined function *table-front* in (send *robot* :larm :inverse-kinematics (*table-front*) :link-list (send *robot* :link-list (send *robot* :larm :end-coords :parent)) :move-target (send *robot* :larm :end-coords) :rotation-axis :z :debug-view t)
45.E1-irteusgl$ nil
45.E1-irteusgl$ reset
46.irteusgl$ (send *robot* :larm :inverse-kinematics
      *table-front*
      :link-list (send *robot* :link-list (send *robot* :larm :end-coords :parent))
      :move-target (send *robot* :larm :end-coords)
      :rotation-axis :z
      :debug-view t)

loop:   1
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  4900.052 849.883 1120.007 / 1.571 0.104 -1.571>)
targe-coordst: (#<room73b2-kettle-object #X5be3dd0 room73b2-kettle  4900.006 849.99 924.993 / -1.571 8.634e-06 -1.003e-05>)
vel-pos : 10.452  99.452   0.022 
vel-rot :  0.497  -0.052 
vel-pos-norm : 100.000/  1.000
vel-rot-norm :   0.500/  0.017
angle :   -6.9   -57.0   -20.0   -75.7    77.3    49.1   -15.1 
usrwei:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
ocost :100000000000000000000.000 100000000000000000000.000 100000000000000000000.000 100000000000000000000.000 100000000000000000000.000 100000000000000000000.000 100000000000000000000.000 
cost  : 27.133   0.077 1647.127   0.136   2.045   1.411   1.082 
weight:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
k     :  0.000 (manipulability:  0.037, gain:  0.001, limit:  0.100, len:7)
nspace: -0.411   0.005   0.573   0.004  -0.268  -0.171   0.064 
J     :  0.005   0.069   0.130   0.152   0.000  -0.000   0.000 
        -0.001   0.564   0.032   0.335   0.031   0.174   0.000 
         0.572  -0.001   0.459  -0.124  -0.136  -0.000  -0.180 
        -0.104   0.119   0.451   0.414  -0.632   0.260  -0.000 
        -0.995  -0.012  -0.890   0.144   0.756   0.000   1.000 
J#t   : -1.328  -1.854   3.218   4.519   3.525  -3.885  -1.794 
         0.472   1.680  -0.662  -0.185  -0.035   0.777  -0.047 
         1.602   0.199   0.929  -0.907   0.211   0.894   2.391 
        -0.207  -0.128   0.230  -0.110  -1.155   0.789   0.886 
         0.224  -0.028   0.239  -0.189   0.163   0.383   1.338 
x     :  0.010   0.099   0.000   0.497  -0.052 
J#x   : -4.665   4.885   4.003  -0.921 -31.473  23.436  19.932 
Ny    : -0.249   0.204   0.237  -0.281  -0.005  -0.167   0.010 
dav   : -4.914   5.089   4.240  -1.202 -31.478  23.270  19.942 
dav^  : -4.914   5.089   4.240  -1.202 -31.478  23.270  19.942 
loop:   2
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  4875.596 832.635 1019.294 / 1.791 0.49 -1.14>)
targe-coordst: (#<room73b2-kettle-object #X5be3dd0 room73b2-kettle  4810.672 751.661 854.192 / -1.398 -0.394 -0.411>)
vel-pos : 10.452  99.452   0.022 
vel-rot :  0.497  -0.052 
vel-pos-norm : 100.000/  1.000
vel-rot-norm :   0.500/  0.017
angle :  -11.8   -51.9   -15.8   -76.9    45.8    72.4     4.9 
usrwei:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
ocost : 27.133   0.077 1647.127   0.136   2.045   1.411   1.082 
cost  :  9.074   0.044  91.460   0.165   0.602   8.239   0.282 
weight:  1.000   1.000   1.000   0.858   1.000   0.108   1.000 
k     :  0.001 (manipulability:  0.017, gain:  0.001, limit:  0.100, len:7)
nspace: -0.312   0.002   0.492   0.005  -0.116  -0.040  -0.007 
J     :  0.090   0.181   0.189   0.180   0.000   0.000  -0.000 
         0.184   0.483   0.099   0.210  -0.005   0.179   0.000 
         0.516  -0.181   0.431  -0.198  -0.172  -0.000  -0.180 
        -0.470   0.364   0.126   0.601  -0.301  -0.085   0.000 
        -0.802   0.204  -0.978   0.211   0.953   0.000   1.000 
J#t   : -1.314  -1.187   3.465   3.140   8.402  -0.614  -6.080 
         1.384   2.133  -1.526  -1.028  -2.329   0.309   1.615 
         1.479  -0.586   0.825  -0.675  -4.003   0.195   6.057 
        -0.218  -0.097   0.249   0.124  -2.731   0.084   2.659 
         0.276  -0.139   0.138  -0.058  -0.650   0.042   2.012 
x     :  0.010   0.099   0.000   0.497  -0.052 
J#x   :  0.073   9.084   0.062  -0.257 -84.108   3.661  75.348 
Ny    : -0.161   0.127   0.170  -0.220   0.041  -0.016   0.018 
dav   : -0.088   9.211   0.231  -0.477 -84.067   3.646  75.366 
dav^  : -0.088   9.211   0.231  -0.477 -84.067   3.646  75.366 
loop:   3
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  4763.983 772.601 1003.78 / 2.528 0.217 -0.427>)
targe-coordst: (#<room73b2-kettle-object #X5be3dd0 room73b2-kettle  4660.183 629.774 920.977 / -0.71 -0.173 -1.125>)
vel-pos : 10.452  99.452   0.022 
vel-rot :  0.497  -0.052 
vel-pos-norm : 100.000/  1.000
vel-rot-norm :   0.500/  0.017
angle :  -11.9   -42.7   -15.5   -77.4   -38.3    76.1    45.0 
usrwei:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
ocost :  9.074   0.044  91.460   0.165   0.602   8.239   0.282 
cost  :  8.936   0.014  82.224   0.177   0.155  13.174 1288.992 
weight:  1.000   1.000   1.000   0.850   1.000   0.071   0.001 
k     :  0.000 (manipulability:  0.045, gain:  0.001, limit:  0.100, len:7)
nspace: -0.311  -0.000   0.487   0.005   0.017  -0.029  -0.000 
J     :  0.321   0.057   0.313   0.030   0.000  -0.000   0.000 
         0.327   0.277   0.132  -0.002  -0.031   0.127   0.000 
         0.227  -0.374   0.205  -0.282  -0.175  -0.000  -0.180 
        -0.215   0.897   0.138   0.977  -0.170  -0.707  -0.000 
        -0.405   0.278  -0.915   0.189   0.971   0.000   1.000 
J#t   : -1.171  -0.482   4.391   0.543   3.685   0.458   0.000 
         2.605   1.726  -2.861  -1.059  -1.901  -0.162   0.000 
         5.697  -3.515  -5.471   3.414  -2.456  -1.931   0.005 
         1.291  -0.708  -1.329   1.568  -0.822  -0.594   0.001 
         1.372  -0.739  -1.350   0.918   0.358  -0.432   0.002 
x     :  0.010   0.099   0.000   0.497  -0.052 
J#x   : 46.857  -8.426 -47.535  36.248 -33.110 -16.288   0.034 
Ny    : -0.069   0.072   0.071  -0.120   0.041  -0.050  -0.000 
dav   : 46.789  -8.355 -47.464  36.128 -33.068 -16.337   0.033 
dav^  : 46.789  -8.355 -47.464  36.128 -33.068 -16.337   0.033 
loop:   4
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  4750.129 806.046 992.287 / 2.523 -0.183 0.387>)
targe-coordst: (#<room73b2-kettle-object #X5be3dd0 room73b2-kettle  4640.445 663.662 1067.962 / -0.716 0.143 -1.973>)
vel-pos : 10.452  99.452   0.022 
vel-rot :  0.497  -0.052 
vel-pos-norm : 100.000/  1.000
vel-rot-norm :   0.500/  0.017
angle :    0.0   -51.1   -20.0   -41.3   -71.3    59.7    45.0 
usrwei:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
ocost :  8.936   0.014  82.224   0.177   0.155  13.174 1288.992 
cost  :1288.992   0.038 1647.127   0.971   0.519   2.697 1288.992 
weight:  0.001   0.963   0.001   0.507   0.658   1.000   0.001 
k     :  0.000 (manipulability:  0.056, gain:  0.001, limit:  0.100, len:7)
nspace: -0.000   0.001   0.000  -0.049   0.066  -0.252  -0.000 
J     :  0.340  -0.163   0.389  -0.094   0.000   0.000   0.000 
         0.369  -0.102   0.232  -0.189  -0.064   0.127   0.000 
        -0.218  -0.506  -0.173  -0.237  -0.155   0.000  -0.180 
         0.182   0.801   0.500   0.865  -0.357  -0.707  -0.000 
         0.371   0.481  -0.211   0.161   0.864   0.000   1.000 
J#t   :  0.539  -2.271   0.590   2.541   0.844   0.638  -0.067 
         0.022   6.594  -0.077 -12.833  -1.430  -7.530   0.074 
        -0.201   0.253  -0.250  -4.388   0.609  -5.597   0.050 
         0.007   1.155  -0.013  -2.240  -0.256  -2.719   0.015 
        -0.032   1.015  -0.057  -2.673   1.053  -2.690   0.022 
x     :  0.010   0.099   0.000   0.497  -0.052 
J#x   :  0.749  66.086  -0.284 -127.475 -18.085 -111.979   0.752 
Ny    : -0.001   0.010   0.000  -0.021   0.000  -0.015  -0.001 
dav   :  0.747  66.096  -0.284 -127.496 -18.084 -111.995   0.751 
dav^  :  0.747  66.096  -0.284 -127.496 -18.084 -111.995   0.751 
loop:   5
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  4647.829 538.895 918.463 / 2.38 0.462 1.535>)
targe-coordst: (#<room73b2-kettle-object #X5be3dd0 room73b2-kettle  4567.229 606.09 1082.838 / -0.766 -0.566 -3.103>)
vel-pos : 10.452  99.452   0.022 
vel-rot :  0.497  -0.052 
vel-pos-norm : 100.000/  1.000
vel-rot-norm :   0.500/  0.017
angle :    0.0    15.0   -20.0  -140.0   -89.4   -52.3    45.0 
usrwei:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
ocost :1288.992   0.038 1647.127   0.971   0.519   2.697 1288.992 
cost  :1288.992   0.587 1647.127 2005.248   0.965   1.684 1288.992 
weight:  0.001   0.630   0.001   0.000   0.509   1.000   0.001 
k     :  0.001 (manipulability:  0.022, gain:  0.001, limit:  0.100, len:7)
nspace: -0.000  -0.071   0.000   0.000   0.089   0.193  -0.000 
J     :  0.016  -0.002   0.049   0.134   0.000  -0.000  -0.000 
         0.021  -0.287   0.135  -0.296  -0.078   0.127  -0.000 
        -0.358  -0.149  -0.057   0.129   0.142  -0.000  -0.180 
        -0.446   0.648   0.712   0.701  -0.433  -0.707   0.000 
         0.894   0.348   0.040   0.006  -0.791   0.000   1.000 
J#t   :  0.024  -0.063   0.047   0.106   0.002   0.077   0.001 
         0.033  -3.523   0.046  -0.045  -1.636  -2.213  -0.029 
        -0.115  -1.504  -0.109   0.121  -0.459  -1.083   0.069 
         0.004  -0.620   0.009  -0.008  -0.294  -1.795  -0.006 
        -0.025   0.423  -0.029   0.030  -1.016   1.007   0.021 
x     :  0.010   0.099   0.000   0.497  -0.052 
J#x   :  0.385 -39.036   0.645  -0.504 -14.661 -66.696  -0.407 
Ny    : -0.001   0.002   0.001   0.000  -0.000   0.004  -0.000 
dav   :  0.385 -39.033   0.645  -0.504 -14.661 -66.693  -0.407 
dav^  :  0.385 -39.033   0.645  -0.504 -14.661 -66.693  -0.407 
loop:   6
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  4638.555 573.764 1048.476 / 2.424 0.395 1.625>)
targe-coordst: (#<room73b2-kettle-object #X5be3dd0 room73b2-kettle  4575.176 643.07 1219.387 / -0.712 -0.499 3.085>)
vel-pos : 10.452  99.452   0.022 
vel-rot :  0.497  -0.052 
vel-pos-norm : 100.000/  1.000
vel-rot-norm :   0.500/  0.017
angle :    0.0   -24.0   -19.4  -140.0  -104.1   -90.0    44.6 
usrwei:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
ocost :1288.992   0.587 1647.127 2005.248   0.965   1.684 1288.992 
cost  :1288.992   0.139 1647.127 2005.248   1.757 2578.230 1288.992 
weight:  0.001   1.000   0.001   0.000   0.363   0.000   0.001 
k     :  0.001 (manipulability:  0.016, gain:  0.001, limit:  0.100, len:7)
nspace: -0.000  -0.014   0.000   0.000   0.090   0.000  -0.000 
J     :  0.050   0.076   0.057   0.130   0.000   0.000  -0.000 
        -0.000  -0.291   0.124  -0.112  -0.000   0.128   0.000 
        -0.388  -0.031  -0.157   0.214   0.180  -0.000  -0.180 
        -0.385   0.695   0.398   0.854  -0.000  -0.702  -0.000 
         0.922   0.254   0.643  -0.000  -1.000   0.000   1.000 
J#t   :  0.088   0.161   0.021   0.034   0.137   0.037  -0.000 
        -0.120  -0.842   0.189   0.126  -0.208  -0.066   0.000 
        -0.203  -0.171  -0.046   0.118  -0.098   0.011   0.000 
        -0.057   1.068   0.078   0.047   0.262  -0.033  -0.001 
        -0.034  -0.029  -0.007   0.021  -1.010   0.002   0.002 
x     :  0.010   0.099   0.000   0.497  -0.052 
J#x   : -2.138  25.821   3.319   2.022   9.364  -1.288  -0.020 
Ny    : -0.000  -0.000   0.000   0.000  -0.000   0.000  -0.000 
dav   : -2.138  25.820   3.319   2.022   9.364  -1.287  -0.020 
dav^  : -2.138  25.820   3.319   2.022   9.364  -1.287  -0.020 
loop:   7
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  4661.89 547.685 912.784 / 2.452 0.7 2.01>)
targe-coordst: (#<room73b2-kettle-object #X5be3dd0 room73b2-kettle  4615.129 693.198 1033.903 / -0.627 -0.793 2.66>)
vel-pos : 10.452  99.452   0.022 
vel-rot :  0.497  -0.052 
vel-pos-norm : 100.000/  1.000
vel-rot-norm :   0.500/  0.017
angle :   -2.1     1.8   -16.0  -138.0   -94.7   -90.0    44.6 
usrwei:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
ocost :1288.992   0.139 1647.127 2005.248   1.757 2578.230 1288.992 
cost  :281.903   0.380 104.701 490.408   1.181 2578.230 1288.992 
weight:  1.000   0.724   1.000   1.000   1.000   0.000   0.001 
k     :  0.001 (manipulability:  0.022, gain:  0.001, limit:  0.100, len:7)
nspace: -0.520  -0.050   0.497   0.540   0.200   0.000  -0.000 
J     :  0.046   0.076   0.054   0.163  -0.000   0.000   0.000 
        -0.115  -0.317   0.107  -0.135  -0.000   0.128   0.000 
        -0.334  -0.024  -0.174   0.189   0.180   0.000  -0.180 
        -0.644   0.608   0.485   0.758  -0.000  -0.702   0.000 
         0.692   0.205   0.669  -0.000  -1.000   0.000   1.000 
J#t   :  4.507  -3.496   1.521   5.671   3.416   0.003  -0.003 
        -0.254  -2.539   2.082   0.490   0.696   0.001  -0.001 
        -1.525  -1.780  -3.707   2.509  -3.892   0.002   0.003 
        -0.653   0.766   0.972  -0.474   0.354  -0.001  -0.000 
        -0.261  -0.324  -0.653   0.458  -1.681   0.000   0.001 
x     :  0.010   0.099   0.000   0.497  -0.052 
J#x   :-16.576   6.226  42.403  -8.673  21.110  -0.015  -0.016 
Ny    :  0.007  -0.007   0.006   0.008   0.007   0.000  -0.000 
dav   :-16.569   6.219  42.409  -8.664  21.117  -0.015  -0.017 
dav^  :-16.569   6.219  42.409  -8.664  21.117  -0.015  -0.017 
loop:   8
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  4693.151 638.122 956.92 / 2.066 0.4 2.447>)
targe-coordst: (#<room73b2-kettle-object #X5be3dd0 room73b2-kettle  4792.337 768.036 1063.293 / -0.986 -0.466 2.228>)
vel-pos : 10.452  99.452   0.022 
vel-rot :  0.497  -0.052 
vel-pos-norm : 100.000/  1.000
vel-rot-norm :   0.500/  0.017
angle :  -18.7     8.0    26.4  -140.0   -73.6   -90.0    44.6 
usrwei:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
ocost :281.903   0.380 104.701 490.408   1.181 2578.230 1288.992 
cost  :  3.430   0.466   0.416 2005.248   0.559 2578.230 1288.992 
weight:  1.000   0.682   1.000   0.000   1.000   0.000   0.001 
k     :  0.000 (manipulability:  0.030, gain:  0.001, limit:  0.100, len:7)
nspace: -0.196  -0.060   0.021   0.000   0.108   0.000  -0.000 
J     : -0.006   0.012   0.029   0.220   0.000   0.000  -0.000 
        -0.319  -0.275   0.071  -0.177  -0.000   0.128   0.000 
        -0.262   0.155  -0.180   0.118   0.180   0.000  -0.180 
        -0.390   0.674   0.675   0.472  -0.000  -0.702   0.000 
         0.590  -0.340   0.643  -0.000  -1.000   0.000   1.000 
J#t   :  0.235  -0.342   0.397   0.206   0.522   0.016  -0.000 
        -1.436  -1.724   0.895  -0.004   0.314   0.000  -0.000 
        -3.009   2.391  -4.128   0.018  -5.228   0.002   0.004 
        -0.161   0.439   0.950  -0.007   0.365  -0.001  -0.000 
        -0.533   0.423  -0.731   0.003  -1.924   0.000   0.001 
x     :  0.010   0.099   0.000   0.497  -0.052 
J#x   :-11.055   1.216  34.590  -0.103  18.233  -0.017  -0.014 
Ny    :  0.000  -0.001   0.001   0.000   0.001   0.000  -0.000 
dav   :-11.055   1.215  34.591  -0.103  18.234  -0.017  -0.014 
dav^  :-11.055   1.215  34.591  -0.103  18.234  -0.017  -0.014 
loop:   9
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  4758.422 697.524 1005.668 / 1.776 0.28 2.864>)
targe-coordst: (#<room73b2-kettle-object #X5be3dd0 room73b2-kettle  4934.045 769.099 1051.101 / -1.26 -0.307 1.818>)
vel-pos : 10.452  99.452   0.022 
vel-rot :  0.497  -0.052 
vel-pos-norm : 100.000/  1.000
vel-rot-norm :   0.500/  0.017
angle :  -29.8     9.3    61.0  -140.0   -55.4   -90.0    44.5 
usrwei:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
ocost :  3.430   0.466   0.416 2005.248   0.559 2578.230 1288.992 
cost  :  1.100   0.485   1.171 2005.248   0.306 2578.230 1288.992 
weight:  1.000   0.673   0.461   0.000   1.000   0.000   0.001 
k     :  0.000 (manipulability:  0.037, gain:  0.001, limit:  0.100, len:7)
nspace: -0.066  -0.062  -0.044   0.000   0.051   0.000  -0.000 
J     : -0.046   0.007   0.007   0.246  -0.000  -0.000   0.000 
        -0.425  -0.151   0.030  -0.195  -0.000   0.128  -0.000 
        -0.107   0.276  -0.186   0.043   0.180  -0.000  -0.180 
        -0.276   0.637   0.755   0.172  -0.000  -0.701  -0.000 
         0.264  -0.670   0.643  -0.000  -1.000   0.000   1.000 
J#t   : -0.383   0.101  -0.279   0.296  -0.360  -0.002   0.000 
        -2.025  -0.830  -0.035  -0.027   0.001   0.001  -0.000 
        -1.602   3.838  -3.817  -0.021  -5.432   0.002   0.004 
        -0.076   0.412   0.948  -0.004   0.313  -0.001  -0.000 
        -0.284   0.682  -0.678  -0.004  -1.963   0.000   0.002 
x     :  0.010   0.099   0.000   0.497  -0.052 
J#x   :-13.081   5.051  28.662  -0.074  14.538  -0.017  -0.011 
Ny    : -0.000  -0.000   0.000   0.000   0.000   0.000  -0.000 
dav   :-13.081   5.051  28.662  -0.074  14.539  -0.017  -0.012 
dav^  :-13.081   5.051  28.662  -0.074  14.539  -0.017  -0.012 
loop:  10
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  4854.87 723.466 1025.58 / 1.551 0.275 -2.981>)
targe-coordst: (#<room73b2-kettle-object #X5be3dd0 room73b2-kettle  5046.495 730.793 990.128 / -1.485 -0.257 1.382>)
vel-pos : 10.452  99.452   0.022 
vel-rot :  0.497  -0.052 
vel-pos-norm : 100.000/  1.000
vel-rot-norm :   0.500/  0.017
angle :  -42.8    14.3    89.6  -140.0   -40.8   -90.0    44.5 
usrwei:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
ocost :  1.100   0.485   1.171 2005.248   0.306 2578.230 1288.992 
cost  :  0.123   0.573  56.917 2005.248   0.175 2578.230 1288.992 
weight:  1.000   0.636   0.017   0.000   1.000   0.000   0.001 
k     :  0.000 (manipulability:  0.041, gain:  0.001, limit:  0.100, len:7)
nspace: -0.001  -0.070  -0.008   0.000   0.021   0.000  -0.000 
J     : -0.047   0.021  -0.011   0.249  -0.000  -0.000   0.000 
        -0.437  -0.007  -0.005  -0.197  -0.000   0.128  -0.000 
         0.084   0.310  -0.185  -0.020   0.180  -0.000  -0.180 
        -0.271   0.640   0.764  -0.081  -0.000  -0.701   0.000 
        -0.154  -0.766   0.643  -0.000  -1.000   0.000   1.000 
J#t   : -0.388   0.442  -0.469   0.343  -0.593  -0.008   0.000 
        -2.186  -0.000  -0.747  -0.044  -0.131   0.016   0.000 
         0.174   3.346  -2.635  -0.047  -4.239   0.050   0.003 
        -0.057   0.625   0.734   0.001  -0.008  -0.013   0.000 
         0.031   0.595  -0.468  -0.008  -1.752   0.009   0.001 
x     :  0.010   0.099   0.000   0.497  -0.052 
J#x   :-14.394  16.311  17.766   0.012   3.890  -0.324  -0.003 
Ny    : -0.000   0.001  -0.001   0.000  -0.002   0.000  -0.000 
dav   :-14.394  16.313  17.764   0.012   3.888  -0.324  -0.003 
dav^  :-14.394  16.313  17.764   0.012   3.888  -0.324  -0.003 
loop:  11
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  4938.188 701.169 949.933 / 1.391 0.484 -2.692>)
targe-coordst: (#<room73b2-kettle-object #X5be3dd0 room73b2-kettle  5106.171 648.967 865.748 / -1.648 -0.437 1.075>)
vel-pos : 10.452  99.452   0.022 
vel-rot :  0.497  -0.052 
vel-pos-norm : 100.000/  1.000
vel-rot-norm :   0.500/  0.017
angle :  -57.2    30.6    95.0  -140.0   -36.9   -90.0    44.5 
usrwei:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
ocost :  0.123   0.573  56.917 2005.248   0.175 2578.230 1288.992 
cost  :  0.807   1.010 1647.127 2005.248   0.145 2578.230 1288.992 
weight:  0.553   0.498   0.001   0.000   1.000   0.000   0.001 
k     :  0.000 (manipulability:  0.039, gain:  0.001, limit:  0.100, len:7)
nspace:  0.023  -0.089  -0.000   0.000   0.015   0.000  -0.000 
J     : -0.030   0.027  -0.015   0.247  -0.000   0.000   0.000 
        -0.375   0.019  -0.014  -0.196  -0.000   0.128   0.000 
         0.198   0.308  -0.184  -0.037   0.180   0.000  -0.180 
        -0.465   0.646   0.757  -0.149  -0.000  -0.701   0.000 
        -0.385  -0.763   0.643   0.000  -1.000   0.000   1.000 
J#t   : -0.194   0.112  -0.074   0.316  -0.056   0.027   0.000 
        -1.916  -0.893  -0.182  -0.073   1.368   0.115  -0.001 
         1.185   1.549  -0.259  -0.091  -1.705   0.162   0.001 
        -0.254   1.149   0.079   0.013  -0.754  -0.049   0.001 
         0.212   0.276  -0.046  -0.016  -1.303   0.029   0.001 
x     :  0.010   0.099   0.000   0.497  -0.052 
J#x   :-18.907  26.892   1.313   0.195  -9.857  -0.808   0.008 
Ny    : -0.000   0.000  -0.000   0.000  -0.000   0.000  -0.000 
dav   :-18.907  26.892   1.313   0.196  -9.857  -0.807   0.007 
dav^  :-18.907  26.892   1.313   0.196  -9.857  -0.807   0.007 
loop:  12
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  5001.18 646.24 862.427 / 1.173 0.645 -2.329>)
targe-coordst: (#<room73b2-kettle-object #X5be3dd0 room73b2-kettle  5097.504 531.483 737.595 / -1.884 -0.568 0.709>)
vel-pos : 10.452  99.452   0.022 
vel-rot :  0.497  -0.052 
vel-pos-norm : 100.000/  1.000
vel-rot-norm :   0.500/  0.017
angle :  -76.1    57.5    95.0  -139.8   -46.8   -90.0    44.5 
usrwei:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
ocost :  0.807   1.010 1647.127 2005.248   0.145 2578.230 1288.992 
cost  :  6.492   3.597 1647.127 2005.248   0.224 2578.230 1288.992 
weight:  0.133   0.218   0.001   0.000   0.817   0.000   0.001 
k     :  0.000 (manipulability:  0.032, gain:  0.001, limit:  0.100, len:7)
nspace:  0.037  -0.072  -0.000   0.000   0.026   0.000  -0.000 
J     : -0.036  -0.003  -0.004   0.250  -0.000   0.000   0.000 
        -0.242   0.039   0.009  -0.198  -0.000   0.128   0.000 
         0.295   0.310  -0.187   0.006   0.180   0.000  -0.180 
        -0.601   0.641   0.764   0.023  -0.000  -0.701  -0.000 
        -0.580  -0.761   0.646   0.000  -1.000  -0.000   1.000 
J#t   : -0.300  -0.212  -0.032   0.251   0.330   0.010  -0.000 
        -1.360  -0.692  -0.165  -0.144   1.272   0.151  -0.001 
         1.903   2.126  -0.099  -0.053  -2.736   0.086   0.003 
        -0.453   0.995   0.040   0.025  -0.482  -0.035   0.000 
         0.338   0.377  -0.017  -0.009  -1.484   0.015   0.001 
x     :  0.010   0.099   0.000   0.497  -0.052 
J#x   :-21.849  23.167   0.233   0.066  -1.880  -0.169   0.002 
Ny    : -0.000  -0.000  -0.000   0.000  -0.000   0.000  -0.000 
dav   :-21.849  23.167   0.233   0.067  -1.880  -0.169   0.001 
dav^  :-21.849  23.167   0.233   0.067  -1.880  -0.169   0.001 
loop:  13
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  4979.265 609.791 808.197 / 1.22 0.824 -1.873>)
targe-coordst: (#<room73b2-kettle-object #X5be3dd0 room73b2-kettle  4991.559 475.394 667.425 / -1.881 -0.724 0.274>)
vel-pos : 10.452  99.452   0.022 
vel-rot :  0.497  -0.052 
vel-pos-norm : 100.000/  1.000
vel-rot-norm :   0.500/  0.017
angle :  -90.0    80.7    95.0  -139.7   -48.7   -90.0    44.5 
usrwei:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
ocost :  6.492   3.597 1647.127 2005.248   0.224 2578.230 1288.992 
cost  :1288.992  44.497 1647.127 2005.248   0.241 2578.230 1288.992 
weight:  0.001   0.022   0.001   0.000   0.806   0.000   0.001 
k     :  0.001 (manipulability:  0.023, gain:  0.001, limit:  0.100, len:7)
nspace:  0.000  -0.011  -0.000   0.000   0.029   0.000  -0.000 
J     : -0.024  -0.009  -0.001   0.250   0.000   0.000  -0.000 
        -0.077   0.043   0.014  -0.198  -0.000   0.128  -0.000 
         0.333   0.310  -0.187   0.014   0.180   0.000  -0.180 
        -0.734   0.638   0.762   0.056  -0.000  -0.701  -0.000 
        -0.649  -0.760   0.646  -0.000  -1.000   0.000   1.000 
J#t   : -0.033  -0.060   0.001   0.191   0.070   0.001  -0.000 
        -0.052   0.173  -0.025  -0.150  -0.117   0.102   0.000 
         0.351   0.929  -0.172   0.007  -0.913   0.069   0.001 
        -0.128   1.119   0.084   0.012  -0.740  -0.047   0.001 
         0.062   0.164  -0.030   0.001  -1.159   0.012   0.001 
x     :  0.010   0.099   0.000   0.497  -0.052 
J#x   : -4.163  32.356   2.331  -0.412 -18.261  -0.795   0.018 
Ny    :  0.000  -0.001  -0.000   0.000   0.000   0.000  -0.000 
dav   : -4.163  32.356   2.331  -0.411 -18.261  -0.795   0.017 
dav^  : -4.163  32.356   2.331  -0.411 -18.261  -0.795   0.017 
loop:  14
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  4984.124 595.606 808.204 / 0.934 0.794 -1.982>)
targe-coordst: (#<room73b2-kettle-object #X5be3dd0 room73b2-kettle  4979.634 459.108 668.997 / -2.153 -0.697 0.375>)
vel-pos : 10.452  99.452   0.022 
vel-rot :  0.497  -0.052 
vel-pos-norm : 100.000/  1.000
vel-rot-norm :   0.500/  0.017
angle :  -90.0    90.0    95.0  -140.0   -66.9   -90.0    44.6 
usrwei:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
ocost :1288.992  44.497 1647.127 2005.248   0.241 2578.230 1288.992 
cost  :1288.992 3867.412 1647.127 2005.248   0.450 2578.230 1288.992 
weight:  0.001   0.000   0.001   0.000   0.690   0.000   0.001 
k     :  0.001 (manipulability:  0.023, gain:  0.001, limit:  0.100, len:7)
nspace:  0.000  -0.000  -0.000   0.000   0.058   0.000  -0.000 
J     : -0.082  -0.062   0.021   0.233   0.000  -0.000  -0.000 
        -0.047   0.077   0.057  -0.185  -0.000   0.128   0.000 
         0.316   0.299  -0.183   0.092   0.180  -0.000  -0.180 
        -0.713   0.564   0.713   0.366  -0.000  -0.702  -0.000 
        -0.643  -0.763   0.643   0.000  -1.000   0.000   1.000 
J#t   : -0.056  -0.037  -0.015   0.165   0.055   0.026  -0.000 
        -0.059   0.034   0.057  -0.139   0.053   0.078  -0.000 
         0.184   0.078  -0.021   0.083  -0.027  -0.023   0.000 
        -0.323   0.096   0.263   0.107   0.313  -0.168  -0.000 
         0.033   0.014  -0.003   0.015  -1.002  -0.004   0.001 
x     :  0.010   0.099   0.000   0.497  -0.052 
J#x   : -9.668   2.861   7.832   2.307  12.239  -4.327  -0.014 
Ny    :  0.000  -0.000  -0.000   0.000  -0.000   0.000  -0.000 
dav   : -9.668   2.861   7.832   2.308  12.238  -4.327  -0.014 
dav^  : -9.668   2.861   7.832   2.308  12.238  -4.327  -0.014 
loop:  15
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  4948.882 617.86 798.016 / 1.247 0.818 -1.745>)
targe-coordst: (#<room73b2-kettle-object #X5be3dd0 room73b2-kettle  4940.776 488.19 652.585 / -1.871 -0.716 0.158>)
vel-pos : 10.452  99.452   0.022 
vel-rot :  0.497  -0.052 
vel-pos-norm : 100.000/  1.000
vel-rot-norm :   0.500/  0.017
angle :  -90.0    90.0    95.0  -137.7   -54.7   -90.0    44.5 
usrwei:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
ocost :1288.992 3867.412 1647.127 2005.248   0.450 2578.230 1288.992 
cost  :1288.992 3867.412 1647.127 376.449   0.299 2578.230 1288.992 
weight:  0.001   0.000   0.001   1.000   1.000   0.000   0.001 
k     :  0.001 (manipulability:  0.021, gain:  0.001, limit:  0.100, len:7)
nspace:  0.000  -0.000  -0.000   0.536   0.050   0.000  -0.000 
J     : -0.039  -0.029   0.007   0.247   0.000   0.000  -0.000 
        -0.018   0.056   0.027  -0.196  -0.000   0.128   0.000 
         0.341   0.310  -0.198   0.040   0.180   0.000  -0.180 
        -0.730   0.648   0.730   0.160  -0.000  -0.701   0.000 
        -0.673  -0.737   0.673  -0.000  -1.000  -0.000   1.000 
J#t   :  0.074  -0.042  -0.082   2.217  -0.092   0.098   0.000 
        -0.109   0.046   0.091  -1.745   0.116   0.005  -0.000 
         0.208   0.081  -0.034   0.451  -0.063  -0.012   0.000 
        -0.300   0.101   0.246   0.548   0.300  -0.144  -0.000 
         0.037   0.014  -0.006   0.081  -1.009  -0.002   0.001 
x     :  0.010   0.099   0.000   0.497  -0.052 
J#x   : -9.231   3.081   7.505   6.752  12.177  -3.998  -0.009 
Ny    :  0.000  -0.000  -0.000   0.003  -0.001   0.000  -0.000 
dav   : -9.231   3.081   7.505   6.756  12.176  -3.998  -0.010 
dav^  : -9.231   3.081   7.505   6.756  12.176  -3.998  -0.010 
loop:  16
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  4914.252 659.806 792.564 / 1.552 0.713 -1.526>)
targe-coordst: (#<room73b2-kettle-object #X5be3dd0 room73b2-kettle  4903.426 548.625 632.714 / -1.595 -0.609 -0.041>)
vel-pos : 10.452  99.452   0.022 
vel-rot :  0.497  -0.052 
vel-pos-norm : 100.000/  1.000
vel-rot-norm :   0.500/  0.017
angle :  -90.0    90.0    95.0  -130.9   -42.5   -90.0    44.5 
usrwei:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
ocost :1288.992 3867.412 1647.127 376.449   0.299 2578.230 1288.992 
cost  :1288.992 3867.412 1647.127  24.294   0.188 2578.230 1288.992 
weight:  0.001   0.000   0.001   1.000   1.000   0.000   0.001 
k     :  0.001 (manipulability:  0.020, gain:  0.001, limit:  0.100, len:7)
nspace:  0.000  -0.000  -0.000   0.434   0.024   0.000  -0.000 
J     :  0.009   0.008  -0.011   0.250   0.000   0.000  -0.000 
         0.009   0.033  -0.001  -0.198  -0.000   0.128   0.000 
         0.382   0.316  -0.235  -0.013   0.180  -0.000  -0.180 
        -0.654   0.756   0.654  -0.052  -0.000  -0.701  -0.000 
        -0.755  -0.653   0.755   0.000  -1.000   0.000   1.000 
J#t   : -0.032   0.030   0.033   2.413   0.035   0.009  -0.000 
         0.024  -0.001  -0.019  -1.905  -0.038   0.059   0.000 
         0.212   0.092  -0.042  -0.153  -0.091  -0.031   0.000 
        -0.302   0.130   0.245  -0.245   0.341  -0.175  -0.000 
         0.038   0.016  -0.007  -0.027  -1.014  -0.005   0.001 
x     :  0.010   0.099   0.000   0.497  -0.052 
J#x   : -8.598   3.658   6.923 -16.316  12.531  -4.629  -0.010 
Ny    :  0.000  -0.000  -0.000   0.003  -0.001   0.000  -0.000 
dav   : -8.598   3.658   6.923 -16.314  12.531  -4.629  -0.010 
dav^  : -8.598   3.658   6.923 -16.314  12.531  -4.629  -0.010 
loop:  17
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  4870.879 609.358 803.64 / 1.891 0.83 -1.263>)
targe-coordst: (#<room73b2-kettle-object #X5be3dd0 room73b2-kettle  4853.563 474.4 663.936 / -1.293 -0.731 -0.278>)
vel-pos : 10.452  99.452   0.022 
vel-rot :  0.497  -0.052 
vel-pos-norm : 100.000/  1.000
vel-rot-norm :   0.500/  0.017
angle :  -90.0    90.0    95.0  -140.0   -30.0   -90.0    44.5 
usrwei:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
ocost :1288.992 3867.412 1647.127  24.294   0.188 2578.230 1288.992 
cost  :1288.992 3867.412 1647.127 2005.248   0.097 2578.230 1288.992 
weight:  0.001   0.000   0.001   0.000   1.000   0.000   0.001 
k     :  0.001 (manipulability:  0.014, gain:  0.001, limit:  0.100, len:7)
nspace:  0.000  -0.000  -0.000   0.000   0.007   0.000  -0.000 
J     :  0.055   0.047  -0.024   0.241   0.000   0.000  -0.000 
         0.041   0.005  -0.031  -0.191  -0.000   0.128   0.000 
         0.325   0.304  -0.182  -0.067   0.180   0.000  -0.180 
        -0.738   0.640   0.738  -0.267  -0.000  -0.701   0.000 
        -0.643  -0.763   0.643   0.000  -1.000   0.000   1.000 
J#t   :  0.029   0.024   0.002   0.145  -0.035  -0.011   0.000 
         0.021   0.007  -0.009  -0.123  -0.027   0.056   0.000 
         0.157   0.066  -0.015  -0.050   0.005  -0.022  -0.000 
        -0.301   0.096   0.244  -0.074   0.287  -0.149  -0.000 
         0.028   0.012  -0.002  -0.009  -0.997  -0.004   0.001 
x     :  0.010   0.099   0.000   0.497  -0.052 
J#x   : -8.534   2.742   6.895  -2.688  10.975  -3.920  -0.009 
Ny    :  0.000  -0.000  -0.000   0.000  -0.001   0.000  -0.000 
dav   : -8.534   2.742   6.895  -2.688  10.974  -3.920  -0.009 
dav^  : -8.534   2.742   6.895  -2.688  10.974  -3.920  -0.009 
loop:  18
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  4838.145 604.259 813.093 / 2.143 0.756 -1.082>)
targe-coordst: (#<room73b2-kettle-object #X5be3dd0 room73b2-kettle  4817.125 468.719 674.466 / -1.061 -0.663 -0.448>)
vel-pos : 10.452  99.452   0.022 
vel-rot :  0.497  -0.052 
vel-pos-norm : 100.000/  1.000
vel-rot-norm :   0.500/  0.017
angle :  -90.0    90.0    95.0  -140.0   -19.0   -90.0    44.5 
usrwei:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
ocost :1288.992 3867.412 1647.127 2005.248   0.097 2578.230 1288.992 
cost  :1288.992 3867.412 1647.127 2005.248   0.025 2578.230 1288.992 
weight:  0.001   0.000   0.001   0.000   1.000   0.000   0.001 
k     :  0.001 (manipulability:  0.010, gain:  0.001, limit:  0.100, len:7)
nspace:  0.000  -0.000  -0.000   0.000   0.001   0.000  -0.000 
J     :  0.094   0.078  -0.036   0.224   0.000   0.000  -0.000 
         0.065  -0.017  -0.055  -0.179  -0.000   0.128   0.000 
         0.311   0.292  -0.176  -0.111   0.180   0.000  -0.180 
        -0.686   0.612   0.686  -0.446  -0.000  -0.701   0.000 
        -0.643  -0.763   0.643   0.000  -1.000   0.000   1.000 
J#t   :  0.052   0.034   0.001   0.116  -0.059  -0.017   0.000 
         0.039   0.000  -0.025  -0.110  -0.045   0.050   0.000 
         0.145   0.053  -0.021  -0.072   0.019  -0.014  -0.000 
        -0.277   0.090   0.223  -0.120   0.260  -0.147  -0.000 
         0.026   0.009  -0.003  -0.013  -0.994  -0.003   0.001 
x     :  0.010   0.099   0.000   0.497  -0.052 
J#x   : -7.719   2.552   6.236  -3.948  10.075  -3.911  -0.008 
Ny    :  0.000  -0.000  -0.000   0.000  -0.001   0.000  -0.000 
dav   : -7.719   2.552   6.235  -3.948  10.075  -3.911  -0.008 
dav^  : -7.719   2.552   6.235  -3.948  10.075  -3.911  -0.008 
loop:  19
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  4810.354 596.018 825.763 / 2.34 0.663 -0.953>)
targe-coordst: (#<room73b2-kettle-object #X5be3dd0 room73b2-kettle  4786.19 459.541 688.576 / -0.873 -0.577 -0.576>)
vel-pos : 10.452  99.452   0.022 
vel-rot :  0.497  -0.052 
vel-pos-norm : 100.000/  1.000
vel-rot-norm :   0.500/  0.017
angle :  -90.0    90.0    95.0  -140.0    -8.9   -90.0    44.5 
usrwei:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
ocost :1288.992 3867.412 1647.127 2005.248   0.025 2578.230 1288.992 
cost  :1288.992 3867.412 1647.127 2005.248   0.038 2578.230 1288.992 
weight:  0.001   0.000   0.001   0.000   0.963   0.000   0.001 
k     :  0.001 (manipulability:  0.006, gain:  0.001, limit:  0.100, len:7)
nspace:  0.000  -0.000  -0.000   0.000  -0.001   0.000  -0.000 
J     :  0.126   0.104  -0.046   0.201  -0.000   0.000   0.000 
         0.086  -0.035  -0.076  -0.163  -0.000   0.128   0.000 
         0.291   0.276  -0.169  -0.149   0.180   0.000  -0.180 
        -0.615   0.566   0.615  -0.596  -0.000  -0.701   0.000 
        -0.643  -0.763   0.643   0.000  -1.000   0.000   1.000 
J#t   :  0.073   0.040  -0.004   0.088  -0.081  -0.019   0.000 
         0.053  -0.005  -0.037  -0.097  -0.058   0.045   0.000 
         0.131   0.041  -0.025  -0.083   0.036  -0.007  -0.000 
        -0.248   0.082   0.199  -0.159   0.227  -0.146  -0.000 
         0.023   0.007  -0.004  -0.015  -0.991  -0.001   0.001 
x     :  0.010   0.099   0.000   0.497  -0.052 
J#x   : -6.779   2.316   5.477  -4.992   9.054  -3.924  -0.007 
Ny    :  0.000  -0.000  -0.000   0.000  -0.001   0.000  -0.000 
dav   : -6.778   2.316   5.477  -4.992   9.053  -3.924  -0.008 
dav^  : -6.778   2.316   5.477  -4.992   9.053  -3.924  -0.008 
loop:  20
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  4787.958 585.918 840.081 / 2.493 0.565 -0.865>)
targe-coordst: (#<room73b2-kettle-object #X5be3dd0 room73b2-kettle  4761.263 448.292 704.519 / -0.725 -0.485 -0.667>)
vel-pos : 10.452  99.452   0.022 
vel-rot :  0.497  -0.052 
vel-pos-norm : 100.000/  1.000
vel-rot-norm :   0.500/  0.017
angle :  -90.0    90.0    95.0  -140.0     0.1   -90.0    44.5 
usrwei:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
ocost :1288.992 3867.412 1647.127 2005.248   0.038 2578.230 1288.992 
cost  :1288.992 3867.412 1647.127 2005.248   0.097 2578.230 1288.992 
weight:  0.001   0.000   0.001   0.000   0.911   0.000   0.001 
k     :  0.001 (manipulability:  0.003, gain:  0.001, limit:  0.100, len:7)
nspace:  0.000  -0.000  -0.000   0.000  -0.007   0.000  -0.000 
J     :  0.153   0.124  -0.054   0.175  -0.000   0.000   0.000 
         0.102  -0.051  -0.092  -0.144  -0.000   0.128   0.000 
         0.269   0.257  -0.161  -0.179   0.180   0.000  -0.180 
        -0.536   0.510   0.536  -0.715  -0.000  -0.701   0.000 
        -0.643  -0.763   0.643   0.000  -1.000   0.000   1.000 
J#t   :  0.091   0.042  -0.011   0.065  -0.099  -0.019   0.000 
         0.064  -0.010  -0.046  -0.084  -0.068   0.042   0.000 
         0.115   0.030  -0.026  -0.086   0.054  -0.001  -0.000 
        -0.216   0.074   0.173  -0.191   0.193  -0.146  -0.000 
         0.020   0.005  -0.004  -0.015  -0.988  -0.000   0.001 
x     :  0.010   0.099   0.000   0.497  -0.052 
J#x   : -5.781   2.055   4.676  -5.820   7.992  -3.946  -0.007 
Ny    :  0.000  -0.000  -0.000   0.000  -0.001   0.000  -0.000 
dav   : -5.781   2.055   4.676  -5.820   7.991  -3.946  -0.007 
dav^  : -5.781   2.055   4.676  -5.820   7.991  -3.946  -0.007 
loop:  21
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  4770.684 575.087 854.734 / 2.612 0.472 -0.806>)
targe-coordst: (#<room73b2-kettle-object #X5be3dd0 room73b2-kettle  4742.036 436.233 720.834 / -0.608 -0.395 -0.732>)
vel-pos : 10.452  99.452   0.022 
vel-rot :  0.497  -0.052 
vel-pos-norm : 100.000/  1.000
vel-rot-norm :   0.500/  0.017
angle :  -90.0    90.0    95.0  -140.0     8.1   -90.0    44.5 
usrwei:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
ocost :1288.992 3867.412 1647.127 2005.248   0.097 2578.230 1288.992 
cost  :1288.992 3867.412 1647.127 2005.248   0.154 2578.230 1288.992 
weight:  0.001   0.000   0.001   0.000   0.866   0.000   0.001 
k     :  0.001 (manipulability:  0.002, gain:  0.001, limit:  0.100, len:7)
nspace:  0.000  -0.000  -0.000   0.000  -0.015   0.000  -0.000 
J     :  0.172   0.140  -0.059   0.148   0.000   0.000  -0.000 
         0.115  -0.063  -0.105  -0.125  -0.000   0.128   0.000 
         0.247   0.239  -0.153  -0.201   0.180   0.000  -0.180 
        -0.454   0.450   0.454  -0.805  -0.000  -0.701   0.000 
        -0.643  -0.763   0.643   0.000  -1.000  -0.000   1.000 
J#t   :  0.109   0.044  -0.017   0.048  -0.116  -0.018   0.000 
         0.074  -0.013  -0.054  -0.074  -0.076   0.041   0.000 
         0.102   0.023  -0.026  -0.088   0.068   0.004  -0.000 
        -0.186   0.066   0.149  -0.218   0.161  -0.149  -0.000 
         0.018   0.004  -0.004  -0.016  -0.985   0.001   0.001 
x     :  0.010   0.099   0.000   0.497  -0.052 
J#x   : -4.865   1.821   3.946  -6.567   7.019  -4.038  -0.006 
Ny    :  0.000  -0.000  -0.000   0.000  -0.001   0.000  -0.000 
dav   : -4.864   1.821   3.946  -6.567   7.019  -4.038  -0.007 
dav^  : -4.864   1.821   3.946  -6.567   7.019  -4.038  -0.007 
loop:  22
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  4757.722 564.266 868.927 / 2.707 0.385 -0.766>)
targe-coordst: (#<room73b2-kettle-object #X5be3dd0 room73b2-kettle  4727.611 424.184 736.636 / -0.513 -0.312 -0.777>)
vel-pos : 10.452  99.452   0.022 
vel-rot :  0.497  -0.052 
vel-pos-norm : 100.000/  1.000
vel-rot-norm :   0.500/  0.017
angle :  -90.0    90.0    95.0  -140.0    15.1   -90.0    44.5 
usrwei:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
ocost :1288.992 3867.412 1647.127 2005.248   0.154 2578.230 1288.992 
cost  :1288.992 3867.412 1647.127 2005.248   0.210 2578.230 1288.992 
weight:  0.001   0.000   0.001   0.000   0.827   0.000   0.001 
k     :  0.001 (manipulability:  0.004, gain:  0.001, limit:  0.100, len:7)
nspace:  0.000  -0.000  -0.000   0.000  -0.024   0.000  -0.000 
J     :  0.187   0.151  -0.064   0.123  -0.000   0.000   0.000 
         0.124  -0.072  -0.114  -0.106  -0.000   0.128   0.000 
         0.225   0.221  -0.146  -0.218   0.180   0.000  -0.180 
        -0.375   0.390   0.375  -0.872  -0.000  -0.701   0.000 
        -0.643  -0.763   0.643   0.000  -1.000  -0.000   1.000 
J#t   :  0.130   0.047  -0.025   0.037  -0.137  -0.018   0.000 
         0.087  -0.017  -0.064  -0.069  -0.088   0.043   0.000 
         0.093   0.018  -0.025  -0.092   0.079   0.009  -0.000 
        -0.161   0.060   0.129  -0.248   0.134  -0.157  -0.000 
         0.016   0.003  -0.004  -0.017  -0.983   0.002   0.001 
x     :  0.010   0.099   0.000   0.497  -0.052 
J#x   : -4.063   1.634   3.315  -7.389   6.158  -4.256  -0.006 
Ny    :  0.000  -0.000  -0.000   0.000  -0.001   0.000  -0.000 
dav   : -4.062   1.634   3.315  -7.389   6.158  -4.256  -0.006 
dav^  : -4.062   1.634   3.315  -7.389   6.158  -4.256  -0.006 
loop:  23
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  4748.216 553.899 882.222 / 2.786 0.306 -0.74>)
targe-coordst: (#<room73b2-kettle-object #X5be3dd0 room73b2-kettle  4717.033 412.642 751.438 / -0.435 -0.235 -0.81>)
vel-pos : 10.452  99.452   0.022 
vel-rot :  0.497  -0.052 
vel-pos-norm : 100.000/  1.000
vel-rot-norm :   0.500/  0.017
angle :  -90.0    90.0    95.0  -140.0    21.3   -90.0    44.5 
usrwei:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
ocost :1288.992 3867.412 1647.127 2005.248   0.210 2578.230 1288.992 
cost  :1288.992 3867.412 1647.127 2005.248   0.265 2578.230 1288.992 
weight:  0.001   0.000   0.001   0.000   0.790   0.000   0.001 
k     :  0.001 (manipulability:  0.006, gain:  0.001, limit:  0.100, len:7)
nspace:  0.000  -0.000  -0.000   0.000  -0.033   0.000  -0.000 
J     :  0.198   0.159  -0.066   0.098  -0.000   0.000   0.000 
         0.130  -0.079  -0.121  -0.089  -0.000   0.128   0.000 
         0.204   0.204  -0.139  -0.230   0.180   0.000  -0.180 
        -0.302   0.332   0.302  -0.919  -0.000  -0.701  -0.000 
        -0.643  -0.763   0.643   0.000  -1.000  -0.000   1.000 
J#t   :  0.150   0.050  -0.031   0.028  -0.156  -0.017   0.000 
         0.098  -0.020  -0.073  -0.063  -0.098   0.045   0.000 
         0.082   0.014  -0.023  -0.095   0.091   0.014  -0.000 
        -0.135   0.054   0.108  -0.274   0.106  -0.165  -0.000 
         0.014   0.002  -0.004  -0.017  -0.981   0.003   0.001 
x     :  0.010   0.099   0.000   0.497  -0.052 
J#x   : -3.235   1.432   2.662  -8.090   5.292  -4.468  -0.005 
Ny    :  0.000  -0.000  -0.000   0.000  -0.001   0.000  -0.000 
dav   : -3.235   1.432   2.661  -8.089   5.291  -4.468  -0.006 
dav^  : -3.235   1.432   2.661  -8.089   5.291  -4.468  -0.006 
loop:  24
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  4741.53 544.434 894.154 / 2.85 0.238 -0.723>)
targe-coordst: (#<room73b2-kettle-object #X5be3dd0 room73b2-kettle  4709.593 402.103 764.723 / -0.371 -0.168 -0.832>)
vel-pos : 10.452  99.452   0.022 
vel-rot :  0.497  -0.052 
vel-pos-norm : 100.000/  1.000
vel-rot-norm :   0.500/  0.017
angle :  -90.0    90.0    95.0  -140.0    26.6   -90.0    44.5 
usrwei:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
ocost :1288.992 3867.412 1647.127 2005.248   0.265 2578.230 1288.992 
cost  :1288.992 3867.412 1647.127 2005.248   0.319 2578.230 1288.992 
weight:  0.001   0.000   0.001   0.000   0.758   0.000   0.001 
k     :  0.001 (manipulability:  0.008, gain:  0.001, limit:  0.100, len:7)
nspace:  0.000  -0.000  -0.000   0.000  -0.041   0.000  -0.000 
J     :  0.205   0.165  -0.068   0.077  -0.000   0.000   0.000 
         0.135  -0.084  -0.125  -0.073  -0.000   0.128   0.000 
         0.185   0.189  -0.132  -0.238   0.180   0.000  -0.180 
        -0.235   0.280   0.235  -0.952  -0.000  -0.700  -0.000 
        -0.643  -0.763   0.643   0.000  -1.000   0.000   1.000 
J#t   :  0.167   0.052  -0.037   0.021  -0.172  -0.015   0.000 
         0.108  -0.024  -0.080  -0.056  -0.106   0.047   0.000 
         0.069   0.010  -0.019  -0.097   0.105   0.019  -0.000 
        -0.109   0.047   0.087  -0.294   0.079  -0.172  -0.000 
         0.012   0.002  -0.003  -0.017  -0.978   0.003   0.001 
x     :  0.010   0.099   0.000   0.497  -0.052 
J#x   : -2.418   1.222   2.014  -8.635   4.458  -4.648  -0.005 
Ny    :  0.000  -0.000  -0.000   0.000  -0.001   0.000  -0.000 
dav   : -2.418   1.222   2.013  -8.634   4.458  -4.648  -0.005 
dav^  : -2.418   1.222   2.013  -8.634   4.458  -4.648  -0.005 
loop:  25
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  4737.005 536.122 904.492 / 2.902 0.179 -0.712>)
targe-coordst: (#<room73b2-kettle-object #X5be3dd0 room73b2-kettle  4704.559 392.849 776.232 / -0.319 -0.11 -0.848>)
vel-pos : 10.452  99.452   0.022 
vel-rot :  0.497  -0.052 
vel-pos-norm : 100.000/  1.000
vel-rot-norm :   0.500/  0.017
angle :  -90.0    90.0    95.0  -140.0    31.0   -90.0    44.5 
usrwei:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
ocost :1288.992 3867.412 1647.127 2005.248   0.319 2578.230 1288.992 
cost  :1288.992 3867.412 1647.127 2005.248   0.371 2578.230 1288.992 
weight:  0.001   0.000   0.001   0.000   0.730   0.000   0.001 
k     :  0.001 (manipulability:  0.010, gain:  0.001, limit:  0.100, len:7)
nspace:  0.000  -0.000  -0.000   0.000  -0.049   0.000  -0.000 
J     :  0.210   0.168  -0.069   0.058   0.000   0.000  -0.000 
         0.138  -0.088  -0.128  -0.060  -0.000   0.128  -0.000 
         0.169   0.176  -0.127  -0.243   0.180  -0.000  -0.180 
        -0.178   0.233   0.178  -0.973  -0.000  -0.700  -0.000 
        -0.643  -0.763   0.643   0.000  -1.000   0.000   1.000 
J#t   :  0.180   0.054  -0.042   0.016  -0.185  -0.013   0.000 
         0.115  -0.026  -0.086  -0.050  -0.113   0.049   0.000 
         0.055   0.007  -0.015  -0.098   0.119   0.022  -0.000 
        -0.084   0.040   0.067  -0.309   0.054  -0.177  -0.000 
         0.009   0.001  -0.002  -0.018  -0.976   0.004   0.001 
x     :  0.010   0.099   0.000   0.497  -0.052 
J#x   : -1.657   1.019   1.408  -9.033   3.699  -4.792  -0.004 
Ny    :  0.000  -0.000  -0.000   0.000  -0.001   0.000  -0.000 
dav   : -1.657   1.019   1.408  -9.033   3.698  -4.792  -0.004 
dav^  : -1.657   1.019   1.408  -9.033   3.698  -4.792  -0.004 
loop:  26
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  4734.042 529.03 913.219 / 2.945 0.13 -0.705>)
targe-coordst: (#<room73b2-kettle-object #X5be3dd0 room73b2-kettle  4701.263 384.954 785.948 / -0.276 -0.062 -0.858>)
vel-pos : 10.452  99.452   0.022 
vel-rot :  0.497  -0.052 
vel-pos-norm : 100.000/  1.000
vel-rot-norm :   0.500/  0.017
angle :  -90.0    90.0    95.0  -140.0    34.7   -90.0    44.5 
usrwei:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
ocost :1288.992 3867.412 1647.127 2005.248   0.371 2578.230 1288.992 
cost  :1288.992 3867.412 1647.127 2005.248   0.419 2578.230 1288.992 
weight:  0.001   0.000   0.001   0.000   0.705   0.000   0.001 
k     :  0.001 (manipulability:  0.011, gain:  0.001, limit:  0.100, len:7)
nspace:  0.000  -0.000  -0.000   0.000  -0.055   0.000  -0.000 
J     :  0.213   0.171  -0.070   0.042  -0.000   0.000   0.000 
         0.140  -0.090  -0.130  -0.048  -0.000   0.128   0.000 
         0.155   0.166  -0.122  -0.246   0.180   0.000  -0.180 
        -0.129   0.194   0.129  -0.986  -0.000  -0.700   0.000 
        -0.643  -0.763   0.643   0.000  -1.000  -0.000   1.000 
J#t   :  0.190   0.055  -0.045   0.012  -0.194  -0.010   0.000 
         0.122  -0.028  -0.091  -0.044  -0.118   0.051   0.000 
         0.043   0.004  -0.011  -0.099   0.132   0.025  -0.000 
        -0.062   0.034   0.049  -0.320   0.032  -0.182  -0.000 
         0.007   0.000  -0.001  -0.018  -0.973   0.004   0.001 
x     :  0.010   0.099   0.000   0.497  -0.052 
J#x   : -0.981   0.833   0.868  -9.312   3.035  -4.903  -0.003 
Ny    :  0.000  -0.000  -0.000   0.000  -0.001   0.000  -0.000 
dav   : -0.980   0.833   0.868  -9.312   3.034  -4.903  -0.004 
dav^  : -0.980   0.833   0.868  -9.312   3.034  -4.903  -0.004 
loop:  27
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  4732.155 523.101 920.454 / 2.979 0.089 -0.701>)
targe-coordst: (#<room73b2-kettle-object #X5be3dd0 room73b2-kettle  4699.165 378.353 794.002 / -0.242 -0.022 -0.865>)
vel-pos : 10.452  99.452   0.022 
vel-rot :  0.497  -0.052 
vel-pos-norm : 100.000/  1.000
vel-rot-norm :   0.500/  0.017
angle :  -90.0    90.0    95.0  -140.0    37.8   -90.0    44.5 
usrwei:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
ocost :1288.992 3867.412 1647.127 2005.248   0.419 2578.230 1288.992 
cost  :1288.992 3867.412 1647.127 2005.248   0.462 2578.230 1288.992 
weight:  0.001   0.000   0.001   0.000   0.684   0.000   0.001 
k     :  0.001 (manipulability:  0.012, gain:  0.001, limit:  0.100, len:7)
nspace:  0.000  -0.000  -0.000   0.000  -0.060   0.000  -0.000 
J     :  0.215   0.172  -0.070   0.029  -0.000   0.000   0.000 
         0.141  -0.092  -0.131  -0.039   0.000   0.128  -0.000 
         0.144   0.156  -0.119  -0.248   0.180  -0.000  -0.180 
        -0.089   0.161   0.089  -0.993  -0.000  -0.700   0.000 
        -0.643  -0.763   0.643   0.000  -1.000   0.000   1.000 
J#t   :  0.197   0.056  -0.048   0.009  -0.200  -0.007   0.000 
         0.126  -0.030  -0.095  -0.038  -0.121   0.053   0.000 
         0.031   0.002  -0.006  -0.100   0.144   0.027  -0.000 
        -0.043   0.028   0.034  -0.328   0.014  -0.185  -0.000 
         0.005   0.000  -0.001  -0.018  -0.971   0.005   0.001 
x     :  0.010   0.099   0.000   0.497  -0.052 
J#x   : -0.399   0.670   0.402  -9.499   2.472  -4.986  -0.003 
Ny    :  0.000  -0.000  -0.000   0.000  -0.001   0.000  -0.001 
dav   : -0.398   0.670   0.402  -9.499   2.471  -4.986  -0.003 
dav^  : -0.398   0.670   0.402  -9.499   2.471  -4.986  -0.003 
loop:  28
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  4730.986 518.21 926.382 / 3.007 0.056 -0.699>)
targe-coordst: (#<room73b2-kettle-object #X5be3dd0 room73b2-kettle  4697.865 372.908 800.602 / -0.214 0.011 -0.87>)
vel-pos : 10.452  99.452   0.022 
vel-rot :  0.497  -0.052 
vel-pos-norm : 100.000/  1.000
vel-rot-norm :   0.500/  0.017
angle :  -90.0    90.0    95.0  -140.0    40.2   -90.0    44.5 
usrwei:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
ocost :1288.992 3867.412 1647.127 2005.248   0.462 2578.230 1288.992 
cost  :1288.992 3867.412 1647.127 2005.248   0.501 2578.230 1288.992 
weight:  0.001   0.000   0.001   0.000   0.666   0.000   0.001 
k     :  0.001 (manipulability:  0.013, gain:  0.001, limit:  0.100, len:7)
nspace:  0.000  -0.000  -0.000   0.000  -0.064   0.000  -0.000 
J     :  0.216   0.172  -0.070   0.018  -0.000   0.000  -0.000 
         0.141  -0.093  -0.131  -0.031  -0.000   0.128   0.000 
         0.135   0.149  -0.116  -0.249   0.180   0.000  -0.180 
        -0.056   0.134   0.056  -0.997  -0.000  -0.700  -0.000 
        -0.643  -0.763   0.643   0.000  -1.000   0.000   1.000 
J#t   :  0.202   0.056  -0.049   0.006  -0.204  -0.005   0.000 
         0.130  -0.031  -0.097  -0.033  -0.124   0.055   0.000 
         0.021   0.000  -0.002  -0.101   0.154   0.028  -0.000 
        -0.027   0.024   0.021  -0.333  -0.002  -0.187   0.000 
         0.003  -0.000   0.000  -0.018  -0.969   0.005   0.001 
x     :  0.010   0.099   0.000   0.497  -0.052 
J#x   :  0.090   0.531   0.011  -9.620   2.005  -5.047  -0.002 
Ny    :  0.000  -0.000  -0.000   0.000  -0.001   0.000  -0.001 
dav   :  0.091   0.531   0.010  -9.620   2.004  -5.047  -0.003 
dav^  :  0.091   0.531   0.010  -9.620   2.004  -5.047  -0.003 
loop:  29
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  4729.908 513.948 931.205 / 3.031 0.03 -0.698>)
targe-coordst: (#<room73b2-kettle-object #X5be3dd0 room73b2-kettle  4696.939 368.14 805.971 / -0.19 0.037 -0.873>)
vel-pos : 10.452  99.452   0.022 
vel-rot :  0.497  -0.052 
vel-pos-norm : 100.000/  1.000
vel-rot-norm :   0.500/  0.017
angle :  -89.9    90.0    95.0  -140.0    42.2   -90.0    44.4 
usrwei:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
ocost :1288.992 3867.412 1647.127 2005.248   0.501 2578.230 1288.992 
cost  :1288.992 3867.412 1647.127 2005.248   0.535 2578.230 1288.992 
weight:  0.001   0.000   0.001   0.000   0.651   0.000   0.001 
k     :  0.001 (manipulability:  0.013, gain:  0.001, limit:  0.100, len:7)
nspace:  0.000  -0.000  -0.000   0.000  -0.067   0.000  -0.000 
J     :  0.216   0.173  -0.070   0.010  -0.000   0.000   0.000 
         0.141  -0.094  -0.132  -0.025  -0.000   0.129  -0.000 
         0.127   0.143  -0.113  -0.250   0.180   0.000  -0.180 
        -0.029   0.112   0.029  -0.999  -0.000  -0.700  -0.000 
        -0.643  -0.763   0.643   0.000  -1.000   0.000   1.000 
J#t   :  0.205   0.057  -0.050   0.004  -0.207  -0.003   0.000 
         0.132  -0.032  -0.099  -0.029  -0.126   0.056   0.000 
         0.012  -0.001   0.001  -0.102   0.163   0.029  -0.000 
        -0.013   0.020   0.010  -0.337  -0.015  -0.189   0.000 
         0.002  -0.000   0.001  -0.018  -0.967   0.005   0.001 
x     :  0.010   0.099   0.000   0.497  -0.052 
J#x   :  0.495   0.414  -0.314  -9.698   1.623  -5.093  -0.002 
Ny    :  0.000  -0.000  -0.000   0.000  -0.001   0.000  -0.001 
dav   :  0.495   0.413  -0.314  -9.698   1.622  -5.092  -0.002 
dav^  :  0.495   0.413  -0.314  -9.698   1.622  -5.092  -0.002 
loop:  30
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  4727.038 508.341 935.112 / 3.064 0.008 -0.698>)
targe-coordst: (#<room73b2-kettle-object #X5be3dd0 room73b2-kettle  4696.094 361.712 810.32 / -0.158 0.059 -0.875>)
vel-pos : 10.452  99.452   0.022 
vel-rot :  0.497  -0.052 
vel-pos-norm : 100.000/  1.000
vel-rot-norm :   0.500/  0.017
angle :  -89.4    90.0    94.7  -140.0    43.9   -90.0    44.4 
usrwei:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
ocost :1288.992 3867.412 1647.127 2005.248   0.535 2578.230 1288.992 
cost  :1288.992 3867.412 1647.127 2005.248   0.564 2578.230 1288.992 
weight:  0.001   0.000   0.001   0.000   0.639   0.000   0.001 
k     :  0.001 (manipulability:  0.014, gain:  0.001, limit:  0.100, len:7)
nspace:  0.000  -0.000  -0.000   0.000  -0.070   0.000  -0.000 
J     :  0.217   0.173  -0.070   0.003  -0.000   0.000  -0.000 
         0.141  -0.095  -0.132  -0.020  -0.000   0.129   0.000 
         0.120   0.138  -0.111  -0.250   0.180   0.000  -0.180 
        -0.008   0.088   0.008  -1.000  -0.000  -0.700   0.000 
        -0.643  -0.763   0.643   0.000  -1.000  -0.000   1.000 
J#t   :  0.208   0.058  -0.051   0.003  -0.210  -0.002   0.000 
         0.134  -0.033  -0.101  -0.025  -0.127   0.057   0.000 
         0.005  -0.002   0.003  -0.103   0.170   0.030  -0.000 
        -0.002   0.015   0.001  -0.339  -0.024  -0.191   0.000 
         0.000  -0.001   0.001  -0.019  -0.966   0.005   0.001 
x     :  0.010   0.099   0.000   0.497  -0.052 
J#x   :  0.827   0.287  -0.581  -9.757   1.333  -5.132  -0.002 
Ny    :  0.000  -0.000  -0.000   0.000  -0.001   0.000  -0.001 
dav   :  0.827   0.287  -0.582  -9.757   1.332  -5.132  -0.002 
dav^  :  0.827   0.287  -0.582  -9.757   1.332  -5.132  -0.002 
loop:  31
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  4722.795 501.494 938.322 / 3.103 -0.01 -0.698>)
targe-coordst: (#<room73b2-kettle-object #X5be3dd0 room73b2-kettle  4695.454 353.844 813.894 / -0.119 0.077 -0.876>)
vel-pos : 10.452  99.452   0.022 
vel-rot :  0.497  -0.052 
vel-pos-norm : 100.000/  1.000
vel-rot-norm :   0.500/  0.017
angle :  -88.6    90.0    94.1  -140.0    45.2   -90.0    44.4 
usrwei:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
ocost :1288.992 3867.412 1647.127 2005.248   0.564 2578.230 1288.992 
cost  :644.806 3867.412 1647.127 2005.248   0.590 2578.230 1288.992 
weight:  1.000   0.000   0.001   0.000   0.629   0.000   0.001 
k     :  0.001 (manipulability:  0.014, gain:  0.001, limit:  0.100, len:7)
nspace:  0.538  -0.000  -0.000   0.000  -0.072   0.000  -0.000 
J     :  0.217   0.173  -0.070  -0.003  -0.000   0.000   0.000 
         0.140  -0.098  -0.132  -0.016  -0.000   0.129  -0.000 
         0.114   0.133  -0.110  -0.250   0.180  -0.000  -0.180 
         0.010   0.063  -0.010  -1.000  -0.000  -0.700   0.000 
        -0.643  -0.764   0.643   0.000  -1.000   0.000   1.000 
J#t   :  3.207   0.032   0.032   0.021  -2.059  -0.020   0.003 
         2.046  -0.051  -0.050  -0.010  -1.305   0.046   0.002 
        -0.037  -0.003   0.005  -0.104   0.198   0.031  -0.000 
         0.110   0.010  -0.004  -0.341  -0.095  -0.193   0.000 
        -0.017  -0.001   0.001  -0.019  -0.955   0.006   0.001 
x     :  0.010   0.099   0.000   0.497  -0.052 
J#x   : 16.766   0.013  -0.372  -9.705  -8.539  -5.271   0.011 
Ny    :  0.007  -0.000  -0.000   0.000  -0.005   0.000  -0.001 
dav   : 16.772   0.013  -0.372  -9.705  -8.544  -5.271   0.010 
dav^  : 16.772   0.013  -0.372  -9.705  -8.544  -5.271   0.010 
loop:  32
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  4662.77 458.192 917.794 / -2.977 0.104 -0.703>)
targe-coordst: (#<room73b2-kettle-object #X5be3dd0 room73b2-kettle  4679.857 310.978 791.04 / 0.085 -0.037 -0.862>)
vel-pos : 10.452  99.452   0.022 
vel-rot :  0.497  -0.052 
vel-pos-norm : 100.000/  1.000
vel-rot-norm :   0.500/  0.017
angle :  -71.8    90.0    93.7  -140.0    36.7   -90.0    44.5 
usrwei:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
ocost :644.806 3867.412 1647.127 2005.248   0.590 2578.230 1288.992 
cost  :  3.648 3867.412 1023.924 2005.248   0.446 2578.230 1288.992 
weight:  1.000   0.000   1.000   0.000   1.000   0.000   0.001 
k     :  0.001 (manipulability:  0.012, gain:  0.001, limit:  0.100, len:7)
nspace:  0.203  -0.000  -0.548   0.000  -0.084   0.000  -0.000 
J     :  0.215   0.172  -0.070   0.034  -0.000   0.000   0.000 
         0.138  -0.096  -0.130  -0.042  -0.000   0.128   0.000 
         0.146   0.159  -0.120  -0.248   0.180   0.000  -0.180 
        -0.104   0.152   0.104  -0.991  -0.000  -0.700  -0.000 
        -0.643  -0.764   0.643   0.000  -1.000  -0.000   1.000 
J#t   :  6.163   0.008   5.996   0.014  -0.140  -0.012   0.000 
        -2.073   0.000  -7.354  -0.196  -3.393  -0.083   0.003 
         1.080  -0.006   1.065  -0.099   0.160   0.026  -0.000 
         1.001   0.012   3.284  -0.259   1.441  -0.126  -0.001 
         0.204  -0.001   0.223  -0.017  -0.956   0.005   0.001 
x     :  0.010   0.099   0.000   0.497  -0.052 
J#x   : 19.804   0.363  54.579  -8.450  24.494  -4.090  -0.019 
Ny    : -0.022   0.000  -0.046  -0.001  -0.016  -0.000  -0.000 
dav   : 19.782   0.364  54.533  -8.451  24.478  -4.091  -0.019 
dav^  : 19.782   0.364  54.533  -8.451  24.478  -4.091  -0.019 
loop:  33
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  4646.587 335.311 976.125 / -2.376 -0.222 -0.719>)
targe-coordst: (#<room73b2-kettle-object #X5be3dd0 room73b2-kettle  4713.128 196.866 855.976 / 0.684 0.29 -0.872>)
vel-pos : 10.452  99.452   0.022 
vel-rot :  0.497  -0.052 
vel-pos-norm : 100.000/  1.000
vel-rot-norm :   0.500/  0.017
angle :  -52.0    90.0    95.0  -140.0    61.1   -90.0    44.4 
usrwei:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
ocost :  3.648 3867.412 1023.924 2005.248   0.446 2578.230 1288.992 
cost  :  0.418 3867.412 1647.127 2005.248   1.029 2578.230 1288.992 
weight:  1.000   0.000   0.001   0.000   0.493   0.000   0.001 
k     :  0.001 (manipulability:  0.018, gain:  0.001, limit:  0.100, len:7)
nspace:  0.014  -0.000  -0.000   0.000  -0.090   0.000  -0.000 
J     :  0.208   0.165  -0.066  -0.072   0.000   0.000  -0.000 
         0.136  -0.094  -0.126   0.034  -0.000   0.129   0.000 
         0.056   0.087  -0.091  -0.239   0.180   0.000  -0.180 
         0.220  -0.100  -0.220  -0.958  -0.000  -0.700  -0.000 
        -0.643  -0.763   0.643   0.000  -1.000  -0.000   1.000 
J#t   :  2.201   0.053   0.062   0.132  -1.383   0.090   0.002 
         1.515  -0.044  -0.037   0.121  -0.941   0.117   0.001 
        -0.809  -0.012  -0.005  -0.172   0.682   0.003  -0.001 
         1.249  -0.027  -0.038  -0.250  -0.802  -0.158   0.001 
        -0.155  -0.002  -0.001  -0.032  -0.868   0.000   0.001 
x     :  0.010   0.099   0.000   0.497  -0.052 
J#x   : 46.004  -0.978  -1.258  -6.273 -26.461  -3.791   0.042 
Ny    :  0.001  -0.000  -0.000   0.000  -0.002   0.000  -0.001 
dav   : 46.005  -0.979  -1.258  -6.272 -26.462  -3.791   0.041 
dav^  : 46.005  -0.979  -1.258  -6.272 -26.462  -3.791   0.041 
loop:  34
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  4631.964 145.119 910.266 / -1.852 0.148 -0.708>)
targe-coordst: (#<room73b2-kettle-object #X5be3dd0 room73b2-kettle  4773.029 102.652 782.485 / 1.21 -0.08 -0.853>)
vel-pos : 10.452  99.452   0.022 
vel-rot :  0.497  -0.052 
vel-pos-norm : 100.000/  1.000
vel-rot-norm :   0.500/  0.017
angle :   -6.0    89.0    93.7  -140.0    34.7   -90.0    44.5 
usrwei:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
ocost :  0.418 3867.412 1647.127 2005.248   1.029 2578.230 1288.992 
cost  : 35.315 3867.412 1040.015 2005.248   0.418 2578.230 1288.992 
weight:  0.028   0.000   1.000   0.000   1.000   0.000   0.001 
k     :  0.001 (manipulability:  0.011, gain:  0.001, limit:  0.100, len:7)
nspace: -0.012  -0.000  -0.548   0.000  -0.078   0.000  -0.000 
J     :  0.213   0.171  -0.070   0.043  -0.000  -0.000   0.000 
         0.132  -0.095  -0.130  -0.049  -0.000   0.128   0.000 
         0.155   0.165  -0.123  -0.246   0.180  -0.000  -0.180 
        -0.147   0.174   0.131  -0.985  -0.000  -0.701   0.000 
        -0.644  -0.764   0.643   0.000  -1.000   0.000   1.000 
J#t   :  2.495   0.042   1.185  -0.043  -0.891  -0.053   0.001 
        -0.884  -0.007  -5.214  -0.198  -2.782  -0.076   0.002 
         0.559   0.001   0.247  -0.113  -0.036   0.014   0.000 
         0.295   0.019   2.596  -0.238   1.453  -0.114  -0.001 
         0.104  -0.000   0.066  -0.020  -0.993   0.003   0.001 
x     :  0.010   0.099   0.000   0.497  -0.052 
J#x   :  4.547   0.539  44.778  -7.878  27.970  -3.715  -0.022 
Ny    : -0.020   0.000  -0.040  -0.001  -0.014  -0.000  -0.000 
dav   :  4.527   0.539  44.738  -7.879  27.956  -3.715  -0.022 
dav^  :  4.527   0.539  44.738  -7.879  27.956  -3.715  -0.022 
loop:  35
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  4695.861 124.722 978.29 / -1.477 -0.234 -0.722>)
targe-coordst: (#<room73b2-kettle-object #X5be3dd0 room73b2-kettle  4845.396 89.131 858.277 / 1.583 0.302 -0.87>)
vel-pos : 10.452  99.452   0.022 
vel-rot :  0.497  -0.052 
vel-pos-norm : 100.000/  1.000
vel-rot-norm :   0.500/  0.017
angle :   -1.5    89.6    95.0  -140.0    62.6   -90.0    44.5 
usrwei:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
ocost : 35.315 3867.412 1040.015 2005.248   0.418 2578.230 1288.992 
cost  :573.259 3867.412 1647.127 2005.248   1.089 2578.230 1288.992 
weight:  0.002   0.000   0.001   0.000   0.479   0.000   0.001 
k     :  0.001 (manipulability:  0.018, gain:  0.001, limit:  0.100, len:7)
nspace: -0.001  -0.000  -0.000   0.000  -0.091   0.000  -0.000 
J     :  0.207   0.164  -0.065  -0.078  -0.000   0.000  -0.000 
         0.133  -0.094  -0.125   0.038  -0.000   0.128   0.000 
         0.052   0.082  -0.089  -0.238   0.180  -0.000  -0.180 
         0.231  -0.117  -0.239  -0.950  -0.000  -0.700   0.000 
        -0.643  -0.763   0.643   0.000  -1.000   0.000   1.000 
J#t   :  0.415   0.062  -0.029  -0.003  -0.327   0.028   0.001 
         0.284  -0.038  -0.100   0.033  -0.213   0.074   0.000 
        -0.165  -0.016   0.030  -0.125   0.304   0.025  -0.000 
         0.249  -0.025  -0.098  -0.322  -0.214  -0.194   0.000 
        -0.031  -0.003   0.006  -0.023  -0.940   0.004   0.002 
x     :  0.010   0.099   0.000   0.497  -0.052 
J#x   :  9.065  -0.881  -3.410  -8.933  -4.713  -5.100   0.008 
Ny    : -0.001  -0.000  -0.000   0.000  -0.001   0.000  -0.001 
dav   :  9.065  -0.881  -3.411  -8.932  -4.714  -5.099   0.007 
dav^  :  9.065  -0.881  -3.411  -8.932  -4.714  -5.099   0.007 
loop:  36
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  4700.233 115.5 964.799 / -1.447 -0.156 -0.709>)
targe-coordst: (#<room73b2-kettle-object #X5be3dd0 room73b2-kettle  4851.271 94.284 843.275 / 1.614 0.223 -0.877>)
vel-pos : 10.452  99.452   0.022 
vel-rot :  0.497  -0.052 
vel-pos-norm : 100.000/  1.000
vel-rot-norm :   0.500/  0.017
angle :    0.0    88.7    91.6  -140.0    57.9   -90.0    44.5 
usrwei:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
ocost :573.259 3867.412 1647.127 2005.248   1.089 2578.230 1288.992 
cost  :1288.992 2217.217 141.450 2005.248   0.914 2578.230 1288.992 
weight:  0.001   1.000   1.000   0.000   1.000   0.000   0.001 
k     :  0.001 (manipulability:  0.018, gain:  0.001, limit:  0.100, len:7)
nspace: -0.000  -0.562  -0.507   0.000  -0.167   0.000  -0.000 
J     :  0.211   0.168  -0.067  -0.058   0.000   0.000  -0.000 
         0.126  -0.104  -0.128   0.024  -0.000   0.128   0.000 
         0.064   0.093  -0.094  -0.243   0.180   0.000  -0.180 
         0.156  -0.122  -0.178  -0.973  -0.000  -0.700  -0.000 
        -0.643  -0.766   0.643   0.000  -1.000   0.000   1.000 
J#t   :  0.012   4.141  -2.910  -0.026  -5.000   0.015   0.004 
         0.017  -1.395  -2.846   0.236  -0.761   0.169   0.001 
         0.008  -0.969   1.209  -0.143   1.668   0.017  -0.001 
        -0.008  -0.752  -2.162  -0.184  -0.813  -0.128   0.001 
         0.002  -0.189   0.234  -0.026  -0.678   0.003   0.001 
x     :  0.010   0.099   0.000   0.497  -0.052 
J#x   : -0.120 -26.338 -80.245  -3.822 -28.479  -2.687   0.022 
Ny    : -0.001  -0.003  -0.011   0.001  -0.005   0.000  -0.001 
dav   : -0.121 -26.342 -80.256  -3.821 -28.484  -2.686   0.022 
dav^  : -0.121 -26.342 -80.256  -3.821 -28.484  -2.686   0.022 
loop:  37
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  4890.874 259.376 863.916 / -0.239 0.347 -0.237>)
targe-coordst: (#<room73b2-kettle-object #X5be3dd0 room73b2-kettle  4939.101 441.684 814.231 / 2.796 -0.321 -1.299>)
vel-pos : 10.452  99.452   0.022 
vel-rot :  0.497  -0.052 
vel-pos-norm : 100.000/  1.000
vel-rot-norm :   0.500/  0.017
angle :   -0.1    62.3    11.3  -140.0    29.4   -90.0    44.5 
usrwei:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
ocost :1288.992 2217.217 141.450 2005.248   0.914 2578.230 1288.992 
cost  :1288.992   4.988   1.443 2005.248   0.351 2578.230 1288.992 
weight:  0.001   1.000   1.000   0.000   1.000   0.000   0.001 
k     :  0.001 (manipulability:  0.007, gain:  0.001, limit:  0.100, len:7)
nspace: -0.000  -0.362   0.119   0.000  -0.062   0.000  -0.000 
J     :  0.018   0.048  -0.069   0.065  -0.000   0.000  -0.000 
        -0.001  -0.241  -0.127  -0.065   0.000   0.128  -0.000 
         0.006  -0.020  -0.129  -0.241   0.180   0.000  -0.180 
        -0.340  -0.914   0.199  -0.966  -0.000  -0.701   0.000 
        -0.221  -0.151   0.643   0.000  -1.000   0.000   1.000 
J#t   : -0.021  -0.195  -1.814  -0.018  -1.137  -0.054   0.001 
         0.012  -1.114  -4.688   0.024  -2.862   0.022   0.002 
        -0.022  -0.044  -0.686  -0.115  -0.261   0.001   0.000 
        -0.003  -0.806   1.179  -0.002   0.874  -0.009  -0.001 
        -0.004  -0.006  -0.108  -0.020  -1.035   0.001   0.001 
x     :  0.010   0.099   0.000   0.497  -0.052 
J#x   : -0.029 -29.408   6.105   0.132  11.004  -0.161  -0.009 
Ny    : -0.000  -0.001   0.001   0.000   0.000   0.000  -0.000 
dav   : -0.030 -29.409   6.106   0.133  11.004  -0.161  -0.009 
dav^  : -0.030 -29.409   6.106   0.133  11.004  -0.161  -0.009 
loop:  38
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  4888.321 363.393 904.061 / -0.152 0.322 0.28>)
targe-coordst: (#<room73b2-kettle-object #X5be3dd0 room73b2-kettle  4952.361 542.169 948.43 / 2.883 -0.349 -1.815>)
vel-pos : 10.452  99.452   0.022 
vel-rot :  0.497  -0.052 
vel-pos-norm : 100.000/  1.000
vel-rot-norm :   0.500/  0.017
angle :   -0.2    32.9    17.4  -139.9    40.4   -90.0    44.5 
usrwei:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
ocost :1288.992   4.988   1.443 2005.248   0.351 2578.230 1288.992 
cost  :1288.992   1.102   0.901 2005.248   0.504 2578.230 1288.992 
weight:  0.001   1.000   1.000   0.000   0.665   0.000   0.001 
k     :  0.001 (manipulability:  0.013, gain:  0.001, limit:  0.100, len:7)
nspace: -0.000  -0.191   0.070   0.000  -0.064   0.000  -0.000 
J     : -0.079   0.056  -0.071   0.018   0.000   0.000  -0.000 
        -0.026  -0.215  -0.131  -0.031  -0.000   0.128   0.000 
        -0.020  -0.012  -0.116  -0.249   0.180   0.000  -0.180 
        -0.317  -0.938   0.054  -0.998  -0.000  -0.701  -0.000 
         0.262  -0.229   0.645   0.000  -1.000   0.000   1.000 
J#t   : -0.094   0.120  -2.853  -0.065  -1.888  -0.067   0.002 
         0.044  -0.459  -5.274   0.038  -3.278   0.037   0.004 
         0.043   0.038  -0.144  -0.120   0.079   0.017  -0.000 
        -0.019  -0.954   1.042  -0.007   0.874  -0.014  -0.001 
         0.008   0.006   0.004  -0.021  -0.964   0.004   0.001 
x     :  0.010   0.099   0.000   0.497  -0.052 
J#x   : -0.357 -29.739  -2.091   0.057   7.967  -0.236  -0.009 
Ny    : -0.000  -0.001   0.001   0.000  -0.000   0.000  -0.001 
dav   : -0.357 -29.739  -2.091   0.057   7.967  -0.235  -0.010 
dav^  : -0.357 -29.739  -2.091   0.057   7.967  -0.235  -0.010 
loop:  39
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  4898.272 436.484 995.151 / -0.075 0.22 0.799>)
targe-coordst: (#<room73b2-kettle-object #X5be3dd0 room73b2-kettle  4958.505 567.521 1126.421 / 2.991 -0.294 -2.351>)
vel-pos : 10.452  99.452   0.022 
vel-rot :  0.497  -0.052 
vel-pos-norm : 100.000/  1.000
vel-rot-norm :   0.500/  0.017
angle :   -0.5     3.2    15.3  -139.8    48.4   -90.0    44.5 
usrwei:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
ocost :1288.992   1.102   0.901 2005.248   0.504 2578.230 1288.992 
cost  :1288.992   0.398   1.059 2005.248   0.656 2578.230 1288.992 
weight:  0.001   1.000   0.486   0.000   0.604   0.000   0.001 
k     :  0.001 (manipulability:  0.019, gain:  0.001, limit:  0.100, len:7)
nspace: -0.000  -0.073   0.041   0.000  -0.076   0.000  -0.000 
J     : -0.154   0.042  -0.070  -0.017   0.000   0.000   0.000 
        -0.031  -0.190  -0.131  -0.006  -0.000   0.128   0.000 
        -0.018  -0.025  -0.106  -0.249   0.180   0.000  -0.180 
        -0.218  -0.974  -0.052  -0.998  -0.000  -0.700  -0.000 
         0.700  -0.202   0.645   0.000  -1.000   0.000   1.000 
J#t   : -0.133   0.463  -3.505  -0.092  -2.433  -0.069   0.003 
         0.087   0.093  -5.389   0.053  -3.417   0.057   0.004 
         0.122  -0.019   0.498  -0.125   0.575   0.032  -0.001 
        -0.031  -1.021   0.857  -0.007   0.724  -0.016  -0.001 
         0.022  -0.007   0.124  -0.022  -0.871   0.006   0.001 
x     :  0.010   0.099   0.000   0.497  -0.052 
J#x   : -0.521 -28.276  -8.764   0.108   2.307  -0.205  -0.003 
Ny    : -0.000  -0.000   0.001   0.000  -0.000   0.000  -0.001 
dav   : -0.521 -28.276  -8.763   0.108   2.307  -0.205  -0.003 
dav^  : -0.521 -28.276  -8.763   0.108   2.307  -0.205  -0.003 
loop:  40
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  4914.299 454.999 1107.406 / -0.075 0.075 1.298>)
targe-coordst: (#<room73b2-kettle-object #X5be3dd0 room73b2-kettle  4952.45 504.433 1292.153 / 3.039 -0.176 -2.866>)
vel-pos : 10.452  99.452   0.022 
vel-rot :  0.497  -0.052 
vel-pos-norm : 100.000/  1.000
vel-rot-norm :   0.500/  0.017
angle :   -1.0   -25.1     6.6  -139.7    50.7   -90.0    44.5 
usrwei:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
ocost :1288.992   0.398   1.059 2005.248   0.656 2578.230 1288.992 
cost  :1216.795   0.131   2.120 2005.248   0.709 2578.230 1288.992 
weight:  1.000   1.000   0.321   0.000   0.585   0.000   0.001 
k     :  0.001 (manipulability:  0.020, gain:  0.001, limit:  0.100, len:7)
nspace: -0.547  -0.012   0.053   0.000  -0.079   0.000  -0.000 
J     : -0.177   0.013  -0.070  -0.027  -0.000   0.000  -0.000 
        -0.011  -0.171  -0.130   0.002  -0.000   0.128   0.000 
        -0.009  -0.045  -0.104  -0.249   0.180   0.000  -0.180 
        -0.075  -0.996  -0.083  -0.994  -0.000  -0.700   0.000 
         0.960  -0.087   0.647   0.000  -1.000  -0.000   1.000 
J#t   : -2.568   0.430  -1.510  -0.096  -3.396  -0.014   0.004 
         1.813   0.321  -6.705   0.057  -2.648   0.026   0.004 
         3.070   0.028  -1.634  -0.107   1.970  -0.016  -0.003 
        -0.534  -1.053   1.224  -0.005   0.371  -0.004  -0.000 
         0.562   0.001  -0.267  -0.019  -0.616  -0.002   0.001 
x     :  0.010   0.099   0.000   0.497  -0.052 
J#x   : -8.099 -27.929  -3.435   0.176  -4.710   0.033   0.006 
Ny    : -0.010  -0.001   0.011   0.000  -0.003   0.000  -0.001 
dav   : -8.109 -27.930  -3.424   0.176  -4.712   0.033   0.006 
dav^  : -8.109 -27.930  -3.424   0.176  -4.712   0.033   0.006 
loop:  41
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  4941.872 437.765 1200.137 / -0.141 0.039 1.789>)
targe-coordst: (#<room73b2-kettle-object #X5be3dd0 room73b2-kettle  4963.337 392.241 1388.545 / 3.023 -0.14 2.921>)
vel-pos : 10.452  99.452   0.022 
vel-rot :  0.497  -0.052 
vel-pos-norm : 100.000/  1.000
vel-rot-norm :   0.500/  0.017
angle :   -9.1   -53.0     3.2  -139.5    46.0   -90.0    44.5 
usrwei:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
ocost :1216.795   0.131   2.120 2005.248   0.709 2578.230 1288.992 
cost  : 15.241   0.051   2.875 2005.248   0.605 2578.230 1288.992 
weight:  1.000   1.000   0.258   0.000   1.000   0.000   0.001 
k     :  0.001 (manipulability:  0.018, gain:  0.001, limit:  0.100, len:7)
nspace: -0.364   0.002   0.053   0.000  -0.117   0.000  -0.000 
J     : -0.165   0.008  -0.071  -0.007  -0.000   0.000  -0.000 
        -0.011  -0.181  -0.131  -0.013  -0.000   0.128  -0.000 
        -0.022  -0.052  -0.110  -0.250   0.180  -0.000  -0.180 
        -0.039  -0.999  -0.020  -1.000  -0.000  -0.700   0.000 
         0.976  -0.042   0.649   0.000  -1.000   0.000   1.000 
J#t   : -2.825   0.244  -1.420  -0.085  -3.606  -0.016   0.003 
         1.559  -0.043  -6.030   0.054  -2.423   0.028   0.002 
         3.311   0.017  -1.698  -0.092   2.208  -0.016  -0.002 
        -0.503  -0.991   1.178  -0.005   0.317  -0.005  -0.000 
         0.605   0.002  -0.292  -0.016  -0.584  -0.003   0.000 
x     :  0.010   0.099   0.000   0.497  -0.052 
J#x   : -8.933 -28.334  -0.789   0.149  -5.205   0.030   0.004 
Ny    : -0.009  -0.001   0.010   0.000  -0.003   0.000  -0.001 
dav   : -8.942 -28.334  -0.779   0.150  -5.208   0.031   0.003 
dav^  : -8.942 -28.334  -0.779   0.150  -5.208   0.031   0.003 
loop:  42
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  4950.262 379.036 1279.213 / -0.226 -0.036 2.28>)
targe-coordst: (#<room73b2-kettle-object #X5be3dd0 room73b2-kettle  4936.565 252.511 1426.977 / 2.983 -0.043 2.432>)
vel-pos : 10.452  99.452   0.022 
vel-rot :  0.497  -0.052 
vel-pos-norm : 100.000/  1.000
vel-rot-norm :   0.500/  0.017
angle :  -18.1   -81.4     2.4  -139.4    40.8   -89.9    44.5 
usrwei:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
ocost : 15.241   0.051   2.875 2005.248   0.605 2578.230 1288.992 
cost  :  3.695   0.266   3.096 2005.248   0.510 2578.230 1288.992 
weight:  1.000   0.790   0.244   0.000   1.000   0.000   0.001 
k     :  0.001 (manipulability:  0.012, gain:  0.001, limit:  0.100, len:7)
nspace: -0.205   0.033   0.052   0.000  -0.098   0.000  -0.000 
J     : -0.111   0.011  -0.072   0.016   0.000   0.000  -0.000 
        -0.017  -0.196  -0.130  -0.029  -0.000   0.128   0.000 
        -0.026  -0.054  -0.117  -0.250   0.180  -0.000  -0.180 
         0.036  -0.995   0.049  -0.998  -0.001  -0.701   0.000 
         0.758  -0.031   0.652   0.001  -1.000   0.000   1.000 
J#t   : -3.960  -0.081  -1.046  -0.071  -3.604  -0.023   0.003 
         1.557  -0.322  -5.478   0.047  -2.406   0.030   0.002 
         5.082   0.165  -2.238  -0.069   2.462  -0.016  -0.002 
        -0.653  -0.950   1.200  -0.007   0.318  -0.006  -0.000 
         0.933   0.031  -0.391  -0.012  -0.535  -0.003   0.000 
x     :  0.010   0.099   0.000   0.497  -0.052 
J#x   :-14.872 -29.051   3.510   0.074  -5.215   0.007   0.004 
Ny    : -0.013  -0.001   0.010   0.000  -0.003   0.000  -0.001 
dav   :-14.885 -29.052   3.520   0.074  -5.219   0.007   0.003 
dav^  :-14.885 -29.052   3.520   0.074  -5.219   0.007   0.003 
loop:  43
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  4922.951 297.86 1331.935 / -0.425 -0.182 2.779>)
targe-coordst: (#<room73b2-kettle-object #X5be3dd0 room73b2-kettle  4855.171 129.483 1403.249 / 2.815 0.144 1.949>)
vel-pos : 10.452  99.452   0.022 
vel-rot :  0.497  -0.052 
vel-pos-norm : 100.000/  1.000
vel-rot-norm :   0.500/  0.017
angle :  -33.0  -110.4     5.9  -139.3    35.6   -89.9    44.5 
usrwei:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
ocost :  3.695   0.266   3.096 2005.248   0.510 2578.230 1288.992 
cost  :  0.790   0.702   2.247 2005.248   0.430 2578.230 1288.992 
weight:  1.000   0.587   1.000   0.000   1.000   0.000   0.001 
k     :  0.001 (manipulability:  0.007, gain:  0.001, limit:  0.100, len:7)
nspace: -0.041   0.079   0.173   0.000  -0.080   0.000  -0.000 
J     : -0.029   0.027  -0.072   0.039   0.000  -0.000  -0.000 
        -0.014  -0.218  -0.129  -0.046  -0.000   0.128   0.000 
        -0.011  -0.043  -0.123  -0.247   0.180  -0.000  -0.180 
         0.181  -0.972   0.118  -0.988  -0.001  -0.701  -0.000 
         0.349  -0.077   0.653   0.001  -1.000   0.000   1.000 
J#t   : -0.566  -0.212  -2.310  -0.030  -1.686  -0.052   0.001 
        -1.362  -0.896  -4.579   0.017  -3.390   0.027   0.003 
        14.471   2.073  -5.143  -0.034   1.588   0.006  -0.001 
        -0.484  -0.941   1.244  -0.003   0.710  -0.008  -0.001 
         2.640   0.380  -0.917  -0.006  -0.696   0.002   0.001 
x     :  0.010   0.099   0.000   0.497  -0.052 
J#x   :-29.742 -33.186  10.684   0.007   1.982  -0.118  -0.002 
Ny    : -0.025  -0.003   0.013   0.000  -0.001   0.000  -0.000 
dav   :-29.766 -33.189  10.696   0.007   1.981  -0.117  -0.002 
dav^  :-29.766 -33.189  10.696   0.007   1.981  -0.117  -0.002 
loop:  44
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  4823.233 250.124 1329.905 / -0.946 -0.35 -2.93>)
targe-coordst: (#<room73b2-kettle-object #X5be3dd0 room73b2-kettle  4688.878 112.3 1298.538 / 2.305 0.37 1.397>)
vel-pos : 10.452  99.452   0.022 
vel-rot :  0.497  -0.052 
vel-pos-norm : 100.000/  1.000
vel-rot-norm :   0.500/  0.017
angle :  -62.7  -143.6    16.6  -139.3    37.5   -90.0    44.5 
usrwei:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
ocost :  0.790   0.702   2.247 2005.248   0.430 2578.230 1288.992 
cost  :  1.406   2.847   0.962 2005.248   0.459 2578.230 1288.992 
weight:  0.416   0.260   1.000   0.000   0.685   0.000   0.001 
k     :  0.001 (manipulability:  0.012, gain:  0.001, limit:  0.100, len:7)
nspace:  0.037   0.079   0.076   0.000  -0.059   0.000  -0.000 
J     :  0.070   0.057  -0.072   0.030  -0.000   0.000   0.000 
         0.024  -0.225  -0.129  -0.040  -0.000   0.128   0.000 
         0.021  -0.014  -0.121  -0.248   0.180   0.000  -0.180 
         0.343  -0.929   0.091  -0.993  -0.000  -0.701  -0.000 
        -0.198  -0.217   0.652   0.000  -1.000   0.000   1.000 
J#t   :  6.543   2.165  -3.069  -0.031  -3.722  -0.008   0.004 
        -2.833  -1.576  -4.921   0.025  -2.327   0.009   0.003 
        -2.212  -0.696  -0.190  -0.130   0.619  -0.007  -0.001 
         1.294  -0.489   1.009  -0.002   0.507  -0.003  -0.001 
        -0.422  -0.133  -0.005  -0.023  -0.861  -0.001   0.001 
x     :  0.010   0.099   0.000   0.497  -0.052 
J#x   : 25.887 -21.234  -1.109   0.126   1.519  -0.024  -0.002 
Ny    :  0.012   0.004   0.001   0.000  -0.003   0.000  -0.000 
dav   : 25.899 -21.230  -1.109   0.126   1.515  -0.024  -0.002 
dav^  : 25.899 -21.230  -1.109   0.126   1.515  -0.024  -0.002 
loop:  45
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  4802.037 161.179 1281.44 / -0.625 -0.339 -2.542>)
targe-coordst: (#<room73b2-kettle-object #X5be3dd0 room73b2-kettle  4753.453 -1.152 1184.906 / 2.609 0.397 1.004>)
vel-pos : 10.452  99.452   0.022 
vel-rot :  0.497  -0.052 
vel-pos-norm : 100.000/  1.000
vel-rot-norm :   0.500/  0.017
angle :  -36.8  -164.8    15.5  -139.2    39.1   -90.0    44.5 
usrwei:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
ocost :  1.406   2.847   0.962 2005.248   0.459 2578.230 1288.992 
cost  :  0.494  16.727   1.047 2005.248   0.482 2578.230 1288.992 
weight:  1.000   0.056   0.488   0.000   0.675   0.000   0.001 
k     :  0.001 (manipulability:  0.018, gain:  0.001, limit:  0.100, len:7)
nspace: -0.019   0.025   0.041   0.000  -0.062   0.000  -0.000 
J     :  0.141   0.052  -0.073   0.024   0.000   0.000   0.000 
         0.034  -0.220  -0.130  -0.035  -0.000   0.128  -0.000 
         0.037  -0.019  -0.119  -0.249   0.180   0.000  -0.180 
         0.333  -0.943   0.071  -0.996  -0.000  -0.700  -0.000 
        -0.533  -0.202   0.654   0.000  -1.000   0.000   1.000 
J#t   :  4.241   1.397  -1.871  -0.045  -3.702  -0.003   0.004 
        -1.846  -1.112  -5.441   0.032  -2.374   0.011   0.003 
        -2.250  -0.658  -0.726  -0.147   0.992  -0.020  -0.001 
         0.921  -0.620   1.238  -0.010   0.446  -0.004  -0.001 
        -0.418  -0.123  -0.109  -0.026  -0.797  -0.003   0.001 
x     :  0.010   0.099   0.000   0.497  -0.052 
J#x   : 19.512 -22.815   3.460  -0.040  -0.649  -0.037   0.001 
Ny    :  0.004   0.001   0.002   0.000  -0.001   0.000  -0.001 
dav   : 19.516 -22.813   3.462  -0.040  -0.651  -0.037   0.000 
dav^  : 19.516 -22.813   3.462  -0.040  -0.651  -0.037   0.000 
loop:  46
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  4826.077 100.114 1245.835 / -0.389 -0.399 -2.252>)
targe-coordst: (#<room73b2-kettle-object #X5be3dd0 room73b2-kettle  4851.298 -42.143 1114.849 / 2.826 0.479 0.712>)
vel-pos : 10.452  99.452   0.022 
vel-rot :  0.497  -0.052 
vel-pos-norm : 100.000/  1.000
vel-rot-norm :   0.500/  0.017
angle :  -17.3  -180.0    19.0  -139.2    38.4   -90.0    44.5 
usrwei:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
ocost :  0.494  16.727   1.047 2005.248   0.482 2578.230 1288.992 
cost  :  4.055 3867.412   0.801 2005.248   0.472 2578.230 1288.992 
weight:  0.198   0.000   1.000   0.000   1.000   0.000   0.001 
k     :  0.001 (manipulability:  0.022, gain:  0.001, limit:  0.100, len:7)
nspace: -0.043   0.000   0.060   0.000  -0.090   0.000  -0.000 
J     :  0.176   0.063  -0.073   0.026  -0.000   0.000   0.000 
         0.055  -0.225  -0.129  -0.037  -0.000   0.128   0.000 
         0.049  -0.008  -0.120  -0.249   0.180  -0.000  -0.180 
         0.388  -0.918   0.080  -0.994  -0.000  -0.701  -0.000 
        -0.716  -0.246   0.653   0.000  -1.000   0.000   1.000 
J#t   :  1.508   0.107  -2.480   0.116  -2.696   0.036   0.002 
         0.150  -0.090  -4.996  -0.114  -3.350  -0.029   0.003 
        -0.992  -0.051  -0.563  -0.250   0.503  -0.048  -0.000 
         1.592  -0.051   1.729  -0.096   0.020  -0.027  -0.000 
        -0.182  -0.009  -0.087  -0.045  -0.896  -0.009   0.001 
x     :  0.010   0.099   0.000   0.497  -0.052 
J#x   : 47.663  -1.873  19.564  -3.179 -17.465  -0.890   0.014 
Ny    : -0.000   0.000   0.001   0.000  -0.000   0.000  -0.001 
dav   : 47.663  -1.873  19.565  -3.179 -17.465  -0.890   0.013 
dav^  : 47.663  -1.873  19.565  -3.179 -17.465  -0.890   0.013 
loop:  47
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  4798.453 49.452 1298.755 / -0.502 -0.882 -1.911>)
targe-coordst: (#<room73b2-kettle-object #X5be3dd0 room73b2-kettle  4902.37 -81.419 1198.234 / 2.702 0.979 0.391>)
vel-pos : 10.452  99.452   0.022 
vel-rot :  0.497  -0.052 
vel-pos-norm : 100.000/  1.000
vel-rot-norm :   0.500/  0.017
angle :    0.0  -180.0    38.5  -140.0    20.9   -90.0    44.5 
usrwei:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
ocost :  4.055 3867.412   0.801 2005.248   0.472 2578.230 1288.992 
cost  :1288.992 3867.412   0.035 2005.248   0.262 2578.230 1288.992 
weight:  0.001   0.000   1.000   0.000   1.000   0.000   0.001 
k     :  0.001 (manipulability:  0.029, gain:  0.001, limit:  0.100, len:7)
nspace: -0.000   0.000  -0.000   0.000  -0.041   0.000  -0.000 
J     :  0.157   0.119  -0.066   0.100  -0.000  -0.000   0.000 
         0.171  -0.258  -0.120  -0.090  -0.000   0.128   0.000 
         0.087   0.084  -0.139  -0.229   0.180  -0.000  -0.180 
         0.772  -0.557   0.306  -0.917  -0.000  -0.701  -0.000 
        -0.599  -0.477   0.643   0.000  -1.000   0.000   1.000 
J#t   :  0.299   0.043  -1.219   0.003  -0.986  -0.079   0.001 
         0.335  -0.143  -2.444  -0.215  -1.719  -0.040   0.001 
        -0.030   0.004  -0.713  -0.221  -0.279  -0.023   0.000 
         0.198  -0.047   1.947  -0.104   1.158  -0.038  -0.001 
        -0.006   0.001  -0.122  -0.039  -1.044  -0.004   0.001 
x     :  0.010   0.099   0.000   0.497  -0.052 
J#x   :  7.761  -2.124  41.185  -4.083  25.719  -1.333  -0.020 
Ny    : -0.000   0.000   0.001   0.000   0.000   0.000  -0.000 
dav   :  7.760  -2.124  41.186  -4.083  25.719  -1.333  -0.020 
dav^  :  7.760  -2.124  41.186  -4.083  25.719  -1.333  -0.020 
loop:  48
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  4714.163 109.815 1290.826 / 0.144 -1.364 -2.41>)
targe-coordst: (#<room73b2-kettle-object #X5be3dd0 room73b2-kettle  4864.504 -14.217 1284.216 / -2.48 1.414 1.349>)
vel-pos : 10.452  99.452   0.022 
vel-rot :  0.497  -0.052 
vel-pos-norm : 100.000/  1.000
vel-rot-norm :   0.500/  0.017
angle :    0.0  -180.0    79.7  -140.0    46.7   -90.0    44.5 
usrwei:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
ocost :1288.992 3867.412   0.035 2005.248   0.262 2578.230 1288.992 
cost  :1288.992 3867.412   6.875 2005.248   0.619 2578.230 1288.992 
weight:  0.001   0.000   0.127   0.000   0.618   0.000   0.001 
k     :  0.001 (manipulability:  0.027, gain:  0.001, limit:  0.100, len:7)
nspace: -0.000   0.000  -0.039   0.000  -0.074   0.000  -0.000 
J     :  0.029   0.170  -0.070  -0.010  -0.000  -0.000   0.000 
         0.243  -0.139  -0.132  -0.011  -0.000   0.128  -0.000 
        -0.033   0.113  -0.108  -0.250   0.180  -0.000  -0.180 
         0.979  -0.203  -0.029  -0.999  -0.000  -0.700  -0.000 
        -0.137  -0.754   0.643   0.000  -1.000   0.000   1.000 
J#t   : -0.088   0.088  -2.755  -0.005  -1.818  -0.029   0.002 
         0.013  -0.046  -4.775   0.050  -3.022   0.067   0.004 
        -0.119  -0.008   0.191  -0.179   0.310   0.025  -0.000 
         0.376  -0.023   0.095  -0.250   0.020  -0.148  -0.000 
        -0.021  -0.002   0.056  -0.032  -0.928   0.005   0.001 
x     :  0.010   0.099   0.000   0.497  -0.052 
J#x   : 10.810  -0.851 -26.310  -6.747 -14.985  -3.870   0.019 
Ny    : -0.000   0.000  -0.008   0.000  -0.006  -0.000  -0.001 
dav   : 10.809  -0.851 -26.319  -6.747 -14.991  -3.870   0.018 
dav^  : 10.809  -0.851 -26.319  -6.747 -14.991  -3.870   0.018 
loop:  49
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  4771.095 73.95 1301.546 / -0.349 -1.051 -1.976>)
targe-coordst: (#<room73b2-kettle-object #X5be3dd0 room73b2-kettle  4899.899 -54.145 1230.612 / 2.892 1.144 0.494>)
vel-pos : 10.452  99.452   0.022 
vel-rot :  0.497  -0.052 
vel-pos-norm : 100.000/  1.000
vel-rot-norm :   0.500/  0.017
angle :    0.0  -180.0    53.4  -140.0    31.7   -90.0    44.5 
usrwei:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
ocost :1288.992 3867.412   6.875 2005.248   0.619 2578.230 1288.992 
cost  :1288.992 3867.412   0.645 2005.248   0.379 2578.230 1288.992 
weight:  0.001   0.000   1.000   0.000   1.000   0.000   0.001 
k     :  0.001 (manipulability:  0.029, gain:  0.001, limit:  0.100, len:7)
nspace: -0.000   0.000  -0.044   0.000  -0.068   0.000  -0.000 
J     :  0.116   0.145  -0.069   0.055   0.000   0.000  -0.000 
         0.205  -0.216  -0.128  -0.058  -0.000   0.128   0.000 
         0.037   0.103  -0.126  -0.244   0.180   0.000  -0.180 
         0.868  -0.467   0.170  -0.975  -0.000  -0.701   0.000 
        -0.457  -0.615   0.643   0.000  -1.000   0.000   1.000 
J#t   :  0.204   0.066  -2.090  -0.039  -1.479  -0.087   0.001 
         0.296  -0.105  -3.993  -0.179  -2.647  -0.049   0.002 
        -0.100   0.005  -0.629  -0.208  -0.198  -0.003   0.000 
         0.306  -0.052   1.850  -0.170   1.078  -0.078  -0.001 
        -0.019   0.001  -0.103  -0.037  -1.028  -0.000   0.001 
x     :  0.010   0.099   0.000   0.497  -0.052 
J#x   : 10.576  -2.033  29.004  -5.783  17.813  -2.559  -0.014 
Ny    : -0.000   0.000  -0.000   0.000  -0.001   0.000  -0.000 
dav   : 10.576  -2.033  29.004  -5.783  17.812  -2.558  -0.014 
dav^  : 10.576  -2.033  29.004  -5.783  17.812  -2.558  -0.014 
;; inverse-kinematics failed.
;; dif-pos : #f(20.3829 193.946 0.04295)/(195.014/1)
;; dif-rot : #f(1.56227 -0.163335 -5.551115e-17)/(1.57079/0.017453)
;;  coords : #<coordinates #X756df18  5000.0 250.0 550.0 / 1.571 0.0 0.0>
;;  angles : (-6.86932 -57.0012 -19.9991 -75.7242 77.2858 49.1445 -15.0728 0.0 -3.0 45.0 0.0 -110.0 0.0 0.0 0.0 0.0 0.0 0.0 -17.54 42.976 -25.435 0.0 0.0 20.6288 0.0 0.0 -17.54 42.976 -25.435 0.0 0.0 8.87905 0.0 -2.0 0.0 -2.0)
;;    args : ((#<room73b2-kettle-object #X5be3dd0 room73b2-kettle  4862.396 -6.687 1288.028 / -2.25 1.398 1.577>) :move-target #<cascaded-coords #X7e323e8  4711.281 116.58 1287.738 / 0.343 -1.37 -2.607> :collision-avoidance-link-pair nil :link-list (#<bodyset-link #X77626f0 :larm-shoulder-y  4895.0 278.0 1110.0 / 1.571 1.225e-16 3.142> #<bodyset-link #X7781968 :larm-shoulder-p  4748.0 278.0 1110.0 / -1.571 -2.054e-15 -1.571> #<bodyset-link #X77ca708 :larm-shoulder-r  4748.0 296.0 1110.0 / 1.680e-16 0.133 -1.571> #<bodyset-link #X77e1ec8 :larm-elbow-p  4499.143 279.0 1135.18 / -2.265 -0.085 -0.102> #<bodyset-link #X78095b0 :larm-wrist-y  4599.291 170.721 1121.799 / 0.796 -0.618 1.696> #<bodyset-link #X7814888 :larm-wrist-r  4677.499 104.514 1111.349 / 2.439 -0.102 2.52> #<bodyset-link #X7872508 :larm-wrist-p  4677.499 104.514 1111.349 / 0.886 0.172 -3.038>) :link-list (#<bodyset-link #X77626f0 :larm-shoulder-y  4895.0 278.0 1110.0 / 1.571 1.225e-16 3.142> #<bodyset-link #X7781968 :larm-shoulder-p  4748.0 278.0 1110.0 / -1.571 -2.054e-15 -1.571> #<bodyset-link #X77ca708 :larm-shoulder-r  4748.0 296.0 1110.0 / 1.680e-16 0.133 -1.571> #<bodyset-link #X77e1ec8 :larm-elbow-p  4499.143 279.0 1135.18 / -2.265 -0.085 -0.102> #<bodyset-link #X78095b0 :larm-wrist-y  4599.291 170.721 1121.799 / 0.796 -0.618 1.696> #<bodyset-link #X7814888 :larm-wrist-r  4677.499 104.514 1111.349 / 2.439 -0.102 2.52> #<bodyset-link #X7872508 :larm-wrist-p  4677.499 104.514 1111.349 / 0.886 0.172 -3.038>) :move-target #<cascaded-coords #X7e323e8  4711.281 116.58 1287.738 / 0.343 -1.37 -2.607> :rotation-axis :z :debug-view t)
;; command : (let ((r (instance h7-robot :init))) (progn (send r :newcoords (make-coords :4x4 #2f((2.220446e-16 -1.0 0.0 5000.0) (1.0 2.220446e-16 0.0 250.0) (0.0 0.0 1.0 550.0) (0.0 0.0 0.0 1.0)))) (mapc #'(lambda (j a) (send* j :joint-angle a nil)) (list (send r :larm-shoulder-y) (send r :larm-shoulder-p) (send r :larm-shoulder-r) (send r :larm-elbow-p) (send r :larm-wrist-y) (send r :larm-wrist-r) (send r :larm-wrist-p) (send r :larm-finger1) (send r :rarm-shoulder-y) (send r :rarm-shoulder-p) (send r :rarm-shoulder-r) (send r :rarm-elbow-p) (send r :rarm-wrist-y) (send r :rarm-wrist-r) (send r :rarm-wrist-p) (send r :rarm-finger1) (send r :lleg-crotch-y) (send r :lleg-crotch-r) (send r :lleg-crotch-p) (send r :lleg-knee-p) (send r :lleg-ankle-p) (send r :lleg-ankle-r) (send r :lleg-toe) (send r :head-neck-p) (send r :rleg-crotch-y) (send r :rleg-crotch-r) (send r :rleg-crotch-p) (send r :rleg-knee-p) (send r :rleg-ankle-p) (send r :rleg-ankle-r) (send r :rleg-toe) (send r :head-neck-y) (send r :larm-finger2) (send r :larm-finger3) (send r :rarm-finger2) (send r :rarm-finger3)) '(-6.86932 -57.0012 -19.9991 -75.7242 77.2858 49.1445 -15.0728 0.0 -3.0 45.0 0.0 -110.0 0.0 0.0 0.0 0.0 0.0 0.0 -17.54 42.976 -25.435 0.0 0.0 20.6288 0.0 0.0 -17.54 42.976 -25.435 0.0 0.0 8.87905 0.0 -2.0 0.0 -2.0)) (objects (list r))) (send* r :inverse-kinematics (list (make-coords :pos #f(4862.4 -6.68746 1288.03) :rot #2f((-0.10769 -0.623102 -0.774691) (-0.133481 -0.763106 0.632339) (-0.985183 0.171503 -0.000993))) :dump-command nil :debug-view t :move-target (let* ((p (send r :larm-wrist-p)) (c (make-cascoords :coords (send (send p :copy-worldcoords) :transform (make-cascoords :4x4 #2f((2.220446e-16 -1.619158e-16 1.0 0.0) (4.906539e-18 1.0 1.619158e-16 -5.684342e-14) (-1.0 4.906539e-18 2.220446e-16 -180.0) (0.0 0.0 0.0 1.0)))) :parent p))) c) :collision-avoidance-link-pair nil :link-list (list (send r :larm-shoulder-y) (send r :larm-shoulder-p) (send r :larm-shoulder-r) (send r :larm-elbow-p) (send r :larm-wrist-y) (send r :larm-wrist-r) (send r :larm-wrist-p)) :link-list (list (send r :larm-shoulder-y) (send r :larm-shoulder-p) (send r :larm-shoulder-r) (send r :larm-elbow-p) (send r :larm-wrist-y) (send r :larm-wrist-r) (send r :larm-wrist-p)) :move-target (let* ((p (send r :larm-wrist-p)) (c (make-cascoords :coords (send (send p :copy-worldcoords) :transform (make-cascoords :4x4 #2f((2.220446e-16 -1.619158e-16 1.0 0.0) (4.906539e-18 1.0 1.619158e-16 -5.684342e-14) (-1.0 4.906539e-18 2.220446e-16 -180.0) (0.0 0.0 0.0 1.0)))) :parent p))) c) :rotation-axis :z :debug-view t)))
;; dump debug command to /tmp/irtmodel-ik-9251/h7-robot-2012-11-20-21-22-49-failure.l
;; (progn (load "/tmp/irtmodel-ik-9251/h7-robot-2012-11-20-21-22-49-failure.l")(ik-setup)(ik-check))
nil
47.irteusgl$ nil
47.irteusgl$ (send *robot* :larm :inverse-kinematics
      *bottle*
      :link-list (send *robot* :link-list (send *robot* :larm :end-coords :parent))
      :move-target (send *robot* :larm :end-coords)
      :rotation-axis :z
      :debug-view t)

irteusgl 0 error: unbound variable *bottle* in (send *robot* :larm :inverse-kinematics *bottle* :link-list (send *robot* :link-list (send *robot* :larm :end-coords :parent)) :move-target (send *robot* :larm :end-coords) :rotation-axis :z :debug-view t)
48.E1-irteusgl$ nil
48.E1-irteusgl$ reset
49.irteusgl$ (setq *bottle* (send *room* :object "room73b2-bottle"))
#<room73b2-bottle-object #X667e2e8 room73b2-bottle  4900.0 850.0 700.0 / 0.0 0.0 0.0>
50.irteusgl$ (send *robot* :larm :inverse-kinematics
      *bottle*
      :link-list (send *robot* :link-list (send *robot* :larm :end-coords :parent))
      :move-target (send *robot* :larm :end-coords)
      :rotation-axis :z
      :debug-view t)

loop:   1
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  4900.052 849.883 1120.007 / 1.571 0.104 -1.571>)
targe-coordst: (#<room73b2-bottle-object #X667e2e8 room73b2-bottle  4900.0 850.0 700.0 / 0.0 0.0 0.0>)
vel-pos : 10.425  99.455   0.011 
vel-rot :  0.497  -0.052 
vel-pos-norm : 100.000/  1.000
vel-rot-norm :   0.500/  0.017
angle :   -6.9   -57.0   -20.0   -75.7    77.3    49.1   -15.1 
usrwei:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
ocost :100000000000000000000.000 100000000000000000000.000 100000000000000000000.000 100000000000000000000.000 100000000000000000000.000 100000000000000000000.000 100000000000000000000.000 
cost  : 27.133   0.077 1647.127   0.136   2.045   1.411   1.082 
weight:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
k     :  0.000 (manipulability:  0.037, gain:  0.001, limit:  0.100, len:7)
nspace: -0.411   0.005   0.573   0.004  -0.268  -0.171   0.064 
J     :  0.005   0.069   0.130   0.152   0.000  -0.000   0.000 
        -0.001   0.564   0.032   0.335   0.031   0.174   0.000 
         0.572  -0.001   0.459  -0.124  -0.136  -0.000  -0.180 
        -0.104   0.119   0.451   0.414  -0.632   0.260  -0.000 
        -0.995  -0.012  -0.890   0.144   0.756   0.000   1.000 
J#t   : -1.328  -1.854   3.218   4.519   3.525  -3.885  -1.794 
         0.472   1.680  -0.662  -0.185  -0.035   0.777  -0.047 
         1.602   0.199   0.929  -0.907   0.211   0.894   2.391 
        -0.207  -0.128   0.230  -0.110  -1.155   0.789   0.886 
         0.224  -0.028   0.239  -0.189   0.163   0.383   1.338 
x     :  0.010   0.099   0.000   0.497  -0.052 
J#x   : -4.664   4.888   3.998  -0.927 -31.479  23.442  19.933 
Ny    : -0.249   0.204   0.237  -0.281  -0.005  -0.167   0.010 
dav   : -4.913   5.092   4.234  -1.208 -31.484  23.275  19.943 
dav^  : -4.913   5.092   4.234  -1.208 -31.484  23.275  19.943 
loop:   2
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  4875.604 832.604 1019.293 / 1.791 0.49 -1.14>)
targe-coordst: (#<room73b2-bottle-object #X667e2e8 room73b2-bottle  4900.0 850.0 700.0 / 0.0 0.0 0.0>)
vel-pos : 50.025  74.696 -43.794 
vel-rot :  0.431  -0.253 
vel-pos-norm : 100.000/  1.000
vel-rot-norm :   0.500/  0.017
angle :  -11.8   -51.9   -15.8   -76.9    45.8    72.4     4.9 
usrwei:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
ocost : 27.133   0.077 1647.127   0.136   2.045   1.411   1.082 
cost  :  9.076   0.044  91.703   0.165   0.602   8.245   0.282 
weight:  1.000   1.000   1.000   0.858   1.000   0.108   1.000 
k     :  0.001 (manipulability:  0.017, gain:  0.001, limit:  0.100, len:7)
nspace: -0.312   0.002   0.492   0.005  -0.116  -0.040  -0.007 
J     :  0.090   0.181   0.189   0.180  -0.000   0.000   0.000 
         0.184   0.483   0.099   0.210  -0.005   0.179   0.000 
         0.516  -0.181   0.431  -0.198  -0.172  -0.000  -0.180 
        -0.470   0.364   0.126   0.601  -0.301  -0.085   0.000 
        -0.802   0.204  -0.978   0.211   0.953   0.000   1.000 
J#t   : -1.314  -1.186   3.465   3.139   8.403  -0.614  -6.081 
         1.383   2.133  -1.526  -1.028  -2.330   0.309   1.616 
         1.479  -0.586   0.825  -0.675  -4.004   0.195   6.058 
        -0.218  -0.097   0.249   0.125  -2.731   0.084   2.660 
         0.276  -0.139   0.138  -0.058  -0.650   0.042   2.012 
x     :  0.050   0.075  -0.044   0.431  -0.253 
J#x   :-10.935   6.801   5.486  10.216 -33.909   0.540  10.856 
Ny    : -0.161   0.127   0.170  -0.220   0.041  -0.016   0.018 
dav   :-11.096   6.928   5.655   9.996 -33.868   0.525  10.874 
dav^  :-11.096   6.928   5.655   9.996 -33.868   0.525  10.874 
loop:   3
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  4886.05 832.305 937.13 / 2.119 0.43 -0.521>)
targe-coordst: (#<room73b2-bottle-object #X667e2e8 room73b2-bottle  4900.0 850.0 700.0 / 0.0 0.0 0.0>)
vel-pos : 44.448  36.647 -81.740 
vel-rot :  0.368  -0.339 
vel-pos-norm : 100.000/  1.000
vel-rot-norm :   0.500/  0.017
angle :  -22.9   -45.0   -10.1   -66.9    11.9    72.9    15.7 
usrwei:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
ocost :  9.076   0.044  91.703   0.165   0.602   8.245   0.282 
cost  :  2.177   0.000  16.690   0.072   0.184   8.766   1.157 
weight:  1.000   1.000   1.000   1.000   1.000   0.102   0.464 
k     :  0.001 (manipulability:  0.022, gain:  0.001, limit:  0.100, len:7)
nspace: -0.138  -0.000   0.393  -0.001  -0.023  -0.039  -0.033 
J     :  0.256   0.119   0.303   0.109   0.000  -0.000   0.000 
         0.356   0.372   0.183   0.114  -0.014   0.173   0.000 
         0.339  -0.367   0.334  -0.275  -0.172  -0.000  -0.180 
        -0.416   0.738   0.081   0.844  -0.282  -0.271   0.000 
        -0.452   0.338  -0.903   0.287   0.956   0.000   1.000 
J#t   : -3.031   0.581   5.534  -0.384   6.261   0.097  -2.428 
         2.822   1.159  -2.649  -0.217  -2.607   0.100   1.038 
         4.193  -3.558  -3.091   3.336  -5.743  -0.566   4.818 
         0.825  -0.872  -0.863   1.634  -2.154  -0.218   1.472 
         1.008  -0.846  -0.822   1.001  -0.772  -0.150   1.444 
x     :  0.044   0.037  -0.082   0.368  -0.339 
J#x   :-23.620  18.615  20.773  -2.041   6.946   1.438 -23.575 
Ny    : -0.063   0.067   0.069  -0.105  -0.004  -0.024   0.045 
dav   :-23.682  18.682  20.843  -2.146   6.942   1.414 -23.530 
dav^  :-23.682  18.682  20.843  -2.146   6.942   1.414 -23.530 
loop:   4
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  4907.469 837.159 899.239 / 2.125 -0.008 -0.139>)
targe-coordst: (#<room73b2-bottle-object #X667e2e8 room73b2-bottle  4900.0 850.0 700.0 / 0.0 0.0 0.0>)
vel-pos :  6.680  13.637 -98.840 
vel-rot :  0.139   0.008 
vel-pos-norm : 100.000/  1.000
vel-rot-norm :   0.139/  0.017
angle :  -46.6   -26.3    10.7   -69.1    18.9    74.4    -7.8 
usrwei:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
ocost :  2.177   0.000  16.690   0.072   0.184   8.766   1.157 
cost  :  0.088   0.122   1.512   0.021   0.243  10.442   0.468 
weight:  1.000   0.891   1.000   1.000   0.805   0.087   1.000 
k     :  0.001 (manipulability:  0.026, gain:  0.001, limit:  0.100, len:7)
nspace:  0.001  -0.010   0.124  -0.000  -0.029  -0.034   0.017 
J     :  0.305  -0.046   0.335   0.040   0.000  -0.000  -0.000 
         0.465   0.259   0.150   0.075   0.007   0.178   0.000 
         0.063  -0.361   0.245  -0.290  -0.173  -0.000  -0.180 
         0.008   0.979   0.185   0.947  -0.267   0.135  -0.000 
        -0.139   0.202  -0.931   0.255   0.963   0.000   1.000 
J#t   : -0.525  -0.763   3.062   1.624   4.578  -0.843  -1.879 
         2.157   0.988  -1.611  -1.358  -1.974   0.480   0.841 
         1.100  -2.370  -1.081  -0.382  -9.673   1.821   9.002 
        -0.065  -0.316  -0.007   0.592  -2.543   0.442   2.337 
         0.265  -0.578  -0.298   0.132  -1.631   0.369   2.405 
x     :  0.007   0.014  -0.099   0.139   0.008 
J#x   : -5.154  11.131   5.846   6.505  34.011  -6.576 -31.368 
Ny    : -0.003   0.029   0.012  -0.034  -0.022  -0.029   0.035 
dav   : -5.158  11.160   5.858   6.471  33.989  -6.605 -31.334 
dav^  : -5.158  11.160   5.858   6.471  33.989  -6.605 -31.334 
loop:   5
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  4882.005 829.158 819.057 / 2.065 -0.021 -0.042>)
targe-coordst: (#<room73b2-bottle-object #X667e2e8 room73b2-bottle  4900.0 850.0 700.0 / 0.0 0.0 0.0>)
vel-pos :  5.999 -16.942 -98.372 
vel-rot :  0.042   0.021 
vel-pos-norm : 100.000/  1.000
vel-rot-norm :   0.047/  0.017
angle :  -51.7   -15.1    16.6   -62.6    52.9    67.8   -39.1 
usrwei:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
ocost :  0.088   0.122   1.512   0.021   0.243  10.442   0.468 
cost  :  0.398   0.208   0.962   0.177   0.764   5.106  37.090 
weight:  0.715   0.828   1.000   0.850   0.567   1.000   0.026 
k     :  0.000 (manipulability:  0.054, gain:  0.001, limit:  0.100, len:7)
nspace:  0.009  -0.023   0.076  -0.005  -0.082  -0.325   0.011 
J     :  0.250  -0.057   0.354   0.043  -0.000   0.000  -0.000 
         0.491   0.300   0.127   0.140   0.043   0.140   0.000 
         0.015  -0.318   0.282  -0.270  -0.167  -0.000  -0.180 
         0.021   0.985   0.173   0.936  -0.294   0.631   0.000 
        -0.042   0.174  -0.961   0.229   0.926  -0.000   1.000 
J#t   : -0.305  -1.254   2.490   2.730   2.001  -1.834   0.121 
         1.967   1.044  -1.004  -1.711  -0.660   0.812  -0.062 
         0.024  -2.137  -0.150  -1.715   0.567   6.183   0.094 
        -0.433  -0.224   0.223   0.380   0.128   1.383   0.029 
        -0.024  -0.818  -0.139   0.183   0.965   1.493   0.072 
x     :  0.006  -0.017  -0.098   0.042   0.021 
J#x   : -3.219   9.085   3.043  13.398  -0.405 -31.159  -0.272 
Ny    :  0.013  -0.012  -0.012   0.012  -0.031  -0.010   0.017 
dav   : -3.207   9.073   3.031  13.409  -0.436 -31.169  -0.254 
dav^  : -3.207   9.073   3.031  13.409  -0.436 -31.169  -0.254 
loop:   6
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  4884.618 825.855 722.098 / 1.668 0.052 -0.015>)
targe-coordst: (#<room73b2-bottle-object #X667e2e8 room73b2-bottle  4900.0 850.0 700.0 / 0.0 0.0 0.0>)
vel-pos : 23.658 -17.334 -21.161 
vel-rot :  0.015  -0.052 
vel-pos-norm :  36.165/  1.000
vel-rot-norm :   0.054/  0.017
angle :  -54.9    -6.1    19.6   -49.2    52.4    36.6   -39.4 
usrwei:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
ocost :  0.398   0.208   0.962   0.177   0.764   5.106  37.090 
cost  :  0.620   0.291   0.759   0.585   0.753   0.743  40.537 
weight:  0.617   0.774   1.000   0.631   1.000   1.000   0.024 
k     :  0.000 (manipulability:  0.047, gain:  0.001, limit:  0.100, len:7)
nspace:  0.017  -0.037   0.055  -0.032  -0.143  -0.095   0.011 
J     :  0.043  -0.175   0.332  -0.017   0.000   0.000  -0.000 
         0.546   0.342   0.230   0.239   0.092   0.139   0.000 
         0.010  -0.311   0.327  -0.272  -0.107  -0.000  -0.180 
        -0.052   0.869   0.484   0.784  -0.621   0.634  -0.000 
        -0.015   0.492  -0.867   0.490   0.596   0.000   1.000 
J#t   : -1.543  -1.023   2.814   3.687   1.862  -3.604   0.008 
         1.613   0.562   0.070  -0.542   0.181   0.155  -0.035 
        -0.011  -1.286  -0.845  -4.403   2.628  10.409   0.476 
        -0.429   0.092   0.107  -0.005  -0.029   1.311   0.059 
        -0.511  -0.483  -0.207  -0.527   1.840   3.227   0.208 
x     :  0.024  -0.017  -0.021   0.015  -0.052 
J#x   : -2.528   1.122   5.470  12.432  -6.315 -26.115  -1.097 
Ny    :  0.016  -0.005  -0.005   0.004  -0.035  -0.028   0.018 
dav   : -2.511   1.117   5.465  12.436  -6.350 -26.143  -1.079 
dav^  : -2.511   1.117   5.465  12.436  -6.350 -26.143  -1.079 
loop:   7
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  4895.825 837.67 699.827 / 1.311 0.051 -0.022>)
targe-coordst: (#<room73b2-bottle-object #X667e2e8 room73b2-bottle  4900.0 850.0 700.0 / 0.0 0.0 0.0>)
vel-pos : 12.964  -0.880   0.813 
vel-rot :  0.022  -0.051 
vel-pos-norm :  13.019/  1.000
vel-rot-norm :   0.055/  0.017
angle :  -57.4    -4.9    25.1   -36.8    46.1    10.4   -40.5 
usrwei:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
ocost :  0.620   0.291   0.759   0.585   0.753   0.743  40.537 
cost  :  0.825   0.303   0.473   1.295   0.607   0.152  62.164 
weight:  0.548   0.768   1.000   0.436   1.000   1.000   0.016 
k     :  0.000 (manipulability:  0.041, gain:  0.001, limit:  0.100, len:7)
nspace:  0.024  -0.039   0.027  -0.056  -0.117  -0.008   0.007 
J     : -0.143  -0.287   0.256  -0.101  -0.000  -0.000  -0.000 
         0.541   0.284   0.332   0.264   0.115   0.137   0.000 
         0.004  -0.311   0.344  -0.264  -0.033  -0.000  -0.180 
        -0.051   0.675   0.729   0.563  -0.748   0.649  -0.000 
        -0.022   0.736  -0.676   0.682   0.181   0.000   1.000 
J#t   : -1.238  -4.192   0.343   5.088   1.701   1.430  -0.461 
         1.188  -0.678   0.312   1.141   0.787   0.366  -0.176 
        -3.171   8.438   4.862  -8.057   3.263  -3.740   1.823 
        -0.261   0.354   0.239  -0.043  -0.560   0.276   0.025 
        -1.856   2.906   1.660  -1.672   2.089  -1.175   0.674 
x     :  0.013  -0.001   0.001   0.022  -0.051 
J#x   :  3.951 -10.704  -4.068   8.159  -5.400   4.633  -2.180 
Ny    :  0.021  -0.020  -0.008   0.010  -0.032  -0.014   0.009 
dav   :  3.972 -10.724  -4.076   8.169  -5.431   4.619  -2.171 
dav^  :  3.972 -10.724  -4.076   8.169  -5.431   4.619  -2.171 
loop:   8
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  4904.064 848.054 709.615 / 1.419 0.007 0.005>)
targe-coordst: (#<room73b2-bottle-object #X667e2e8 room73b2-bottle  4900.0 850.0 700.0 / 0.0 0.0 0.0>)
vel-pos :  1.373   4.267  -9.626 
vel-rot : -0.005  -0.007 
vel-pos-norm :  10.619/  1.000
vel-rot-norm :   0.008/  0.017
angle :  -53.5   -15.7    21.0   -28.6    40.6    15.1   -42.6 
usrwei:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
ocost :  0.825   0.303   0.473   1.295   0.607   0.152  62.164 
cost  :  0.515   0.203   0.678   2.290   0.508   0.226 228.157 
weight:  1.000   1.000   0.596   0.304   1.000   0.816   0.004 
k     :  0.000 (manipulability:  0.036, gain:  0.001, limit:  0.100, len:7)
nspace:  0.020  -0.027   0.028  -0.061  -0.097  -0.013   0.002 
J     : -0.077  -0.282   0.277  -0.110  -0.000  -0.000  -0.000 
         0.565   0.280   0.400   0.224   0.118   0.132   0.000 
        -0.003  -0.350   0.294  -0.288  -0.047   0.000  -0.180 
        -0.007   0.704   0.682   0.586  -0.711   0.677   0.000 
         0.005   0.710  -0.677   0.733   0.260  -0.000   1.000 
J#t   : -3.827   1.039   4.299   2.385   2.357  -5.031  -0.134 
         1.063   0.380   0.711   0.125   0.543  -0.637  -0.021 
         3.059  -6.361  -5.447  -0.818   2.861  15.817   0.551 
        -0.212   0.030   0.024   0.089  -0.370   0.953   0.023 
        -0.017  -1.794  -1.448   0.624   2.293   5.181   0.200 
x     :  0.001   0.004  -0.010  -0.005  -0.007 
J#x   : -1.666   4.362   4.064   0.407  -2.041 -11.509  -0.402 
Ny    : -0.006   0.016   0.009  -0.012  -0.000  -0.015   0.004 
dav   : -1.672   4.378   4.073   0.395  -2.041 -11.524  -0.399 
dav^  : -1.672   4.378   4.073   0.395  -2.041 -11.524  -0.399 
loop:   9
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  4900.183 846.202 705.598 / 1.238 0.013 -0.002>)
targe-coordst: (#<room73b2-bottle-object #X667e2e8 room73b2-bottle  4900.0 850.0 700.0 / 0.0 0.0 0.0>)
vel-pos :  3.602   1.424  -5.549 
vel-rot :  0.002  -0.013 
vel-pos-norm :   6.767/  1.000
vel-rot-norm :   0.013/  0.017
angle :  -55.1   -11.3    25.1   -28.2    38.6     3.5   -43.0 
usrwei:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
ocost :  0.515   0.203   0.678   2.290   0.508   0.226 228.157 
cost  :  0.636   0.241   0.473   2.361   0.475   0.050 329.451 
weight:  0.611   0.806   1.000   0.298   1.000   1.000   0.003 
k     :  0.000 (manipulability:  0.037, gain:  0.001, limit:  0.100, len:7)
nspace:  0.018  -0.029   0.027  -0.061  -0.090  -0.001   0.002 
J     : -0.181  -0.323   0.217  -0.139  -0.000  -0.000   0.000 
         0.539   0.239   0.408   0.233   0.123   0.132  -0.000 
        -0.001  -0.333   0.314  -0.278  -0.011   0.000  -0.180 
        -0.013   0.589   0.790   0.461  -0.730   0.682   0.000 
        -0.002   0.808  -0.578   0.780   0.062   0.000   1.000 
J#t   : -2.182  -2.979  -0.128   2.818   4.413   5.496  -0.102 
         0.835  -0.588   0.158   0.662   1.818   1.837  -0.045 
        -2.320   6.522   7.189  -1.883  -4.112 -17.121   0.464 
        -0.139   0.197   0.160  -0.028  -0.678   0.402  -0.002 
        -1.778   2.451   2.587   0.390  -0.184  -5.604   0.171 
x     :  0.004   0.001  -0.006   0.002  -0.013 
J#x   :  1.642  -4.509  -4.176   0.945   2.421  10.881  -0.298 
Ny    : -0.000   0.006   0.002  -0.007  -0.001  -0.005   0.002 
dav   :  1.642  -4.503  -4.174   0.938   2.420  10.876  -0.296 
dav^  :  1.642  -4.503  -4.174   0.938   2.420  10.876  -0.296 
loop:  10
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  4900.792 846.057 705.105 / 1.422 0.013 0.003>)
targe-coordst: (#<room73b2-bottle-object #X667e2e8 room73b2-bottle  4900.0 850.0 700.0 / 0.0 0.0 0.0>)
vel-pos :  3.847   1.351  -5.060 
vel-rot : -0.003  -0.013 
vel-pos-norm :   6.499/  1.000
vel-rot-norm :   0.013/  0.017
angle :  -53.5   -15.8    20.9   -27.3    41.0    14.4   -43.3 
usrwei:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
ocost :  0.636   0.241   0.473   2.361   0.475   0.050 329.451 
cost  :  0.517   0.202   0.684   2.540   0.514   0.215 455.501 
weight:  1.000   1.000   0.594   0.282   0.660   0.823   0.002 
k     :  0.000 (manipulability:  0.034, gain:  0.001, limit:  0.100, len:7)
nspace:  0.020  -0.027   0.028  -0.060  -0.065  -0.012   0.001 
J     : -0.078  -0.282   0.278  -0.112  -0.000  -0.000  -0.000 
         0.563   0.285   0.401   0.226   0.120   0.131   0.000 
        -0.003  -0.347   0.297  -0.285  -0.045   0.000  -0.180 
        -0.013   0.707   0.677   0.587  -0.705   0.686   0.000 
         0.003   0.708  -0.679   0.731   0.249  -0.000   1.000 
J#t   : -3.869   1.157   4.325   2.303   2.221  -5.215  -0.065 
         1.067   0.377   0.716   0.145   0.500  -0.684  -0.010 
         3.394  -7.099  -5.680   0.040   2.791  15.793   0.297 
        -0.232   0.048   0.034   0.078  -0.332   0.961   0.011 
         0.114  -2.088  -1.539   0.993   2.206   5.082   0.111 
x     :  0.004   0.001  -0.005  -0.003  -0.013 
J#x   : -1.797   3.877   3.787  -0.241  -1.852  -9.710  -0.185 
Ny    : -0.007   0.016   0.008  -0.012   0.003  -0.011   0.002 
dav   : -1.804   3.893   3.795  -0.252  -1.848  -9.721  -0.183 
dav^  : -1.804   3.893   3.795  -0.252  -1.848  -9.721  -0.183 
loop:  11
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  4900.574 846.888 705.117 / 1.26 0.01 -0.001>)
targe-coordst: (#<room73b2-bottle-object #X667e2e8 room73b2-bottle  4900.0 850.0 700.0 / 0.0 0.0 0.0>)
vel-pos :  2.838   1.502  -5.088 
vel-rot :  0.001  -0.010 
vel-pos-norm :   6.017/  1.000
vel-rot-norm :   0.010/  0.017
angle :  -55.3   -11.9    24.7   -27.5    39.2     4.7   -43.5 
usrwei:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
ocost :  0.517   0.202   0.684   2.540   0.514   0.215 455.501 
cost  :  0.649   0.236   0.491   2.490   0.484   0.067 573.499 
weight:  0.606   0.809   1.000   1.000   1.000   1.000   0.002 
k     :  0.000 (manipulability:  0.035, gain:  0.001, limit:  0.100, len:7)
nspace:  0.018  -0.028   0.028  -0.211  -0.092  -0.002   0.001 
J     : -0.168  -0.318   0.228  -0.137   0.000   0.000  -0.000 
         0.543   0.247   0.408   0.233   0.123   0.131   0.000 
        -0.001  -0.331   0.313  -0.276  -0.015  -0.000  -0.180 
        -0.010   0.609   0.774   0.481  -0.723   0.688   0.000 
        -0.001   0.793  -0.596   0.773   0.082  -0.000   1.000 
J#t   : -1.300  -4.159  -0.347   3.871   2.976   4.473  -0.091 
         1.055  -0.731   0.148   0.785   1.394   1.411  -0.033 
        -2.917   6.813   6.893  -2.045  -2.896 -15.435   0.339 
        -0.172   0.236   0.193  -0.024  -0.665   0.343   0.000 
        -1.661   2.037   2.328   0.791  -0.244  -5.253   0.118 
x     :  0.003   0.002  -0.005   0.001  -0.010 
J#x   :  1.655  -3.858  -3.352   0.846   1.543   8.330  -0.183 
Ny    : -0.005   0.013   0.007  -0.011   0.003  -0.009   0.001 
dav   :  1.649  -3.845  -3.346   0.835   1.546   8.321  -0.182 
dav^  :  1.649  -3.845  -3.346   0.835   1.546   8.321  -0.182 
loop:  12
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  4900.594 847.092 705.629 / 1.404 0.008 0.002>)
targe-coordst: (#<room73b2-bottle-object #X667e2e8 room73b2-bottle  4900.0 850.0 700.0 / 0.0 0.0 0.0>)
vel-pos :  2.815   1.060  -5.608 
vel-rot : -0.002  -0.008 
vel-pos-norm :   6.364/  1.000
vel-rot-norm :   0.008/  0.017
angle :  -53.6   -15.8    21.4   -26.7    40.7    13.0   -43.7 
usrwei:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
ocost :  0.649   0.236   0.491   2.490   0.484   0.067 573.499 
cost  :  0.528   0.202   0.659   2.661   0.509   0.192 742.564 
weight:  1.000   1.000   0.603   0.273   0.663   0.839   0.001 
k     :  0.000 (manipulability:  0.034, gain:  0.001, limit:  0.100, len:7)
nspace:  0.021  -0.027   0.027  -0.060  -0.065  -0.010   0.001 
J     : -0.089  -0.288   0.273  -0.117  -0.000  -0.000   0.000 
         0.562   0.281   0.405   0.227   0.121   0.130   0.000 
        -0.002  -0.345   0.298  -0.283  -0.041   0.000  -0.180 
        -0.008   0.696   0.689   0.574  -0.705   0.691   0.000 
         0.002   0.718  -0.669   0.738   0.225   0.000   1.000 
J#t   : -3.887   1.180   4.250   2.147   2.285  -4.919  -0.050 
         0.988   0.416   0.797   0.170   0.548  -0.783  -0.009 
         3.291  -7.117  -5.585   0.481   2.819  15.233   0.219 
        -0.232   0.076   0.056   0.072  -0.362   0.881   0.007 
         0.051  -2.071  -1.504   1.140   2.237   4.916   0.080 
x     :  0.003   0.001  -0.006  -0.002  -0.008 
J#x   : -1.625   3.456   3.221  -0.334  -1.506  -8.104  -0.117 
Ny    : -0.008   0.016   0.008  -0.011   0.005  -0.010   0.001 
dav   : -1.633   3.472   3.230  -0.345  -1.502  -8.115  -0.115 
dav^  : -1.633   3.472   3.230  -0.345  -1.502  -8.115  -0.115 
loop:  13
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  4900.43 847.334 705.194 / 1.267 0.007 -0.001>)
targe-coordst: (#<room73b2-bottle-object #X667e2e8 room73b2-bottle  4900.0 850.0 700.0 / 0.0 0.0 0.0>)
vel-pos :  2.454   1.210  -5.176 
vel-rot :  0.001  -0.007 
vel-pos-norm :   5.854/  1.000
vel-rot-norm :   0.007/  0.017
angle :  -55.3   -12.3    24.6   -27.0    39.2     4.9   -43.8 
usrwei:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
ocost :  0.528   0.202   0.659   2.661   0.509   0.192 742.564 
cost  :  0.648   0.232   0.496   2.588   0.485   0.070 892.099 
weight:  0.607   0.812   1.000   1.000   1.000   1.000   0.001 
k     :  0.000 (manipulability:  0.035, gain:  0.001, limit:  0.100, len:7)
nspace:  0.018  -0.027   0.029  -0.216  -0.092  -0.002   0.001 
J     : -0.165  -0.317   0.230  -0.137  -0.000  -0.000   0.000 
         0.545   0.249   0.409   0.233   0.124   0.130   0.000 
        -0.001  -0.331   0.313  -0.276  -0.015   0.000  -0.180 
        -0.007   0.614   0.770   0.485  -0.719   0.692   0.000 
        -0.001   0.789  -0.600   0.772   0.085   0.000   1.000 
J#t   : -1.374  -3.968  -0.219   3.704   3.057   4.328  -0.063 
         1.033  -0.638   0.194   0.703   1.398   1.323  -0.022 
        -2.694   6.161   6.521  -1.440  -3.125 -14.986   0.231 
        -0.176   0.240   0.198  -0.019  -0.665   0.332   0.000 
        -1.586   1.807   2.201   1.003  -0.306  -5.089   0.080 
x     :  0.002   0.001  -0.005   0.001  -0.007 
J#x   :  1.344  -3.187  -2.877   0.571   1.562   7.309  -0.113 
Ny    : -0.007   0.016   0.008  -0.012   0.004  -0.011   0.001 
dav   :  1.337  -3.171  -2.869   0.560   1.566   7.299  -0.112 
dav^  :  1.337  -3.171  -2.869   0.560   1.566   7.299  -0.112 
loop:  14
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  4900.385 847.356 705.328 / 1.392 0.007 0.001>)
targe-coordst: (#<room73b2-bottle-object #X667e2e8 room73b2-bottle  4900.0 850.0 700.0 / 0.0 0.0 0.0>)
vel-pos :  2.569   0.842  -5.312 
vel-rot : -0.001  -0.007 
vel-pos-norm :   5.960/  1.000
vel-rot-norm :   0.007/  0.017
angle :  -53.9   -15.4    21.7   -26.5    40.8    12.2   -43.9 
usrwei:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
ocost :  0.648   0.232   0.496   2.588   0.485   0.070 892.099 
cost  :  0.549   0.205   0.640   2.707   0.510   0.179 1084.428 
weight:  1.000   1.000   0.610   0.270   0.662   0.848   0.001 
k     :  0.000 (manipulability:  0.033, gain:  0.001, limit:  0.100, len:7)
nspace:  0.023  -0.027   0.026  -0.060  -0.065  -0.009   0.001 
J     : -0.096  -0.290   0.270  -0.119  -0.000   0.000  -0.000 
         0.561   0.279   0.405   0.228   0.122   0.130   0.000 
        -0.001  -0.342   0.300  -0.281  -0.038  -0.000  -0.180 
        -0.007   0.691   0.695   0.568  -0.704   0.694   0.000 
         0.001   0.723  -0.666   0.740   0.211   0.000   1.000 
J#t   : -3.814   1.086   4.106   2.107   2.303  -4.614  -0.039 
         0.952   0.425   0.833   0.190   0.576  -0.818  -0.007 
         2.989  -6.777  -5.231   0.611   2.882  14.426   0.168 
        -0.239   0.106   0.078   0.062  -0.380   0.818   0.005 
        -0.064  -1.945  -1.390   1.186   2.267   4.652   0.061 
x     :  0.003   0.001  -0.005  -0.001  -0.007 
J#x   : -1.385   2.987   2.769  -0.329  -1.361  -6.961  -0.081 
Ny    : -0.008   0.016   0.008  -0.011   0.005  -0.011   0.001 
dav   : -1.393   3.003   2.777  -0.340  -1.356  -6.971  -0.080 
dav^  : -1.393   3.003   2.777  -0.340  -1.356  -6.971  -0.080 
loop:  15
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  4900.322 847.566 705.15 / 1.274 0.006 -0.0>)
targe-coordst: (#<room73b2-bottle-object #X667e2e8 room73b2-bottle  4900.0 850.0 700.0 / 0.0 0.0 0.0>)
vel-pos :  2.264   1.022  -5.136 
vel-rot :  0.000  -0.006 
vel-pos-norm :   5.705/  1.000
vel-rot-norm :   0.006/  0.017
angle :  -55.3   -12.4    24.5   -26.8    39.4     5.2   -44.0 
usrwei:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
ocost :  0.549   0.205   0.640   2.707   0.510   0.179 1084.428 
cost  :  0.652   0.231   0.501   2.634   0.488   0.074 1263.844 
weight:  0.605   0.813   1.000   1.000   1.000   1.000   0.001 
k     :  0.000 (manipulability:  0.034, gain:  0.001, limit:  0.100, len:7)
nspace:  0.018  -0.027   0.029  -0.218  -0.093  -0.002   0.000 
J     : -0.162  -0.316   0.233  -0.137  -0.000   0.000   0.000 
         0.546   0.251   0.408   0.233   0.124   0.130   0.000 
        -0.001  -0.330   0.313  -0.275  -0.016  -0.000  -0.180 
        -0.006   0.620   0.765   0.492  -0.716   0.695   0.000 
        -0.000   0.785  -0.606   0.769   0.091   0.000   1.000 
J#t   : -1.406  -3.835  -0.085   3.628   3.010   4.043  -0.047 
         1.028  -0.566   0.238   0.650   1.361   1.196  -0.016 
        -2.592   5.717   6.129  -1.152  -2.936 -14.094   0.172 
        -0.182   0.244   0.203  -0.012  -0.664   0.320   0.000 
        -1.553   1.651   2.070   1.105  -0.231  -4.789   0.059 
x     :  0.002   0.001  -0.005   0.000  -0.006 
J#x   :  1.170  -2.774  -2.506   0.469   1.401   6.389  -0.078 
Ny    : -0.008   0.017   0.009  -0.012   0.004  -0.012   0.001 
dav   :  1.162  -2.757  -2.498   0.457   1.405   6.377  -0.077 
dav^  :  1.162  -2.757  -2.498   0.457   1.405   6.377  -0.077 
loop:  16
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  4900.287 847.593 705.227 / 1.383 0.006 0.001>)
targe-coordst: (#<room73b2-bottle-object #X667e2e8 room73b2-bottle  4900.0 850.0 700.0 / 0.0 0.0 0.0>)
vel-pos :  2.341   0.726  -5.215 
vel-rot : -0.001  -0.006 
vel-pos-norm :   5.762/  1.000
vel-rot-norm :   0.006/  0.017
angle :  -54.2   -15.2    22.0   -26.4    40.8    11.6   -44.1 
usrwei:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
ocost :  0.652   0.231   0.501   2.634   0.488   0.074 1263.844 
cost  :  0.565   0.207   0.625   2.733   0.511   0.170 1288.992 
weight:  1.000   1.000   0.615   0.268   0.662   0.855   0.001 
k     :  0.000 (manipulability:  0.033, gain:  0.001, limit:  0.100, len:7)
nspace:  0.024  -0.028   0.026  -0.060  -0.065  -0.008   0.000 
J     : -0.101  -0.292   0.268  -0.121  -0.000  -0.000  -0.000 
         0.561   0.278   0.404   0.229   0.123   0.129   0.000 
        -0.001  -0.340   0.302  -0.280  -0.036   0.000  -0.180 
        -0.006   0.688   0.699   0.564  -0.704   0.696  -0.000 
         0.001   0.726  -0.663   0.741   0.201   0.000   1.000 
J#t   : -3.731   0.956   3.951   2.096   2.337  -4.275  -0.036 
         0.931   0.419   0.848   0.208   0.601  -0.819  -0.007 
         2.688  -6.333  -4.816   0.647   2.838  13.447   0.153 
        -0.244   0.131   0.096   0.053  -0.395   0.765   0.004 
        -0.172  -1.789  -1.255   1.201   2.255   4.329   0.055 
x     :  0.002   0.001  -0.005  -0.001  -0.006 
J#x   : -1.198   2.601   2.399  -0.288  -1.209  -6.040  -0.069 
Ny    : -0.008   0.016   0.009  -0.010   0.004  -0.012   0.001 
dav   : -1.206   2.617   2.408  -0.299  -1.204  -6.052  -0.068 
dav^  : -1.206   2.617   2.408  -0.299  -1.204  -6.052  -0.068 
loop:  17
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  4900.237 847.748 705.105 / 1.28 0.005 -0.0>)
targe-coordst: (#<room73b2-bottle-object #X667e2e8 room73b2-bottle  4900.0 850.0 700.0 / 0.0 0.0 0.0>)
vel-pos :  2.115   0.873  -5.095 
vel-rot :  0.000  -0.005 
vel-pos-norm :   5.585/  1.000
vel-rot-norm :   0.005/  0.017
angle :  -55.4   -12.6    24.4   -26.6    39.6     5.6   -44.1 
usrwei:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
ocost :  0.565   0.207   0.625   2.733   0.511   0.170 1288.992 
cost  :  0.655   0.230   0.505   2.668   0.491   0.079 1288.992 
weight:  0.604   0.813   1.000   1.000   1.000   1.000   0.001 
k     :  0.000 (manipulability:  0.034, gain:  0.001, limit:  0.100, len:7)
nspace:  0.018  -0.027   0.030  -0.220  -0.094  -0.002   0.000 
J     : -0.158  -0.314   0.236  -0.136   0.000  -0.000  -0.000 
         0.547   0.253   0.407   0.234   0.125   0.129   0.000 
        -0.001  -0.329   0.312  -0.274  -0.017  -0.000  -0.180 
        -0.005   0.626   0.760   0.498  -0.714   0.696   0.000 
        -0.000   0.780  -0.611   0.767   0.097   0.000   1.000 
J#t   : -1.454  -3.687   0.073   3.585   2.940   3.680  -0.048 
         1.017  -0.492   0.288   0.612   1.318   1.052  -0.016 
        -2.426   5.221   5.651  -0.985  -2.678 -12.926   0.175 
        -0.187   0.247   0.207  -0.005  -0.662   0.311   0.001 
        -1.497   1.480   1.910   1.164  -0.136  -4.399   0.060 
x     :  0.002   0.001  -0.005   0.000  -0.005 
J#x   :  1.004  -2.411  -2.164   0.423   1.234   5.520  -0.075 
Ny    : -0.008   0.018   0.009  -0.012   0.004  -0.013   0.001 
dav   :  0.996  -2.394  -2.155   0.411   1.239   5.507  -0.074 
dav^  :  0.996  -2.394  -2.155   0.411   1.239   5.507  -0.074 
loop:  18
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  4900.218 847.789 705.124 / 1.375 0.005 0.001>)
targe-coordst: (#<room73b2-bottle-object #X667e2e8 room73b2-bottle  4900.0 850.0 700.0 / 0.0 0.0 0.0>)
vel-pos :  2.150   0.641  -5.114 
vel-rot : -0.001  -0.005 
vel-pos-norm :   5.585/  1.000
vel-rot-norm :   0.005/  0.017
angle :  -54.4   -15.0    22.3   -26.2    40.9    11.1   -44.2 
usrwei:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
ocost :  0.655   0.230   0.505   2.668   0.491   0.079 1288.992 
cost  :  0.581   0.209   0.611   2.758   0.512   0.161 1288.992 
weight:  1.000   1.000   0.621   0.266   0.662   0.861   0.001 
k     :  0.000 (manipulability:  0.033, gain:  0.001, limit:  0.100, len:7)
nspace:  0.025  -0.028   0.025  -0.060  -0.065  -0.007   0.000 
J     : -0.106  -0.294   0.267  -0.122  -0.000  -0.000  -0.000 
         0.560   0.277   0.404   0.230   0.123   0.129   0.000 
        -0.001  -0.338   0.303  -0.279  -0.035   0.000  -0.180 
        -0.005   0.684   0.703   0.560  -0.703   0.697  -0.000 
         0.001   0.729  -0.661   0.742   0.192   0.000   1.000 
J#t   : -3.644   0.797   3.774   2.096   2.399  -3.868  -0.039 
         0.916   0.404   0.853   0.226   0.630  -0.795  -0.008 
         2.375  -5.784  -4.314   0.642   2.683  12.211   0.162 
        -0.249   0.156   0.115   0.044  -0.412   0.711   0.004 
        -0.284  -1.598  -1.091   1.200   2.205   3.919   0.059 
x     :  0.002   0.001  -0.005  -0.001  -0.005 
J#x   : -1.028   2.221   2.042  -0.237  -1.030  -5.136  -0.068 
Ny    : -0.008   0.016   0.009  -0.010   0.004  -0.013   0.001 
dav   : -1.036   2.237   2.051  -0.248  -1.026  -5.149  -0.067 
dav^  : -1.036   2.237   2.051  -0.248  -1.026  -5.149  -0.067 
loop:  19
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  4900.164 847.923 705.034 / 1.287 0.004 -0.0>)
targe-coordst: (#<room73b2-bottle-object #X667e2e8 room73b2-bottle  4900.0 850.0 700.0 / 0.0 0.0 0.0>)
vel-pos :  1.969   0.739  -5.027 
vel-rot :  0.000  -0.004 
vel-pos-norm :   5.449/  1.000
vel-rot-norm :   0.004/  0.017
angle :  -55.4   -12.7    24.3   -26.5    39.8     5.9   -44.3 
usrwei:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
ocost :  0.581   0.209   0.611   2.758   0.512   0.161 1288.992 
cost  :  0.658   0.228   0.510   2.703   0.495   0.084 1288.992 
weight:  0.603   0.814   1.000   1.000   1.000   1.000   0.001 
k     :  0.000 (manipulability:  0.034, gain:  0.001, limit:  0.100, len:7)
nspace:  0.019  -0.027   0.030  -0.221  -0.095  -0.002   0.000 
J     : -0.154  -0.313   0.239  -0.135  -0.000  -0.000   0.000 
         0.549   0.256   0.407   0.234   0.125   0.129   0.000 
        -0.001  -0.329   0.312  -0.274  -0.019   0.000  -0.180 
        -0.004   0.632   0.755   0.504  -0.712   0.698  -0.000 
        -0.000   0.775  -0.616   0.764   0.103   0.000   1.000 
J#t   : -1.521  -3.497   0.269   3.537   2.849   3.222  -0.050 
         1.003  -0.406   0.347   0.570   1.268   0.881  -0.016 
        -2.201   4.588   5.050  -0.801  -2.344 -11.447   0.181 
        -0.192   0.247   0.210   0.004  -0.659   0.305   0.001 
        -1.422   1.264   1.711   1.229  -0.015  -3.907   0.062 
x     :  0.002   0.001  -0.005   0.000  -0.004 
J#x   :  0.830  -2.022  -1.801   0.371   1.048   4.598  -0.073 
Ny    : -0.008   0.018   0.010  -0.012   0.004  -0.014   0.001 
dav   :  0.822  -2.003  -1.791   0.359   1.053   4.584  -0.072 
dav^  :  0.822  -2.003  -1.791   0.359   1.053   4.584  -0.072 
loop:  20
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  4900.154 847.973 705.015 / 1.367 0.004 0.0>)
targe-coordst: (#<room73b2-bottle-object #X667e2e8 room73b2-bottle  4900.0 850.0 700.0 / 0.0 0.0 0.0>)
vel-pos :  1.972   0.559  -5.008 
vel-rot : -0.000  -0.004 
vel-pos-norm :   5.411/  1.000
vel-rot-norm :   0.004/  0.017
angle :  -54.6   -14.7    22.5   -26.1    40.9    10.5   -44.3 
usrwei:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
ocost :  0.658   0.228   0.510   2.703   0.495   0.084 1288.992 
cost  :  0.596   0.211   0.598   2.783   0.512   0.153 1288.992 
weight:  1.000   1.000   0.626   0.264   0.661   0.868   0.001 
k     :  0.000 (manipulability:  0.033, gain:  0.001, limit:  0.100, len:7)
nspace:  0.026  -0.029   0.024  -0.059  -0.065  -0.007   0.000 
J     : -0.111  -0.295   0.265  -0.123  -0.000  -0.000   0.000 
         0.559   0.276   0.404   0.231   0.124   0.129   0.000 
        -0.001  -0.336   0.305  -0.277  -0.033   0.000  -0.180 
        -0.004   0.681   0.707   0.556  -0.703   0.699   0.000 
         0.000   0.733  -0.658   0.743   0.182   0.000   1.000 
J#t   : -3.536   0.589   3.554   2.103   2.487  -3.352  -0.041 
         0.905   0.376   0.848   0.246   0.666  -0.743  -0.009 
         1.991  -5.074  -3.671   0.615   2.444  10.613   0.172 
        -0.254   0.182   0.134   0.034  -0.431   0.654   0.004 
        -0.418  -1.353  -0.880   1.193   2.127   3.390   0.062 
x     :  0.002   0.001  -0.005  -0.000  -0.004 
J#x   : -0.847   1.813   1.663  -0.182  -0.834  -4.177  -0.067 
Ny    : -0.008   0.016   0.009  -0.010   0.003  -0.014   0.001 
dav   : -0.855   1.830   1.672  -0.192  -0.831  -4.190  -0.067 
dav^  : -0.855   1.830   1.672  -0.192  -0.831  -4.190  -0.067 
loop:  21
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  4900.101 848.086 704.945 / 1.295 0.003 -7.161e-05>)
targe-coordst: (#<room73b2-bottle-object #X667e2e8 room73b2-bottle  4900.0 850.0 700.0 / 0.0 0.0 0.0>)
vel-pos :  1.830   0.618  -4.939 
vel-rot :  0.000  -0.003 
vel-pos-norm :   5.304/  1.000
vel-rot-norm :   0.003/  0.017
angle :  -55.5   -12.9    24.2   -26.3    40.1     6.3   -44.4 
usrwei:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
ocost :  0.596   0.211   0.598   2.783   0.512   0.153 1288.992 
cost  :  0.661   0.227   0.515   2.740   0.498   0.090 1288.992 
weight:  0.602   0.815   1.000   1.000   1.000   1.000   0.001 
k     :  0.000 (manipulability:  0.034, gain:  0.001, limit:  0.100, len:7)
nspace:  0.019  -0.026   0.031  -0.223  -0.095  -0.003   0.000 
J     : -0.150  -0.311   0.243  -0.134   0.000   0.000  -0.000 
         0.550   0.259   0.406   0.234   0.125   0.129  -0.000 
        -0.000  -0.328   0.312  -0.273  -0.020  -0.000  -0.180 
        -0.003   0.638   0.750   0.510  -0.710   0.700   0.000 
        -0.000   0.770  -0.622   0.761   0.110   0.000   1.000 
J#t   : -1.607  -3.259   0.509   3.482   2.729   2.652  -0.052 
         0.984  -0.307   0.416   0.525   1.209   0.684  -0.016 
        -1.910   3.797   4.312  -0.597  -1.920  -9.610   0.186 
        -0.197   0.246   0.210   0.014  -0.655   0.304   0.001 
        -1.326   0.997   1.468   1.299   0.135  -3.300   0.063 
x     :  0.002   0.001  -0.005   0.000  -0.003 
J#x   :  0.647  -1.607  -1.418   0.317   0.845   3.623  -0.070 
Ny    : -0.009   0.019   0.010  -0.013   0.004  -0.014   0.001 
dav   :  0.638  -1.588  -1.408   0.304   0.849   3.609  -0.070 
dav^  :  0.638  -1.588  -1.408   0.304   0.849   3.609  -0.070 
loop:  22
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  4900.096 848.142 704.895 / 1.358 0.003 0.0>)
targe-coordst: (#<room73b2-bottle-object #X667e2e8 room73b2-bottle  4900.0 850.0 700.0 / 0.0 0.0 0.0>)
vel-pos :  1.810   0.486  -4.890 
vel-rot : -0.000  -0.003 
vel-pos-norm :   5.237/  1.000
vel-rot-norm :   0.003/  0.017
angle :  -54.8   -14.5    22.8   -26.0    40.9     9.9   -44.5 
usrwei:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
ocost :  0.661   0.227   0.515   2.740   0.498   0.090 1288.992 
cost  :  0.612   0.213   0.584   2.808   0.512   0.144 1288.992 
weight:  1.000   1.000   0.631   0.263   0.661   0.874   0.001 
k     :  0.000 (manipulability:  0.033, gain:  0.001, limit:  0.100, len:7)
nspace:  0.027  -0.029   0.024  -0.059  -0.065  -0.006   0.000 
J     : -0.116  -0.297   0.263  -0.125  -0.000   0.000  -0.000 
         0.558   0.274   0.404   0.232   0.124   0.128   0.000 
        -0.001  -0.334   0.307  -0.276  -0.031   0.000  -0.180 
        -0.003   0.677   0.712   0.552  -0.703   0.701  -0.000 
         0.000   0.736  -0.655   0.744   0.172  -0.000   1.000 
J#t   : -3.408   0.331   3.288   2.118   2.604  -2.723  -0.044 
         0.901   0.333   0.829   0.269   0.712  -0.657  -0.010 
         1.537  -4.191  -2.876   0.562   2.106   8.625   0.180 
        -0.258   0.209   0.155   0.023  -0.451   0.595   0.003 
        -0.575  -1.051  -0.620   1.176   2.015   2.732   0.065 
x     :  0.002   0.000  -0.005  -0.000  -0.003 
J#x   : -0.660   1.386   1.269  -0.124  -0.622  -3.176  -0.066 
Ny    : -0.008   0.017   0.009  -0.010   0.003  -0.015   0.001 
dav   : -0.668   1.403   1.278  -0.134  -0.619  -3.191  -0.065 
dav^  : -0.668   1.403   1.278  -0.134  -0.619  -3.191  -0.065 
loop:  23
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  4900.049 848.234 704.83 / 1.303 0.002 -2.522e-05>)
targe-coordst: (#<room73b2-bottle-object #X667e2e8 room73b2-bottle  4900.0 850.0 700.0 / 0.0 0.0 0.0>)
vel-pos :  1.702   0.514  -4.826 
vel-rot :  0.000  -0.002 
vel-pos-norm :   5.143/  1.000
vel-rot-norm :   0.002/  0.017
angle :  -55.5   -13.1    24.1   -26.2    40.3     6.7   -44.5 
usrwei:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
ocost :  0.612   0.213   0.584   2.808   0.512   0.144 1288.992 
cost  :  0.663   0.225   0.521   2.778   0.502   0.096 1288.992 
weight:  0.601   0.816   1.000   1.000   1.000   1.000   0.001 
k     :  0.000 (manipulability:  0.033, gain:  0.001, limit:  0.100, len:7)
nspace:  0.019  -0.026   0.031  -0.225  -0.096  -0.003   0.000 
J     : -0.146  -0.309   0.246  -0.133   0.000   0.000   0.000 
         0.551   0.261   0.405   0.234   0.125   0.128   0.000 
        -0.000  -0.328   0.312  -0.273  -0.021  -0.000  -0.180 
        -0.002   0.645   0.744   0.517  -0.708   0.702   0.000 
        -0.000   0.764  -0.628   0.757   0.117   0.000   1.000 
J#t   : -1.715  -2.973   0.791   3.424   2.585   1.975  -0.053 
         0.962  -0.198   0.491   0.479   1.144   0.467  -0.016 
        -1.551   2.856   3.446  -0.383  -1.414  -7.439   0.191 
        -0.200   0.241   0.208   0.025  -0.648   0.311   0.002 
        -1.207   0.682   1.184   1.372   0.312  -2.587   0.065 
x     :  0.002   0.001  -0.005   0.000  -0.002 
J#x   :  0.460  -1.181  -1.028   0.260   0.632   2.629  -0.068 
Ny    : -0.009   0.020   0.011  -0.013   0.005  -0.015   0.001 
dav   :  0.451  -1.161  -1.017   0.247   0.637   2.614  -0.067 
dav^  :  0.451  -1.161  -1.017   0.247   0.637   2.614  -0.067 
loop:  24
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  4900.049 848.289 704.754 / 1.349 0.002 0.0>)
targe-coordst: (#<room73b2-bottle-object #X667e2e8 room73b2-bottle  4900.0 850.0 700.0 / 0.0 0.0 0.0>)
vel-pos :  1.669   0.424  -4.750 
vel-rot : -0.000  -0.002 
vel-pos-norm :   5.052/  1.000
vel-rot-norm :   0.002/  0.017
angle :  -55.0   -14.3    23.0   -25.9    40.9     9.3   -44.6 
usrwei:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
ocost :  0.663   0.225   0.521   2.778   0.502   0.096 1288.992 
cost  :  0.629   0.215   0.571   2.835   0.513   0.135 1288.992 
weight:  1.000   1.000   0.636   0.261   0.661   0.881   0.001 
k     :  0.000 (manipulability:  0.033, gain:  0.001, limit:  0.100, len:7)
nspace:  0.028  -0.030   0.023  -0.059  -0.065  -0.005   0.000 
J     : -0.121  -0.299   0.261  -0.126   0.000   0.000   0.000 
         0.557   0.273   0.403   0.233   0.125   0.128   0.000 
        -0.000  -0.332   0.308  -0.275  -0.029  -0.000  -0.180 
        -0.002   0.673   0.716   0.547  -0.702   0.702  -0.000 
         0.000   0.739  -0.652   0.745   0.162  -0.000   1.000 
J#t   : -3.268   0.036   2.990   2.141   2.749  -2.006  -0.045 
         0.902   0.276   0.797   0.294   0.765  -0.536  -0.011 
         1.040  -3.176  -1.966   0.482   1.675   6.331   0.187 
        -0.262   0.235   0.174   0.012  -0.471   0.540   0.003 
        -0.746  -0.706  -0.322   1.151   1.873   1.974   0.067 
x     :  0.002   0.000  -0.005  -0.000  -0.002 
J#x   : -0.476   0.961   0.879  -0.065  -0.406  -2.185  -0.064 
Ny    : -0.008   0.017   0.009  -0.010   0.002  -0.015   0.001 
dav   : -0.483   0.978   0.888  -0.076  -0.404  -2.200  -0.063 
dav^  : -0.483   0.978   0.888  -0.076  -0.404  -2.200  -0.063 
loop:  25
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  4900.013 848.361 704.682 / 1.311 0.002 8.094e-06>)
targe-coordst: (#<room73b2-bottle-object #X667e2e8 room73b2-bottle  4900.0 850.0 700.0 / 0.0 0.0 0.0>)
vel-pos :  1.590   0.433  -4.678 
vel-rot : -0.000  -0.002 
vel-pos-norm :   4.960/  1.000
vel-rot-norm :   0.002/  0.017
angle :  -55.5   -13.3    23.9   -26.0    40.5     7.1   -44.7 
usrwei:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
ocost :  0.629   0.215   0.571   2.835   0.513   0.135 1288.992 
cost  :  0.666   0.223   0.528   2.817   0.506   0.102 1288.992 
weight:  0.600   0.817   1.000   1.000   1.000   1.000   0.001 
k     :  0.000 (manipulability:  0.033, gain:  0.001, limit:  0.100, len:7)
nspace:  0.019  -0.026   0.032  -0.227  -0.097  -0.004   0.000 
J     : -0.141  -0.307   0.250  -0.132  -0.000  -0.000   0.000 
         0.553   0.264   0.404   0.235   0.126   0.128  -0.000 
        -0.000  -0.328   0.312  -0.272  -0.022   0.000  -0.180 
        -0.002   0.651   0.738   0.524  -0.706   0.703  -0.000 
         0.000   0.759  -0.634   0.754   0.124   0.000   1.000 
J#t   : -1.838  -2.661   1.092   3.368   2.428   1.245  -0.054 
         0.937  -0.088   0.566   0.435   1.079   0.250  -0.016 
        -1.148   1.838   2.521  -0.177  -0.872  -5.107   0.194 
        -0.202   0.232   0.202   0.036  -0.639   0.326   0.002 
        -1.075   0.343   0.882   1.442   0.500  -1.824   0.066 
x     :  0.002   0.000  -0.005  -0.000  -0.002 
J#x   :  0.282  -0.775  -0.660   0.206   0.427   1.689  -0.064 
Ny    : -0.010   0.020   0.011  -0.013   0.005  -0.015   0.001 
dav   :  0.273  -0.755  -0.649   0.193   0.432   1.674  -0.064 
dav^  :  0.273  -0.755  -0.649   0.193   0.432   1.674  -0.064 
loop:  26
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  4900.016 848.411 704.583 / 1.341 0.002 0.0>)
targe-coordst: (#<room73b2-bottle-object #X667e2e8 room73b2-bottle  4900.0 850.0 700.0 / 0.0 0.0 0.0>)
vel-pos :  1.552   0.378  -4.580 
vel-rot : -0.000  -0.002 
vel-pos-norm :   4.851/  1.000
vel-rot-norm :   0.002/  0.017
angle :  -55.2   -14.0    23.3   -25.8    41.0     8.8   -44.7 
usrwei:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
ocost :  0.666   0.223   0.528   2.817   0.506   0.102 1288.992 
cost  :  0.645   0.217   0.559   2.862   0.513   0.127 1288.992 
weight:  1.000   1.000   0.641   0.259   0.661   0.887   0.001 
k     :  0.000 (manipulability:  0.033, gain:  0.001, limit:  0.100, len:7)
nspace:  0.030  -0.030   0.022  -0.059  -0.065  -0.005   0.000 
J     : -0.125  -0.300   0.259  -0.128   0.000   0.000   0.000 
         0.557   0.272   0.403   0.234   0.125   0.128  -0.000 
        -0.000  -0.330   0.310  -0.274  -0.028  -0.000  -0.180 
        -0.002   0.670   0.720   0.544  -0.702   0.704  -0.000 
         0.000   0.742  -0.650   0.746   0.153   0.000   1.000 
J#t   : -3.134  -0.258   2.695   2.169   2.905  -1.289  -0.046 
         0.908   0.211   0.757   0.318   0.822  -0.397  -0.012 
         0.560  -2.152  -1.049   0.384   1.202   4.006   0.191 
        -0.263   0.256   0.189   0.002  -0.490   0.493   0.003 
        -0.912  -0.359  -0.023   1.119   1.719   1.206   0.068 
x     :  0.002   0.000  -0.005  -0.000  -0.002 
J#x   : -0.312   0.581   0.532  -0.014  -0.209  -1.300  -0.061 
Ny    : -0.007   0.017   0.009  -0.010   0.002  -0.016   0.001 
dav   : -0.319   0.597   0.541  -0.024  -0.207  -1.316  -0.061 
dav^  : -0.319   0.597   0.541  -0.024  -0.207  -1.316  -0.061 
loop:  27
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  4899.994 848.465 704.496 / 1.318 0.002 3.093e-05>)
targe-coordst: (#<room73b2-bottle-object #X667e2e8 room73b2-bottle  4900.0 850.0 700.0 / 0.0 0.0 0.0>)
vel-pos :  1.495   0.377  -4.494 
vel-rot : -0.000  -0.002 
vel-pos-norm :   4.751/  1.000
vel-rot-norm :   0.002/  0.017
angle :  -55.6   -13.4    23.8   -25.8    40.8     7.5   -44.8 
usrwei:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
ocost :  0.645   0.217   0.559   2.862   0.513   0.127 1288.992 
cost  :  0.670   0.222   0.533   2.856   0.510   0.107 1288.992 
weight:  0.599   0.818   1.000   1.000   1.000   1.000   0.001 
k     :  0.000 (manipulability:  0.033, gain:  0.001, limit:  0.100, len:7)
nspace:  0.019  -0.026   0.032  -0.228  -0.098  -0.004   0.000 
J     : -0.138  -0.305   0.253  -0.131   0.000   0.000  -0.000 
         0.554   0.267   0.403   0.235   0.126   0.128   0.000 
        -0.000  -0.327   0.312  -0.272  -0.023  -0.000  -0.180 
        -0.002   0.657   0.732   0.530  -0.703   0.705   0.000 
         0.000   0.753  -0.639   0.751   0.130   0.000   1.000 
J#t   : -1.955  -2.371   1.368   3.323   2.285   0.572  -0.055 
         0.915   0.008   0.630   0.398   1.023   0.064  -0.015 
        -0.765   0.899   1.679  -0.006  -0.380  -2.975   0.194 
        -0.203   0.221   0.195   0.046  -0.630   0.346   0.002 
        -0.950   0.032   0.608   1.501   0.669  -1.130   0.066 
x     :  0.001   0.000  -0.004  -0.000  -0.002 
J#x   :  0.136  -0.438  -0.357   0.159   0.256   0.918  -0.061 
Ny    : -0.010   0.021   0.011  -0.014   0.005  -0.016   0.001 
dav   :  0.126  -0.417  -0.346   0.145   0.261   0.903  -0.060 
dav^  :  0.126  -0.417  -0.346   0.145   0.261   0.903  -0.060 
loop:  28
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  4899.998 848.509 704.385 / 1.335 0.001 9.687e-05>)
targe-coordst: (#<room73b2-bottle-object #X667e2e8 room73b2-bottle  4900.0 850.0 700.0 / 0.0 0.0 0.0>)
vel-pos :  1.457   0.346  -4.382 
vel-rot : -0.000  -0.001 
vel-pos-norm :   4.631/  1.000
vel-rot-norm :   0.001/  0.017
angle :  -55.4   -13.9    23.5   -25.7    41.0     8.4   -44.9 
usrwei:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
ocost :  0.670   0.222   0.533   2.856   0.510   0.107 1288.992 
cost  :  0.660   0.218   0.550   2.891   0.514   0.121 1288.992 
weight:  1.000   1.000   0.645   0.257   0.661   0.892   0.001 
k     :  0.000 (manipulability:  0.032, gain:  0.001, limit:  0.100, len:7)
nspace:  0.031  -0.030   0.022  -0.059  -0.065  -0.004   0.000 
J     : -0.129  -0.301   0.258  -0.129  -0.000  -0.000   0.000 
         0.556   0.271   0.403   0.235   0.126   0.128  -0.000 
        -0.000  -0.328   0.311  -0.272  -0.026   0.000  -0.180 
        -0.001   0.668   0.722   0.541  -0.701   0.705  -0.000 
         0.000   0.744  -0.648   0.746   0.146   0.000   1.000 
J#t   : -3.031  -0.496   2.455   2.193   3.044  -0.699  -0.047 
         0.914   0.155   0.718   0.339   0.873  -0.271  -0.012 
         0.178  -1.308  -0.293   0.294   0.786   2.079   0.193 
        -0.263   0.270   0.199  -0.006  -0.503   0.461   0.002 
        -1.044  -0.072   0.225   1.089   1.584   0.570   0.069 
x     :  0.001   0.000  -0.004  -0.000  -0.001 
J#x   : -0.189   0.295   0.272   0.023  -0.059  -0.637  -0.058 
Ny    : -0.007   0.017   0.009  -0.010   0.001  -0.016   0.001 
dav   : -0.196   0.311   0.282   0.013  -0.058  -0.653  -0.058 
dav^  : -0.196   0.311   0.282   0.013  -0.058  -0.653  -0.058 
loop:  29
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  4899.987 848.551 704.284 / 1.324 0.001 4.525e-05>)
targe-coordst: (#<room73b2-bottle-object #X667e2e8 room73b2-bottle  4900.0 850.0 700.0 / 0.0 0.0 0.0>)
vel-pos :  1.414   0.342  -4.282 
vel-rot : -0.000  -0.001 
vel-pos-norm :   4.523/  1.000
vel-rot-norm :   0.001/  0.017
angle :  -55.6   -13.5    23.8   -25.7    41.0     7.7   -44.9 
usrwei:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
ocost :  0.660   0.218   0.550   2.891   0.514   0.121 1288.992 
cost  :  0.675   0.221   0.536   2.894   0.513   0.111 1288.992 
weight:  0.597   0.819   1.000   0.257   1.000   1.000   0.001 
k     :  0.000 (manipulability:  0.033, gain:  0.001, limit:  0.100, len:7)
nspace:  0.019  -0.025   0.033  -0.059  -0.098  -0.004   0.000 
J     : -0.135  -0.304   0.255  -0.130   0.000   0.000  -0.000 
         0.554   0.269   0.403   0.235   0.126   0.127   0.000 
        -0.000  -0.327   0.313  -0.271  -0.024   0.000  -0.180 
        -0.001   0.662   0.728   0.535  -0.702   0.706   0.000 
         0.000   0.749  -0.644   0.748   0.135  -0.000   1.000 
J#t   : -2.919  -0.870   2.009   2.131   3.504   0.611  -0.047 
         0.801   0.221   0.723   0.241   1.135  -0.004  -0.014 
        -0.507   0.256   1.085   0.073   0.013  -1.417   0.193 
        -0.216   0.233   0.195   0.035  -0.601   0.373   0.002 
        -1.266   0.408   0.617   0.998   1.408  -0.384   0.069 
x     :  0.001   0.000  -0.004  -0.000  -0.001 
J#x   :  0.005  -0.162  -0.139   0.079   0.192   0.427  -0.057 
Ny    : -0.006   0.016   0.009  -0.009  -0.000  -0.018   0.001 
dav   : -0.001  -0.146  -0.130   0.070   0.191   0.409  -0.056 
dav^  : -0.001  -0.146  -0.130   0.070   0.191   0.409  -0.056 
loop:  30
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  4899.988 848.585 704.17 / 1.331 0.001 7.252e-05>)
targe-coordst: (#<room73b2-bottle-object #X667e2e8 room73b2-bottle  4900.0 850.0 700.0 / 0.0 0.0 0.0>)
vel-pos :  1.383   0.324  -4.168 
vel-rot : -0.000  -0.001 
vel-pos-norm :   4.403/  1.000
vel-rot-norm :   0.001/  0.017
angle :  -55.6   -13.7    23.6   -25.6    41.1     8.1   -45.0 
usrwei:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
ocost :  0.675   0.221   0.536   2.894   0.513   0.111 1288.992 
cost  :  0.675   0.220   0.542   2.911   0.516   0.117 1288.992 
weight:  0.597   1.000   0.648   0.256   0.660   0.895   0.001 
k     :  0.000 (manipulability:  0.032, gain:  0.001, limit:  0.100, len:7)
nspace:  0.019  -0.031   0.022  -0.059  -0.065  -0.004   0.000 
J     : -0.131  -0.302   0.258  -0.129   0.000   0.000   0.000 
         0.555   0.271   0.402   0.236   0.126   0.127  -0.000 
        -0.000  -0.327   0.312  -0.271  -0.026  -0.000  -0.180 
        -0.001   0.668   0.723   0.541  -0.700   0.707   0.000 
         0.000   0.744  -0.649   0.745   0.142   0.000   1.000 
J#t   : -2.768  -0.941   2.141   2.400   2.950  -0.213  -0.045 
         0.864   0.201   0.737   0.300   0.957  -0.222  -0.013 
        -0.093  -0.720   0.209   0.192   0.553   0.851   0.193 
        -0.247   0.254   0.191   0.004  -0.525   0.454   0.002 
        -1.068   0.023   0.330   1.122   1.445   0.207   0.069 
x     :  0.001   0.000  -0.004  -0.000  -0.001 
J#x   : -0.097   0.098   0.107   0.063   0.010  -0.242  -0.055 
Ny    : -0.007   0.016   0.009  -0.009   0.001  -0.016   0.001 
dav   : -0.104   0.114   0.116   0.053   0.010  -0.258  -0.054 
dav^  : -0.104   0.114   0.116   0.053   0.010  -0.258  -0.054 
loop:  31
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  4899.985 848.624 703.964 / 1.327 0.002 5.184e-05>)
targe-coordst: (#<room73b2-bottle-object #X667e2e8 room73b2-bottle  4900.0 850.0 700.0 / 0.0 0.0 0.0>)
vel-pos :  1.347   0.318  -3.961 
vel-rot : -0.000  -0.002 
vel-pos-norm :   4.196/  1.000
vel-rot-norm :   0.002/  0.017
angle :  -55.7   -13.6    23.7   -25.5    41.2     7.9   -45.0 
usrwei:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
ocost :  0.675   0.220   0.542   2.911   0.516   0.117 1288.992 
cost  :  0.683   0.221   0.537   2.924   0.516   0.113 1288.992 
weight:  0.594   0.819   1.000   0.255   0.659   1.000   0.001 
k     :  0.000 (manipulability:  0.032, gain:  0.001, limit:  0.100, len:7)
nspace:  0.019  -0.025   0.033  -0.059  -0.065  -0.004   0.000 
J     : -0.133  -0.302   0.257  -0.130   0.000   0.000  -0.000 
         0.555   0.270   0.402   0.236   0.126   0.127  -0.000 
        -0.000  -0.326   0.313  -0.271  -0.025  -0.000  -0.180 
        -0.002   0.666   0.725   0.538  -0.700   0.707   0.000 
         0.000   0.746  -0.647   0.746   0.137  -0.000   1.000 
J#t   : -2.820  -0.887   2.137   2.338   3.057  -0.108  -0.045 
         0.844   0.211   0.749   0.302   0.982  -0.219  -0.013 
        -0.359  -0.109   0.751   0.114   0.239  -0.534   0.192 
        -0.243   0.252   0.188   0.000  -0.527   0.461   0.002 
        -1.161   0.235   0.515   1.099   1.333  -0.273   0.069 
x     :  0.001   0.000  -0.004  -0.000  -0.002 
J#x   :  0.004  -0.066  -0.048   0.042   0.058   0.137  -0.055 
Ny    : -0.006   0.016   0.009  -0.009  -0.000  -0.018   0.001 
dav   : -0.002  -0.050  -0.039   0.033   0.058   0.119  -0.054 
dav^  : -0.002  -0.050  -0.039   0.033   0.058   0.119  -0.054 
loop:  32
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  4899.988 848.643 703.854 / 1.329 0.002 6.029e-05>)
targe-coordst: (#<room73b2-bottle-object #X667e2e8 room73b2-bottle  4900.0 850.0 700.0 / 0.0 0.0 0.0>)
vel-pos :  1.329   0.313  -3.851 
vel-rot : -0.000  -0.002 
vel-pos-norm :   4.086/  1.000
vel-rot-norm :   0.002/  0.017
angle :  -55.7   -13.6    23.7   -25.5    41.2     8.0   -45.0 
usrwei:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
ocost :  0.683   0.221   0.537   2.924   0.516   0.113 1288.992 
cost  :  0.683   0.220   0.539   2.932   0.517   0.115 1288.992 
weight:  0.594   1.000   0.650   0.254   0.659   0.897   0.001 
k     :  0.000 (manipulability:  0.032, gain:  0.001, limit:  0.100, len:7)
nspace:  0.019  -0.031   0.021  -0.059  -0.065  -0.004   0.000 
J     : -0.132  -0.302   0.258  -0.129   0.000   0.000  -0.000 
         0.555   0.271   0.402   0.236   0.126   0.127  -0.000 
        -0.000  -0.326   0.313  -0.271  -0.025  -0.000  -0.180 
        -0.002   0.668   0.723   0.540  -0.700   0.707   0.000 
         0.000   0.744  -0.649   0.745   0.139   0.000   1.000 
J#t   : -2.741  -1.013   2.064   2.406   3.007  -0.016  -0.045 
         0.865   0.184   0.723   0.306   0.975  -0.176  -0.013 
        -0.207  -0.454   0.456   0.174   0.392   0.202   0.192 
        -0.246   0.258   0.193   0.002  -0.529   0.446   0.002 
        -1.108   0.114   0.410   1.116   1.394  -0.006   0.069 
x     :  0.001   0.000  -0.004  -0.000  -0.002 
J#x   : -0.005   0.011   0.016   0.008  -0.016  -0.050  -0.055 
Ny    : -0.007   0.016   0.009  -0.009   0.001  -0.016   0.001 
dav   : -0.012   0.027   0.025  -0.002  -0.016  -0.066  -0.054 
dav^  : -0.012   0.027   0.025  -0.002  -0.016  -0.066  -0.054 
loop:  33
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  4899.987 848.647 703.855 / 1.328 0.002 5.433e-05>)
targe-coordst: (#<room73b2-bottle-object #X667e2e8 room73b2-bottle  4900.0 850.0 700.0 / 0.0 0.0 0.0>)
vel-pos :  1.325   0.313  -3.852 
vel-rot : -0.000  -0.002 
vel-pos-norm :   4.085/  1.000
vel-rot-norm :   0.002/  0.017
angle :  -55.8   -13.6    23.7   -25.5    41.2     7.9   -45.0 
usrwei:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
ocost :  0.683   0.220   0.539   2.932   0.517   0.115 1288.992 
cost  :  0.684   0.221   0.537   2.932   0.517   0.114 1288.992 
weight:  0.594   0.819   1.000   1.000   1.000   1.000   0.001 
k     :  0.000 (manipulability:  0.032, gain:  0.001, limit:  0.100, len:7)
nspace:  0.019  -0.025   0.033  -0.232  -0.099  -0.004   0.000 
J     : -0.132  -0.302   0.257  -0.130   0.000   0.000   0.000 
         0.555   0.271   0.402   0.236   0.126   0.127   0.000 
        -0.000  -0.326   0.313  -0.271  -0.025  -0.000  -0.180 
        -0.002   0.667   0.724   0.539  -0.700   0.707   0.000 
         0.000   0.745  -0.648   0.745   0.138  -0.000   1.000 
J#t   : -2.110  -1.999   1.722   3.287   2.093  -0.312  -0.054 
         0.889   0.127   0.704   0.355   0.953  -0.162  -0.015 
        -0.270  -0.303   0.605   0.175   0.282  -0.204   0.192 
        -0.201   0.204   0.181   0.060  -0.615   0.380   0.002 
        -0.790  -0.366   0.259   1.567   0.897  -0.234   0.065 
x     :  0.001   0.000  -0.004  -0.000  -0.002 
J#x   :  0.017  -0.036  -0.024   0.017   0.001   0.047  -0.055 
Ny    : -0.010   0.021   0.011  -0.014   0.005  -0.015   0.001 
dav   :  0.007  -0.015  -0.013   0.003   0.006   0.032  -0.054 
dav^  :  0.007  -0.015  -0.013   0.003   0.006   0.032  -0.054 
loop:  34
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  4899.988 848.647 703.855 / 1.329 0.002 5.717e-05>)
targe-coordst: (#<room73b2-bottle-object #X667e2e8 room73b2-bottle  4900.0 850.0 700.0 / 0.0 0.0 0.0>)
vel-pos :  1.325   0.312  -3.852 
vel-rot : -0.000  -0.002 
vel-pos-norm :   4.085/  1.000
vel-rot-norm :   0.002/  0.017
angle :  -55.7   -13.6    23.7   -25.5    41.2     8.0   -45.0 
usrwei:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
ocost :  0.684   0.221   0.537   2.932   0.517   0.114 1288.992 
cost  :  0.684   0.220   0.538   2.932   0.517   0.115 1288.992 
weight:  1.000   1.000   0.650   0.254   0.659   0.897   0.001 
k     :  0.000 (manipulability:  0.032, gain:  0.001, limit:  0.100, len:7)
nspace:  0.033  -0.031   0.021  -0.059  -0.065  -0.004   0.000 
J     : -0.132  -0.302   0.257  -0.129  -0.000  -0.000   0.000 
         0.555   0.271   0.402   0.236   0.126   0.127   0.000 
        -0.000  -0.326   0.313  -0.271  -0.025   0.000  -0.180 
        -0.002   0.667   0.723   0.540  -0.700   0.707   0.000 
         0.000   0.745  -0.649   0.745   0.139   0.000   1.000 
J#t   : -2.920  -0.754   2.197   2.233   3.193  -0.080  -0.046 
         0.925   0.090   0.671   0.363   0.925  -0.127  -0.012 
        -0.251  -0.362   0.531   0.153   0.366   0.028   0.192 
        -0.263   0.284   0.207  -0.014  -0.515   0.434   0.002 
        -1.194   0.250   0.493   1.043   1.452  -0.107   0.068 
x     :  0.001   0.000  -0.004  -0.000  -0.002 
J#x   :  0.004  -0.009  -0.002   0.009  -0.006  -0.002  -0.055 
Ny    : -0.007   0.016   0.009  -0.010   0.001  -0.016   0.001 
dav   : -0.003   0.008   0.007  -0.001  -0.005  -0.019  -0.054 
dav^  : -0.003   0.008   0.007  -0.001  -0.005  -0.019  -0.054 
loop:  35
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  4899.987 848.647 703.855 / 1.328 0.002 5.566e-05>)
targe-coordst: (#<room73b2-bottle-object #X667e2e8 room73b2-bottle  4900.0 850.0 700.0 / 0.0 0.0 0.0>)
vel-pos :  1.325   0.313  -3.852 
vel-rot : -0.000  -0.002 
vel-pos-norm :   4.085/  1.000
vel-rot-norm :   0.002/  0.017
angle :  -55.7   -13.6    23.7   -25.5    41.2     8.0   -45.0 
usrwei:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
ocost :  0.684   0.220   0.538   2.932   0.517   0.115 1288.992 
cost  :  0.684   0.221   0.538   2.932   0.517   0.114 1288.992 
weight:  0.594   0.819   1.000   1.000   1.000   1.000   0.001 
k     :  0.000 (manipulability:  0.032, gain:  0.001, limit:  0.100, len:7)
nspace:  0.019  -0.025   0.033  -0.232  -0.099  -0.004   0.000 
J     : -0.132  -0.302   0.257  -0.129   0.000   0.000   0.000 
         0.555   0.271   0.402   0.236   0.126   0.127  -0.000 
        -0.000  -0.326   0.313  -0.271  -0.025   0.000  -0.180 
        -0.002   0.667   0.723   0.539  -0.700   0.707   0.000 
         0.000   0.745  -0.648   0.745   0.138  -0.000   1.000 
J#t   : -2.115  -1.987   1.733   3.285   2.088  -0.337  -0.054 
         0.888   0.130   0.706   0.353   0.952  -0.168  -0.015 
        -0.254  -0.339   0.573   0.180   0.299  -0.125   0.192 
        -0.201   0.203   0.181   0.061  -0.615   0.381   0.002 
        -0.785  -0.377   0.249   1.568   0.903  -0.209   0.065 
x     :  0.001   0.000  -0.004  -0.000  -0.002 
J#x   :  0.012  -0.026  -0.015   0.015  -0.004   0.024  -0.055 
Ny    : -0.010   0.021   0.011  -0.014   0.005  -0.015   0.001 
dav   :  0.002  -0.005  -0.004   0.001   0.002   0.009  -0.054 
dav^  :  0.002  -0.005  -0.004   0.001   0.002   0.009  -0.054 
loop:  36
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  4899.988 848.647 703.855 / 1.328 0.002 5.648e-05>)
targe-coordst: (#<room73b2-bottle-object #X667e2e8 room73b2-bottle  4900.0 850.0 700.0 / 0.0 0.0 0.0>)
vel-pos :  1.325   0.312  -3.852 
vel-rot : -0.000  -0.002 
vel-pos-norm :   4.085/  1.000
vel-rot-norm :   0.002/  0.017
angle :  -55.7   -13.6    23.7   -25.5    41.2     8.0   -45.0 
usrwei:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
ocost :  0.684   0.221   0.538   2.932   0.517   0.114 1288.992 
cost  :  0.684   0.221   0.538   2.932   0.517   0.115 1288.992 
weight:  1.000   1.000   0.650   0.254   0.659   0.897   0.001 
k     :  0.000 (manipulability:  0.032, gain:  0.001, limit:  0.100, len:7)
nspace:  0.033  -0.031   0.021  -0.059  -0.065  -0.004   0.000 
J     : -0.132  -0.302   0.257  -0.129  -0.000  -0.000  -0.000 
         0.555   0.271   0.402   0.236   0.126   0.127   0.000 
        -0.000  -0.326   0.313  -0.271  -0.025   0.000  -0.180 
        -0.002   0.667   0.723   0.540  -0.700   0.707   0.000 
         0.000   0.745  -0.649   0.745   0.139   0.000   1.000 
J#t   : -2.918  -0.760   2.191   2.234   3.197  -0.066  -0.046 
         0.926   0.089   0.670   0.363   0.926  -0.124  -0.012 
        -0.259  -0.343   0.548   0.151   0.354  -0.017   0.192 
        -0.263   0.284   0.208  -0.015  -0.515   0.433   0.002 
        -1.197   0.257   0.498   1.042   1.448  -0.122   0.068 
x     :  0.001   0.000  -0.004  -0.000  -0.002 
J#x   :  0.006  -0.014  -0.007   0.010  -0.002   0.011  -0.055 
Ny    : -0.007   0.016   0.009  -0.010   0.001  -0.016   0.001 
dav   : -0.001   0.002   0.002  -0.000  -0.001  -0.005  -0.054 
dav^  : -0.001   0.002   0.002  -0.000  -0.001  -0.005  -0.054 
loop:  37
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  4899.988 848.647 703.855 / 1.328 0.002 5.604e-05>)
targe-coordst: (#<room73b2-bottle-object #X667e2e8 room73b2-bottle  4900.0 850.0 700.0 / 0.0 0.0 0.0>)
vel-pos :  1.325   0.312  -3.852 
vel-rot : -0.000  -0.002 
vel-pos-norm :   4.085/  1.000
vel-rot-norm :   0.002/  0.017
angle :  -55.7   -13.6    23.7   -25.5    41.2     8.0   -45.0 
usrwei:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
ocost :  0.684   0.221   0.538   2.932   0.517   0.115 1288.992 
cost  :  0.684   0.221   0.538   2.932   0.517   0.114 1288.992 
weight:  0.594   0.819   1.000   1.000   1.000   1.000   0.001 
k     :  0.000 (manipulability:  0.032, gain:  0.001, limit:  0.100, len:7)
nspace:  0.019  -0.025   0.033  -0.232  -0.099  -0.004   0.000 
J     : -0.132  -0.302   0.257  -0.129   0.000   0.000   0.000 
         0.555   0.271   0.402   0.236   0.126   0.127  -0.000 
        -0.000  -0.326   0.313  -0.271  -0.025  -0.000  -0.180 
        -0.002   0.667   0.723   0.539  -0.700   0.707   0.000 
         0.000   0.745  -0.648   0.745   0.139   0.000   1.000 
J#t   : -2.117  -1.984   1.736   3.284   2.087  -0.344  -0.054 
         0.888   0.131   0.707   0.353   0.951  -0.169  -0.015 
        -0.249  -0.351   0.564   0.183   0.303  -0.102   0.191 
        -0.201   0.203   0.181   0.061  -0.615   0.381   0.002 
        -0.784  -0.381   0.246   1.569   0.905  -0.201   0.065 
x     :  0.001   0.000  -0.004  -0.000  -0.002 
J#x   :  0.011  -0.023  -0.012   0.014  -0.005   0.018  -0.055 
Ny    : -0.010   0.021   0.011  -0.014   0.005  -0.015   0.001 
dav   :  0.001  -0.001  -0.001   0.000   0.000   0.003  -0.054 
dav^  :  0.001  -0.001  -0.001   0.000   0.000   0.003  -0.054 
loop:  38
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  4899.988 848.647 703.855 / 1.328 0.002 5.627e-05>)
targe-coordst: (#<room73b2-bottle-object #X667e2e8 room73b2-bottle  4900.0 850.0 700.0 / 0.0 0.0 0.0>)
vel-pos :  1.325   0.312  -3.852 
vel-rot : -0.000  -0.002 
vel-pos-norm :   4.085/  1.000
vel-rot-norm :   0.002/  0.017
angle :  -55.7   -13.6    23.7   -25.5    41.2     8.0   -45.0 
usrwei:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
ocost :  0.684   0.221   0.538   2.932   0.517   0.114 1288.992 
cost  :  0.684   0.221   0.538   2.933   0.517   0.114 1288.992 
weight:  1.000   1.000   0.650   0.254   0.659   0.897   0.001 
k     :  0.000 (manipulability:  0.032, gain:  0.001, limit:  0.100, len:7)
nspace:  0.033  -0.031   0.021  -0.059  -0.065  -0.004   0.000 
J     : -0.132  -0.302   0.257  -0.129  -0.000  -0.000   0.000 
         0.555   0.271   0.402   0.236   0.126   0.127   0.000 
        -0.000  -0.326   0.313  -0.271  -0.025  -0.000  -0.180 
        -0.002   0.667   0.723   0.540  -0.700   0.707  -0.000 
         0.000   0.745  -0.648   0.745   0.139   0.000   1.000 
J#t   : -2.917  -0.762   2.189   2.234   3.198  -0.062  -0.046 
         0.926   0.088   0.669   0.364   0.927  -0.123  -0.013 
        -0.261  -0.338   0.553   0.150   0.351  -0.031   0.192 
        -0.263   0.284   0.208  -0.015  -0.515   0.433   0.002 
        -1.197   0.259   0.500   1.042   1.447  -0.126   0.068 
x     :  0.001   0.000  -0.004  -0.000  -0.002 
J#x   :  0.007  -0.016  -0.008   0.010  -0.001   0.015  -0.055 
Ny    : -0.007   0.016   0.009  -0.010   0.001  -0.016   0.001 
dav   : -0.000   0.001   0.001  -0.000  -0.000  -0.002  -0.054 
dav^  : -0.000   0.001   0.001  -0.000  -0.000  -0.002  -0.054 
loop:  39
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  4899.988 848.647 703.855 / 1.328 0.002 5.615e-05>)
targe-coordst: (#<room73b2-bottle-object #X667e2e8 room73b2-bottle  4900.0 850.0 700.0 / 0.0 0.0 0.0>)
vel-pos :  1.325   0.312  -3.852 
vel-rot : -0.000  -0.002 
vel-pos-norm :   4.085/  1.000
vel-rot-norm :   0.002/  0.017
angle :  -55.7   -13.6    23.7   -25.5    41.2     8.0   -45.0 
usrwei:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
ocost :  0.684   0.221   0.538   2.933   0.517   0.114 1288.992 
cost  :  0.684   0.221   0.538   2.933   0.517   0.114 1288.992 
weight:  0.594   0.819   1.000   1.000   1.000   1.000   0.001 
k     :  0.000 (manipulability:  0.032, gain:  0.001, limit:  0.100, len:7)
nspace:  0.019  -0.025   0.033  -0.232  -0.099  -0.004   0.000 
J     : -0.132  -0.302   0.257  -0.129  -0.000  -0.000  -0.000 
         0.555   0.271   0.402   0.236   0.126   0.127   0.000 
        -0.000  -0.326   0.313  -0.271  -0.025   0.000  -0.180 
        -0.002   0.667   0.723   0.539  -0.700   0.707  -0.000 
         0.000   0.745  -0.648   0.745   0.139   0.000   1.000 
J#t   : -2.117  -1.983   1.737   3.284   2.086  -0.346  -0.054 
         0.888   0.131   0.707   0.353   0.951  -0.170  -0.014 
        -0.247  -0.354   0.561   0.184   0.304  -0.096   0.191 
        -0.201   0.203   0.181   0.061  -0.615   0.381   0.002 
        -0.783  -0.382   0.245   1.569   0.905  -0.199   0.065 
x     :  0.001   0.000  -0.004  -0.000  -0.002 
J#x   :  0.010  -0.022  -0.011   0.014  -0.005   0.016  -0.055 
Ny    : -0.010   0.021   0.011  -0.014   0.005  -0.015   0.001 
dav   :  0.000  -0.000  -0.000   0.000   0.000   0.001  -0.054 
dav^  :  0.000  -0.000  -0.000   0.000   0.000   0.001  -0.054 
loop:  40
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  4899.988 848.647 703.855 / 1.328 0.002 5.622e-05>)
targe-coordst: (#<room73b2-bottle-object #X667e2e8 room73b2-bottle  4900.0 850.0 700.0 / 0.0 0.0 0.0>)
vel-pos :  1.325   0.312  -3.852 
vel-rot : -0.000  -0.002 
vel-pos-norm :   4.085/  1.000
vel-rot-norm :   0.002/  0.017
angle :  -55.7   -13.6    23.7   -25.5    41.2     8.0   -45.0 
usrwei:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
ocost :  0.684   0.221   0.538   2.933   0.517   0.114 1288.992 
cost  :  0.684   0.221   0.538   2.933   0.517   0.114 1288.992 
weight:  1.000   1.000   0.650   0.254   0.659   0.897   0.001 
k     :  0.000 (manipulability:  0.032, gain:  0.001, limit:  0.100, len:7)
nspace:  0.033  -0.031   0.021  -0.059  -0.065  -0.004   0.000 
J     : -0.132  -0.302   0.257  -0.129  -0.000  -0.000   0.000 
         0.555   0.271   0.402   0.236   0.126   0.127  -0.000 
        -0.000  -0.326   0.313  -0.271  -0.025   0.000  -0.180 
        -0.002   0.667   0.723   0.540  -0.700   0.707  -0.000 
         0.000   0.745  -0.648   0.745   0.139   0.000   1.000 
J#t   : -2.917  -0.762   2.189   2.234   3.198  -0.060  -0.046 
         0.926   0.088   0.669   0.364   0.927  -0.123  -0.013 
        -0.262  -0.336   0.555   0.150   0.350  -0.035   0.192 
        -0.263   0.284   0.208  -0.015  -0.515   0.433   0.002 
        -1.198   0.259   0.500   1.042   1.446  -0.127   0.068 
x     :  0.001   0.000  -0.004  -0.000  -0.002 
J#x   :  0.007  -0.016  -0.009   0.010  -0.001   0.016  -0.055 
Ny    : -0.007   0.016   0.009  -0.010   0.001  -0.016   0.001 
dav   : -0.000   0.000   0.000   0.000  -0.000  -0.000  -0.054 
dav^  : -0.000   0.000   0.000   0.000  -0.000  -0.000  -0.054 
loop:  41
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  4899.988 848.647 703.855 / 1.328 0.002 5.618e-05>)
targe-coordst: (#<room73b2-bottle-object #X667e2e8 room73b2-bottle  4900.0 850.0 700.0 / 0.0 0.0 0.0>)
vel-pos :  1.325   0.312  -3.852 
vel-rot : -0.000  -0.002 
vel-pos-norm :   4.085/  1.000
vel-rot-norm :   0.002/  0.017
angle :  -55.7   -13.6    23.7   -25.5    41.2     8.0   -45.0 
usrwei:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
ocost :  0.684   0.221   0.538   2.933   0.517   0.114 1288.992 
cost  :  0.684   0.221   0.538   2.933   0.517   0.114 1288.992 
weight:  0.594   0.819   1.000   0.254   1.000   1.000   0.001 
k     :  0.000 (manipulability:  0.032, gain:  0.001, limit:  0.100, len:7)
nspace:  0.019  -0.025   0.033  -0.059  -0.099  -0.004   0.000 
J     : -0.132  -0.302   0.257  -0.129  -0.000  -0.000  -0.000 
         0.555   0.271   0.402   0.236   0.126   0.127   0.000 
        -0.000  -0.326   0.313  -0.271  -0.025   0.000  -0.180 
        -0.002   0.667   0.723   0.539  -0.700   0.707   0.000 
         0.000   0.745  -0.648   0.745   0.139   0.000   1.000 
J#t   : -2.993  -0.692   2.174   2.111   3.416   0.198  -0.047 
         0.794   0.270   0.754   0.227   1.094  -0.112  -0.014 
        -0.296  -0.283   0.585   0.118   0.379  -0.063   0.192 
        -0.218   0.227   0.189   0.039  -0.590   0.391   0.003 
        -1.201   0.234   0.454   1.009   1.541   0.062   0.068 
x     :  0.001   0.000  -0.004  -0.000  -0.002 
J#x   :  0.007  -0.016  -0.009   0.009   0.000   0.018  -0.055 
Ny    : -0.006   0.016   0.009  -0.009  -0.000  -0.018   0.001 
dav   :  0.000  -0.000  -0.000   0.000   0.000   0.000  -0.054 
dav^  :  0.000  -0.000  -0.000   0.000   0.000   0.000  -0.054 
loop:  42
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  4899.988 848.647 703.855 / 1.328 0.002 5.620e-05>)
targe-coordst: (#<room73b2-bottle-object #X667e2e8 room73b2-bottle  4900.0 850.0 700.0 / 0.0 0.0 0.0>)
vel-pos :  1.325   0.312  -3.852 
vel-rot : -0.000  -0.002 
vel-pos-norm :   4.085/  1.000
vel-rot-norm :   0.002/  0.017
angle :  -55.7   -13.6    23.7   -25.5    41.2     8.0   -45.0 
usrwei:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
ocost :  0.684   0.221   0.538   2.933   0.517   0.114 1288.992 
cost  :  0.684   0.221   0.538   2.933   0.517   0.114 1288.992 
weight:  1.000   1.000   0.650   0.254   0.659   0.897   0.001 
k     :  0.000 (manipulability:  0.032, gain:  0.001, limit:  0.100, len:7)
nspace:  0.033  -0.031   0.021  -0.059  -0.065  -0.004   0.000 
J     : -0.132  -0.302   0.257  -0.129   0.000  -0.000  -0.000 
         0.555   0.271   0.402   0.236   0.126   0.127   0.000 
        -0.000  -0.326   0.313  -0.271  -0.025   0.000  -0.180 
        -0.002   0.667   0.723   0.539  -0.700   0.707   0.000 
         0.000   0.745  -0.648   0.745   0.139  -0.000   1.000 
J#t   : -2.917  -0.762   2.189   2.234   3.198  -0.060  -0.046 
         0.926   0.088   0.669   0.364   0.927  -0.122  -0.013 
        -0.262  -0.336   0.555   0.150   0.350  -0.036   0.192 
        -0.263   0.284   0.208  -0.015  -0.515   0.433   0.002 
        -1.198   0.259   0.501   1.042   1.446  -0.128   0.068 
x     :  0.001   0.000  -0.004  -0.000  -0.002 
J#x   :  0.007  -0.016  -0.009   0.010  -0.001   0.016  -0.055 
Ny    : -0.007   0.016   0.009  -0.010   0.001  -0.016   0.001 
dav   : -0.000   0.000   0.000   0.000  -0.000  -0.000  -0.054 
dav^  : -0.000   0.000   0.000   0.000  -0.000  -0.000  -0.054 
loop:  43
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  4899.988 848.647 703.855 / 1.328 0.002 5.619e-05>)
targe-coordst: (#<room73b2-bottle-object #X667e2e8 room73b2-bottle  4900.0 850.0 700.0 / 0.0 0.0 0.0>)
vel-pos :  1.325   0.312  -3.852 
vel-rot : -0.000  -0.002 
vel-pos-norm :   4.085/  1.000
vel-rot-norm :   0.002/  0.017
angle :  -55.7   -13.6    23.7   -25.5    41.2     8.0   -45.0 
usrwei:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
ocost :  0.684   0.221   0.538   2.933   0.517   0.114 1288.992 
cost  :  0.684   0.221   0.538   2.933   0.517   0.114 1288.992 
weight:  0.594   0.819   1.000   0.254   1.000   1.000   0.001 
k     :  0.000 (manipulability:  0.032, gain:  0.001, limit:  0.100, len:7)
nspace:  0.019  -0.025   0.033  -0.059  -0.099  -0.004   0.000 
J     : -0.132  -0.302   0.257  -0.129  -0.000  -0.000  -0.000 
         0.555   0.271   0.402   0.236   0.126   0.127  -0.000 
        -0.000  -0.326   0.313  -0.271  -0.025   0.000  -0.180 
        -0.002   0.667   0.723   0.539  -0.700   0.707   0.000 
         0.000   0.745  -0.648   0.745   0.139   0.000   1.000 
J#t   : -2.993  -0.692   2.174   2.111   3.416   0.197  -0.047 
         0.794   0.270   0.754   0.227   1.094  -0.112  -0.014 
        -0.296  -0.283   0.585   0.118   0.379  -0.063   0.192 
        -0.218   0.227   0.189   0.039  -0.590   0.391   0.003 
        -1.201   0.234   0.454   1.009   1.541   0.062   0.068 
x     :  0.001   0.000  -0.004  -0.000  -0.002 
J#x   :  0.007  -0.016  -0.009   0.009   0.000   0.018  -0.055 
Ny    : -0.006   0.016   0.009  -0.009  -0.000  -0.018   0.001 
dav   :  0.000  -0.000  -0.000   0.000   0.000   0.000  -0.054 
dav^  :  0.000  -0.000  -0.000   0.000   0.000   0.000  -0.054 
loop:  44
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  4899.988 848.647 703.855 / 1.328 0.002 5.619e-05>)
targe-coordst: (#<room73b2-bottle-object #X667e2e8 room73b2-bottle  4900.0 850.0 700.0 / 0.0 0.0 0.0>)
vel-pos :  1.325   0.312  -3.852 
vel-rot : -0.000  -0.002 
vel-pos-norm :   4.085/  1.000
vel-rot-norm :   0.002/  0.017
angle :  -55.7   -13.6    23.7   -25.5    41.2     8.0   -45.0 
usrwei:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
ocost :  0.684   0.221   0.538   2.933   0.517   0.114 1288.992 
cost  :  0.684   0.221   0.538   2.933   0.517   0.114 1288.992 
weight:  1.000   1.000   0.650   0.254   0.659   0.897   0.001 
k     :  0.000 (manipulability:  0.032, gain:  0.001, limit:  0.100, len:7)
nspace:  0.033  -0.031   0.021  -0.059  -0.065  -0.004   0.000 
J     : -0.132  -0.302   0.257  -0.129   0.000   0.000  -0.000 
         0.555   0.271   0.402   0.236   0.126   0.127  -0.000 
        -0.000  -0.326   0.313  -0.271  -0.025  -0.000  -0.180 
        -0.002   0.667   0.723   0.539  -0.700   0.707   0.000 
         0.000   0.745  -0.648   0.745   0.139  -0.000   1.000 
J#t   : -2.917  -0.762   2.189   2.234   3.198  -0.060  -0.046 
         0.926   0.088   0.669   0.364   0.927  -0.122  -0.013 
        -0.262  -0.336   0.555   0.150   0.349  -0.036   0.192 
        -0.263   0.284   0.208  -0.015  -0.515   0.433   0.002 
        -1.198   0.259   0.501   1.042   1.446  -0.128   0.068 
x     :  0.001   0.000  -0.004  -0.000  -0.002 
J#x   :  0.007  -0.016  -0.009   0.010  -0.001   0.016  -0.055 
Ny    : -0.007   0.016   0.009  -0.010   0.001  -0.016   0.001 
dav   :  0.000   0.000   0.000   0.000  -0.000  -0.000  -0.054 
dav^  :  0.000   0.000   0.000   0.000  -0.000  -0.000  -0.054 
loop:  45
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  4899.988 848.647 703.855 / 1.328 0.002 5.619e-05>)
targe-coordst: (#<room73b2-bottle-object #X667e2e8 room73b2-bottle  4900.0 850.0 700.0 / 0.0 0.0 0.0>)
vel-pos :  1.325   0.312  -3.852 
vel-rot : -0.000  -0.002 
vel-pos-norm :   4.085/  1.000
vel-rot-norm :   0.002/  0.017
angle :  -55.7   -13.6    23.7   -25.5    41.2     8.0   -45.0 
usrwei:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
ocost :  0.684   0.221   0.538   2.933   0.517   0.114 1288.992 
cost  :  0.684   0.221   0.538   2.933   0.517   0.114 1288.992 
weight:  1.000   0.819   1.000   0.254   1.000   1.000   0.001 
k     :  0.000 (manipulability:  0.032, gain:  0.001, limit:  0.100, len:7)
nspace:  0.033  -0.025   0.033  -0.059  -0.099  -0.004   0.000 
J     : -0.132  -0.302   0.257  -0.129  -0.000  -0.000   0.000 
         0.555   0.271   0.402   0.236   0.126   0.127  -0.000 
        -0.000  -0.326   0.313  -0.271  -0.025   0.000  -0.180 
        -0.002   0.667   0.723   0.539  -0.700   0.707  -0.000 
         0.000   0.745  -0.648   0.745   0.139   0.000   1.000 
J#t   : -3.206  -0.378   2.344   1.912   3.621   0.082  -0.049 
         0.850   0.187   0.709   0.280   1.040  -0.081  -0.013 
        -0.316  -0.252   0.601   0.099   0.399  -0.074   0.192 
        -0.233   0.250   0.201   0.025  -0.575   0.383   0.002 
        -1.287   0.360   0.522   0.929   1.623   0.015   0.067 
x     :  0.001   0.000  -0.004  -0.000  -0.002 
J#x   :  0.007  -0.017  -0.010   0.009  -0.000   0.018  -0.055 
Ny    : -0.007   0.016   0.010  -0.009   0.000  -0.018   0.001 
dav   :  0.000  -0.000  -0.000   0.000  -0.000   0.000  -0.054 
dav^  :  0.000  -0.000  -0.000   0.000  -0.000   0.000  -0.054 
loop:  46
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  4899.988 848.647 703.855 / 1.328 0.002 5.619e-05>)
targe-coordst: (#<room73b2-bottle-object #X667e2e8 room73b2-bottle  4900.0 850.0 700.0 / 0.0 0.0 0.0>)
vel-pos :  1.325   0.312  -3.852 
vel-rot : -0.000  -0.002 
vel-pos-norm :   4.085/  1.000
vel-rot-norm :   0.002/  0.017
angle :  -55.7   -13.6    23.7   -25.5    41.2     8.0   -45.0 
usrwei:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
ocost :  0.684   0.221   0.538   2.933   0.517   0.114 1288.992 
cost  :  0.684   0.221   0.538   2.933   0.517   0.114 1288.992 
weight:  1.000   1.000   0.650   0.254   1.000   0.897   0.001 
k     :  0.000 (manipulability:  0.032, gain:  0.001, limit:  0.100, len:7)
nspace:  0.033  -0.031   0.021  -0.059  -0.099  -0.004   0.000 
J     : -0.132  -0.302   0.257  -0.129  -0.000  -0.000   0.000 
         0.555   0.271   0.402   0.236   0.126   0.127   0.000 
        -0.000  -0.326   0.313  -0.271  -0.025   0.000  -0.180 
        -0.002   0.667   0.723   0.539  -0.700   0.707   0.000 
         0.000   0.745  -0.648   0.745   0.139   0.000   1.000 
J#t   : -3.090  -0.586   2.196   1.992   3.604   0.352  -0.048 
         0.875   0.139   0.671   0.294   1.045  -0.003  -0.013 
        -0.281  -0.316   0.556   0.124   0.394   0.009   0.192 
        -0.235   0.256   0.207   0.024  -0.581   0.367   0.002 
        -1.276   0.339   0.504   0.933   1.630   0.058   0.067 
x     :  0.001   0.000  -0.004  -0.000  -0.002 
J#x   :  0.007  -0.016  -0.009   0.010  -0.001   0.016  -0.055 
Ny    : -0.007   0.016   0.009  -0.010   0.001  -0.016   0.001 
dav   :  0.000  -0.000   0.000   0.000  -0.000  -0.000  -0.054 
dav^  :  0.000  -0.000   0.000   0.000  -0.000  -0.000  -0.054 
loop:  47
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  4899.988 848.647 703.855 / 1.328 0.002 5.619e-05>)
targe-coordst: (#<room73b2-bottle-object #X667e2e8 room73b2-bottle  4900.0 850.0 700.0 / 0.0 0.0 0.0>)
vel-pos :  1.325   0.312  -3.852 
vel-rot : -0.000  -0.002 
vel-pos-norm :   4.085/  1.000
vel-rot-norm :   0.002/  0.017
angle :  -55.7   -13.6    23.7   -25.5    41.2     8.0   -45.0 
usrwei:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
ocost :  0.684   0.221   0.538   2.933   0.517   0.114 1288.992 
cost  :  0.684   0.221   0.538   2.933   0.517   0.114 1288.992 
weight:  1.000   1.000   1.000   0.254   1.000   1.000   0.001 
k     :  0.000 (manipulability:  0.032, gain:  0.001, limit:  0.100, len:7)
nspace:  0.033  -0.031   0.033  -0.059  -0.099  -0.004   0.000 
J     : -0.132  -0.302   0.257  -0.129  -0.000   0.000  -0.000 
         0.555   0.271   0.402   0.236   0.126   0.127   0.000 
        -0.000  -0.326   0.313  -0.271  -0.025   0.000  -0.180 
        -0.002   0.667   0.723   0.539  -0.700   0.707   0.000 
         0.000   0.745  -0.648   0.745   0.139  -0.000   1.000 
J#t   : -3.192  -0.401   2.330   1.925   3.612   0.099  -0.049 
         0.843   0.198   0.716   0.274   1.044  -0.090  -0.013 
        -0.307  -0.268   0.592   0.107   0.393  -0.062   0.192 
        -0.242   0.265   0.210   0.016  -0.570   0.371   0.002 
        -1.300   0.382   0.535   0.917   1.631  -0.002   0.067 
x     :  0.001   0.000  -0.004  -0.000  -0.002 
J#x   :  0.008  -0.018  -0.010   0.010  -0.001   0.019  -0.055 
Ny    : -0.008   0.018   0.010  -0.010   0.001  -0.019   0.001 
dav   :  0.000  -0.000  -0.000   0.000  -0.000   0.000  -0.054 
dav^  :  0.000  -0.000  -0.000   0.000  -0.000   0.000  -0.054 
loop:  48
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  4899.988 848.647 703.855 / 1.328 0.002 5.619e-05>)
targe-coordst: (#<room73b2-bottle-object #X667e2e8 room73b2-bottle  4900.0 850.0 700.0 / 0.0 0.0 0.0>)
vel-pos :  1.325   0.312  -3.852 
vel-rot : -0.000  -0.002 
vel-pos-norm :   4.085/  1.000
vel-rot-norm :   0.002/  0.017
angle :  -55.7   -13.6    23.7   -25.5    41.2     8.0   -45.0 
usrwei:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
ocost :  0.684   0.221   0.538   2.933   0.517   0.114 1288.992 
cost  :  0.684   0.221   0.538   2.933   0.517   0.114 1288.992 
weight:  1.000   1.000   0.650   0.254   1.000   0.897   0.001 
k     :  0.000 (manipulability:  0.032, gain:  0.001, limit:  0.100, len:7)
nspace:  0.033  -0.031   0.021  -0.059  -0.099  -0.004   0.000 
J     : -0.132  -0.302   0.257  -0.129  -0.000  -0.000   0.000 
         0.555   0.271   0.402   0.236   0.126   0.127  -0.000 
        -0.000  -0.326   0.313  -0.271  -0.025   0.000  -0.180 
        -0.002   0.667   0.723   0.539  -0.700   0.707   0.000 
         0.000   0.745  -0.648   0.745   0.139   0.000   1.000 
J#t   : -3.090  -0.586   2.196   1.992   3.604   0.352  -0.048 
         0.875   0.139   0.671   0.294   1.045  -0.003  -0.013 
        -0.281  -0.316   0.556   0.124   0.394   0.009   0.192 
        -0.235   0.256   0.207   0.024  -0.581   0.367   0.002 
        -1.276   0.339   0.504   0.933   1.630   0.058   0.067 
x     :  0.001   0.000  -0.004  -0.000  -0.002 
J#x   :  0.007  -0.016  -0.009   0.010  -0.001   0.016  -0.055 
Ny    : -0.007   0.016   0.009  -0.010   0.001  -0.016   0.001 
dav   :  0.000  -0.000   0.000   0.000  -0.000  -0.000  -0.054 
dav^  :  0.000  -0.000   0.000   0.000  -0.000  -0.000  -0.054 
loop:  49
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  4899.988 848.647 703.855 / 1.328 0.002 5.619e-05>)
targe-coordst: (#<room73b2-bottle-object #X667e2e8 room73b2-bottle  4900.0 850.0 700.0 / 0.0 0.0 0.0>)
vel-pos :  1.325   0.312  -3.852 
vel-rot : -0.000  -0.002 
vel-pos-norm :   4.085/  1.000
vel-rot-norm :   0.002/  0.017
angle :  -55.7   -13.6    23.7   -25.5    41.2     8.0   -45.0 
usrwei:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
ocost :  0.684   0.221   0.538   2.933   0.517   0.114 1288.992 
cost  :  0.684   0.221   0.538   2.933   0.517   0.114 1288.992 
weight:  1.000   1.000   1.000   0.254   1.000   1.000   0.001 
k     :  0.000 (manipulability:  0.032, gain:  0.001, limit:  0.100, len:7)
nspace:  0.033  -0.031   0.033  -0.059  -0.099  -0.004   0.000 
J     : -0.132  -0.302   0.257  -0.129   0.000  -0.000  -0.000 
         0.555   0.271   0.402   0.236   0.126   0.127  -0.000 
        -0.000  -0.326   0.313  -0.271  -0.025   0.000  -0.180 
        -0.002   0.667   0.723   0.539  -0.700   0.707   0.000 
         0.000   0.745  -0.648   0.745   0.139   0.000   1.000 
J#t   : -3.192  -0.401   2.330   1.925   3.612   0.099  -0.049 
         0.843   0.198   0.716   0.274   1.044  -0.090  -0.013 
        -0.307  -0.268   0.592   0.107   0.393  -0.062   0.192 
        -0.242   0.265   0.210   0.016  -0.570   0.371   0.002 
        -1.300   0.382   0.535   0.917   1.631  -0.002   0.067 
x     :  0.001   0.000  -0.004  -0.000  -0.002 
J#x   :  0.008  -0.018  -0.010   0.010  -0.001   0.019  -0.055 
Ny    : -0.008   0.018   0.010  -0.010   0.001  -0.019   0.001 
dav   :  0.000  -0.000  -0.000   0.000  -0.000   0.000  -0.054 
dav^  :  0.000  -0.000  -0.000   0.000  -0.000   0.000  -0.054 
;; inverse-kinematics failed.
;; dif-pos : #f(1.32479 0.312458 -3.85177)/(4.0852/1)
;; dif-rot : #f(-5.619174e-05 -0.002231 0.0)/(0.002232/0.017453)
;;  coords : #<coordinates #X756df18  5000.0 250.0 550.0 / 1.571 0.0 0.0>
;;  angles : (-6.86932 -57.0012 -19.9991 -75.7242 77.2858 49.1445 -15.0728 0.0 -3.0 45.0 0.0 -110.0 0.0 0.0 0.0 0.0 0.0 0.0 -17.54 42.976 -25.435 0.0 0.0 20.6288 0.0 0.0 -17.54 42.976 -25.435 0.0 0.0 8.87905 0.0 -2.0 0.0 -2.0)
;;    args : ((#<room73b2-bottle-object #X667e2e8 room73b2-bottle  4900.0 850.0 700.0 / 0.0 0.0 0.0>) :move-target #<cascaded-coords #X7e323e8  4899.988 848.647 703.855 / 1.328 0.002 5.619e-05> :collision-avoidance-link-pair nil :link-list (#<bodyset-link #X77626f0 :larm-shoulder-y  4895.0 278.0 1110.0 / 0.598 6.893e-17 3.142> #<bodyset-link #X7781968 :larm-shoulder-p  4812.261 399.504 1110.0 / 0.598 -0.238 1.571> #<bodyset-link #X77ca708 :larm-shoulder-r  4797.801 389.658 1105.763 / -1.465 -1.097 2.113> #<bodyset-link #X77e1ec8 :larm-elbow-p  4794.646 518.026 890.439 / -2.761 0.638 -2.079> #<bodyset-link #X78095b0 :larm-wrist-y  4825.645 607.474 776.547 / -0.341 -0.098 -2.354> #<bodyset-link #X7814888 :larm-wrist-r  4856.772 673.912 704.256 / -0.242 5.619e-05 -0.788> #<bodyset-link #X7872508 :larm-wrist-p  4856.772 673.912 704.256 / 1.303 -1.569 0.025>) :link-list (#<bodyset-link #X77626f0 :larm-shoulder-y  4895.0 278.0 1110.0 / 0.598 6.893e-17 3.142> #<bodyset-link #X7781968 :larm-shoulder-p  4812.261 399.504 1110.0 / 0.598 -0.238 1.571> #<bodyset-link #X77ca708 :larm-shoulder-r  4797.801 389.658 1105.763 / -1.465 -1.097 2.113> #<bodyset-link #X77e1ec8 :larm-elbow-p  4794.646 518.026 890.439 / -2.761 0.638 -2.079> #<bodyset-link #X78095b0 :larm-wrist-y  4825.645 607.474 776.547 / -0.341 -0.098 -2.354> #<bodyset-link #X7814888 :larm-wrist-r  4856.772 673.912 704.256 / -0.242 5.619e-05 -0.788> #<bodyset-link #X7872508 :larm-wrist-p  4856.772 673.912 704.256 / 1.303 -1.569 0.025>) :move-target #<cascaded-coords #X7e323e8  4899.988 848.647 703.855 / 1.328 0.002 5.619e-05> :rotation-axis :z :debug-view t)
;; command : (let ((r (instance h7-robot :init))) (progn (send r :newcoords (make-coords :4x4 #2f((2.220446e-16 -1.0 0.0 5000.0) (1.0 2.220446e-16 0.0 250.0) (0.0 0.0 1.0 550.0) (0.0 0.0 0.0 1.0)))) (mapc #'(lambda (j a) (send* j :joint-angle a nil)) (list (send r :larm-shoulder-y) (send r :larm-shoulder-p) (send r :larm-shoulder-r) (send r :larm-elbow-p) (send r :larm-wrist-y) (send r :larm-wrist-r) (send r :larm-wrist-p) (send r :larm-finger1) (send r :rarm-shoulder-y) (send r :rarm-shoulder-p) (send r :rarm-shoulder-r) (send r :rarm-elbow-p) (send r :rarm-wrist-y) (send r :rarm-wrist-r) (send r :rarm-wrist-p) (send r :rarm-finger1) (send r :lleg-crotch-y) (send r :lleg-crotch-r) (send r :lleg-crotch-p) (send r :lleg-knee-p) (send r :lleg-ankle-p) (send r :lleg-ankle-r) (send r :lleg-toe) (send r :head-neck-p) (send r :rleg-crotch-y) (send r :rleg-crotch-r) (send r :rleg-crotch-p) (send r :rleg-knee-p) (send r :rleg-ankle-p) (send r :rleg-ankle-r) (send r :rleg-toe) (send r :head-neck-y) (send r :larm-finger2) (send r :larm-finger3) (send r :rarm-finger2) (send r :rarm-finger3)) '(-6.86932 -57.0012 -19.9991 -75.7242 77.2858 49.1445 -15.0728 0.0 -3.0 45.0 0.0 -110.0 0.0 0.0 0.0 0.0 0.0 0.0 -17.54 42.976 -25.435 0.0 0.0 20.6288 0.0 0.0 -17.54 42.976 -25.435 0.0 0.0 8.87905 0.0 -2.0 0.0 -2.0)) (objects (list r))) (send* r :inverse-kinematics (list (make-coords :pos #f(4900.0 850.0 700.0) :rot #2f((1.0 0.0 0.0) (0.0 1.0 0.0) (0.0 0.0 1.0))) :dump-command nil :debug-view t :move-target (let* ((p (send r :larm-wrist-p)) (c (make-cascoords :coords (send (send p :copy-worldcoords) :transform (make-cascoords :4x4 #2f((2.220446e-16 -1.619158e-16 1.0 0.0) (4.906539e-18 1.0 1.619158e-16 -5.684342e-14) (-1.0 4.906539e-18 2.220446e-16 -180.0) (0.0 0.0 0.0 1.0)))) :parent p))) c) :collision-avoidance-link-pair nil :link-list (list (send r :larm-shoulder-y) (send r :larm-shoulder-p) (send r :larm-shoulder-r) (send r :larm-elbow-p) (send r :larm-wrist-y) (send r :larm-wrist-r) (send r :larm-wrist-p)) :link-list (list (send r :larm-shoulder-y) (send r :larm-shoulder-p) (send r :larm-shoulder-r) (send r :larm-elbow-p) (send r :larm-wrist-y) (send r :larm-wrist-r) (send r :larm-wrist-p)) :move-target (let* ((p (send r :larm-wrist-p)) (c (make-cascoords :coords (send (send p :copy-worldcoords) :transform (make-cascoords :4x4 #2f((2.220446e-16 -1.619158e-16 1.0 0.0) (4.906539e-18 1.0 1.619158e-16 -5.684342e-14) (-1.0 4.906539e-18 2.220446e-16 -180.0) (0.0 0.0 0.0 1.0)))) :parent p))) c) :rotation-axis :z :debug-view t)))
;; dump debug command to /tmp/irtmodel-ik-9251/h7-robot-2012-11-20-21-24-59-failure.l
;; (progn (load "/tmp/irtmodel-ik-9251/h7-robot-2012-11-20-21-24-59-failure.l")(ik-setup)(ik-check))
nil
51.irteusgl$ nil
51.irteusgl$ (send *robot* :larm :inverse-kinematics
      *bottle*
      :link-list (send *robot* :link-list (send *robot* :larm :end-coords :parent))
      :move-target (send *robot* :larm :end-coords)
      :rotation-axis :z
      :debug-view t)
(send *robot* :larm :end-coords :dissoc *kettle*)

loop:   1
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  4900.052 849.883 1120.007 / 1.571 0.104 -1.571>)
targe-coordst: (#<room73b2-bottle-object #X667e2e8 room73b2-bottle  4900.0 850.0 700.0 / 0.0 0.0 0.0>)
vel-pos : 10.425  99.455   0.011 
vel-rot :  0.497  -0.052 
vel-pos-norm : 100.000/  1.000
vel-rot-norm :   0.500/  0.017
angle :   -6.9   -57.0   -20.0   -75.7    77.3    49.1   -15.1 
usrwei:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
ocost :100000000000000000000.000 100000000000000000000.000 100000000000000000000.000 100000000000000000000.000 100000000000000000000.000 100000000000000000000.000 100000000000000000000.000 
cost  : 27.133   0.077 1647.127   0.136   2.045   1.411   1.082 
weight:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
k     :  0.000 (manipulability:  0.037, gain:  0.001, limit:  0.100, len:7)
nspace: -0.411   0.005   0.573   0.004  -0.268  -0.171   0.064 
J     :  0.005   0.069   0.130   0.152   0.000  -0.000   0.000 
        -0.001   0.564   0.032   0.335   0.031   0.174   0.000 
         0.572  -0.001   0.459  -0.124  -0.136  -0.000  -0.180 
        -0.104   0.119   0.451   0.414  -0.632   0.260  -0.000 
        -0.995  -0.012  -0.890   0.144   0.756   0.000   1.000 
J#t   : -1.328  -1.854   3.218   4.519   3.525  -3.885  -1.794 
         0.472   1.680  -0.662  -0.185  -0.035   0.777  -0.047 
         1.602   0.199   0.929  -0.907   0.211   0.894   2.391 
        -0.207  -0.128   0.230  -0.110  -1.155   0.789   0.886 
         0.224  -0.028   0.239  -0.189   0.163   0.383   1.338 
x     :  0.010   0.099   0.000   0.497  -0.052 
J#x   : -4.664   4.888   3.998  -0.927 -31.479  23.442  19.933 
Ny    : -0.249   0.204   0.237  -0.281  -0.005  -0.167   0.010 
dav   : -4.913   5.092   4.234  -1.208 -31.484  23.275  19.943 
dav^  : -4.913   5.092   4.234  -1.208 -31.484  23.275  19.943 
loop:   2
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  4875.604 832.604 1019.293 / 1.791 0.49 -1.14>)
targe-coordst: (#<room73b2-bottle-object #X667e2e8 room73b2-bottle  4900.0 850.0 700.0 / 0.0 0.0 0.0>)
vel-pos : 50.025  74.696 -43.794 
vel-rot :  0.431  -0.253 
vel-pos-norm : 100.000/  1.000
vel-rot-norm :   0.500/  0.017
angle :  -11.8   -51.9   -15.8   -76.9    45.8    72.4     4.9 
usrwei:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
ocost : 27.133   0.077 1647.127   0.136   2.045   1.411   1.082 
cost  :  9.076   0.044  91.703   0.165   0.602   8.245   0.282 
weight:  1.000   1.000   1.000   0.858   1.000   0.108   1.000 
k     :  0.001 (manipulability:  0.017, gain:  0.001, limit:  0.100, len:7)
nspace: -0.312   0.002   0.492   0.005  -0.116  -0.040  -0.007 
J     :  0.090   0.181   0.189   0.180  -0.000   0.000   0.000 
         0.184   0.483   0.099   0.210  -0.005   0.179   0.000 
         0.516  -0.181   0.431  -0.198  -0.172  -0.000  -0.180 
        -0.470   0.364   0.126   0.601  -0.301  -0.085   0.000 
        -0.802   0.204  -0.978   0.211   0.953   0.000   1.000 
J#t   : -1.314  -1.186   3.465   3.139   8.403  -0.614  -6.081 
         1.383   2.133  -1.526  -1.028  -2.330   0.309   1.616 
         1.479  -0.586   0.825  -0.675  -4.004   0.195   6.058 
        -0.218  -0.097   0.249   0.125  -2.731   0.084   2.660 
         0.276  -0.139   0.138  -0.058  -0.650   0.042   2.012 
x     :  0.050   0.075  -0.044   0.431  -0.253 
J#x   :-10.935   6.801   5.486  10.216 -33.909   0.540  10.856 
Ny    : -0.161   0.127   0.170  -0.220   0.041  -0.016   0.018 
dav   :-11.096   6.928   5.655   9.996 -33.868   0.525  10.874 
dav^  :-11.096   6.928   5.655   9.996 -33.868   0.525  10.874 
loop:   3
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  4886.05 832.305 937.13 / 2.119 0.43 -0.521>)
targe-coordst: (#<room73b2-bottle-object #X667e2e8 room73b2-bottle  4900.0 850.0 700.0 / 0.0 0.0 0.0>)
vel-pos : 44.448  36.647 -81.740 
vel-rot :  0.368  -0.339 
vel-pos-norm : 100.000/  1.000
vel-rot-norm :   0.500/  0.017
angle :  -22.9   -45.0   -10.1   -66.9    11.9    72.9    15.7 
usrwei:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
ocost :  9.076   0.044  91.703   0.165   0.602   8.245   0.282 
cost  :  2.177   0.000  16.690   0.072   0.184   8.766   1.157 
weight:  1.000   1.000   1.000   1.000   1.000   0.102   0.464 
k     :  0.001 (manipulability:  0.022, gain:  0.001, limit:  0.100, len:7)
nspace: -0.138  -0.000   0.393  -0.001  -0.023  -0.039  -0.033 
J     :  0.256   0.119   0.303   0.109   0.000  -0.000   0.000 
         0.356   0.372   0.183   0.114  -0.014   0.173   0.000 
         0.339  -0.367   0.334  -0.275  -0.172  -0.000  -0.180 
        -0.416   0.738   0.081   0.844  -0.282  -0.271   0.000 
        -0.452   0.338  -0.903   0.287   0.956   0.000   1.000 
J#t   : -3.031   0.581   5.534  -0.384   6.261   0.097  -2.428 
         2.822   1.159  -2.649  -0.217  -2.607   0.100   1.038 
         4.193  -3.558  -3.091   3.336  -5.743  -0.566   4.818 
         0.825  -0.872  -0.863   1.634  -2.154  -0.218   1.472 
         1.008  -0.846  -0.822   1.001  -0.772  -0.150   1.444 
x     :  0.044   0.037  -0.082   0.368  -0.339 
J#x   :-23.620  18.615  20.773  -2.041   6.946   1.438 -23.575 
Ny    : -0.063   0.067   0.069  -0.105  -0.004  -0.024   0.045 
dav   :-23.682  18.682  20.843  -2.146   6.942   1.414 -23.530 
dav^  :-23.682  18.682  20.843  -2.146   6.942   1.414 -23.530 
loop:   4
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  4907.469 837.159 899.239 / 2.125 -0.008 -0.139>)
targe-coordst: (#<room73b2-bottle-object #X667e2e8 room73b2-bottle  4900.0 850.0 700.0 / 0.0 0.0 0.0>)
vel-pos :  6.680  13.637 -98.840 
vel-rot :  0.139   0.008 
vel-pos-norm : 100.000/  1.000
vel-rot-norm :   0.139/  0.017
angle :  -46.6   -26.3    10.7   -69.1    18.9    74.4    -7.8 
usrwei:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
ocost :  2.177   0.000  16.690   0.072   0.184   8.766   1.157 
cost  :  0.088   0.122   1.512   0.021   0.243  10.442   0.468 
weight:  1.000   0.891   1.000   1.000   0.805   0.087   1.000 
k     :  0.001 (manipulability:  0.026, gain:  0.001, limit:  0.100, len:7)
nspace:  0.001  -0.010   0.124  -0.000  -0.029  -0.034   0.017 
J     :  0.305  -0.046   0.335   0.040   0.000  -0.000  -0.000 
         0.465   0.259   0.150   0.075   0.007   0.178   0.000 
         0.063  -0.361   0.245  -0.290  -0.173  -0.000  -0.180 
         0.008   0.979   0.185   0.947  -0.267   0.135  -0.000 
        -0.139   0.202  -0.931   0.255   0.963   0.000   1.000 
J#t   : -0.525  -0.763   3.062   1.624   4.578  -0.843  -1.879 
         2.157   0.988  -1.611  -1.358  -1.974   0.480   0.841 
         1.100  -2.370  -1.081  -0.382  -9.673   1.821   9.002 
        -0.065  -0.316  -0.007   0.592  -2.543   0.442   2.337 
         0.265  -0.578  -0.298   0.132  -1.631   0.369   2.405 
x     :  0.007   0.014  -0.099   0.139   0.008 
J#x   : -5.154  11.131   5.846   6.505  34.011  -6.576 -31.368 
Ny    : -0.003   0.029   0.012  -0.034  -0.022  -0.029   0.035 
dav   : -5.158  11.160   5.858   6.471  33.989  -6.605 -31.334 
dav^  : -5.158  11.160   5.858   6.471  33.989  -6.605 -31.334 
loop:   5
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  4882.005 829.158 819.057 / 2.065 -0.021 -0.042>)
targe-coordst: (#<room73b2-bottle-object #X667e2e8 room73b2-bottle  4900.0 850.0 700.0 / 0.0 0.0 0.0>)
vel-pos :  5.999 -16.942 -98.372 
vel-rot :  0.042   0.021 
vel-pos-norm : 100.000/  1.000
vel-rot-norm :   0.047/  0.017
angle :  -51.7   -15.1    16.6   -62.6    52.9    67.8   -39.1 
usrwei:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
ocost :  0.088   0.122   1.512   0.021   0.243  10.442   0.468 
cost  :  0.398   0.208   0.962   0.177   0.764   5.106  37.090 
weight:  0.715   0.828   1.000   0.850   0.567   1.000   0.026 
k     :  0.000 (manipulability:  0.054, gain:  0.001, limit:  0.100, len:7)
nspace:  0.009  -0.023   0.076  -0.005  -0.082  -0.325   0.011 
J     :  0.250  -0.057   0.354   0.043  -0.000   0.000  -0.000 
         0.491   0.300   0.127   0.140   0.043   0.140   0.000 
         0.015  -0.318   0.282  -0.270  -0.167  -0.000  -0.180 
         0.021   0.985   0.173   0.936  -0.294   0.631   0.000 
        -0.042   0.174  -0.961   0.229   0.926  -0.000   1.000 
J#t   : -0.305  -1.254   2.490   2.730   2.001  -1.834   0.121 
         1.967   1.044  -1.004  -1.711  -0.660   0.812  -0.062 
         0.024  -2.137  -0.150  -1.715   0.567   6.183   0.094 
        -0.433  -0.224   0.223   0.380   0.128   1.383   0.029 
        -0.024  -0.818  -0.139   0.183   0.965   1.493   0.072 
x     :  0.006  -0.017  -0.098   0.042   0.021 
J#x   : -3.219   9.085   3.043  13.398  -0.405 -31.159  -0.272 
Ny    :  0.013  -0.012  -0.012   0.012  -0.031  -0.010   0.017 
dav   : -3.207   9.073   3.031  13.409  -0.436 -31.169  -0.254 
dav^  : -3.207   9.073   3.031  13.409  -0.436 -31.169  -0.254 
loop:   6
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  4884.618 825.855 722.098 / 1.668 0.052 -0.015>)
targe-coordst: (#<room73b2-bottle-object #X667e2e8 room73b2-bottle  4900.0 850.0 700.0 / 0.0 0.0 0.0>)
vel-pos : 23.658 -17.334 -21.161 
vel-rot :  0.015  -0.052 
vel-pos-norm :  36.165/  1.000
vel-rot-norm :   0.054/  0.017
angle :  -54.9    -6.1    19.6   -49.2    52.4    36.6   -39.4 
usrwei:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
ocost :  0.398   0.208   0.962   0.177   0.764   5.106  37.090 
cost  :  0.620   0.291   0.759   0.585   0.753   0.743  40.537 
weight:  0.617   0.774   1.000   0.631   1.000   1.000   0.024 
k     :  0.000 (manipulability:  0.047, gain:  0.001, limit:  0.100, len:7)
nspace:  0.017  -0.037   0.055  -0.032  -0.143  -0.095   0.011 
J     :  0.043  -0.175   0.332  -0.017   0.000   0.000  -0.000 
         0.546   0.342   0.230   0.239   0.092   0.139   0.000 
         0.010  -0.311   0.327  -0.272  -0.107  -0.000  -0.180 
        -0.052   0.869   0.484   0.784  -0.621   0.634  -0.000 
        -0.015   0.492  -0.867   0.490   0.596   0.000   1.000 
J#t   : -1.543  -1.023   2.814   3.687   1.862  -3.604   0.008 
         1.613   0.562   0.070  -0.542   0.181   0.155  -0.035 
        -0.011  -1.286  -0.845  -4.403   2.628  10.409   0.476 
        -0.429   0.092   0.107  -0.005  -0.029   1.311   0.059 
        -0.511  -0.483  -0.207  -0.527   1.840   3.227   0.208 
x     :  0.024  -0.017  -0.021   0.015  -0.052 
J#x   : -2.528   1.122   5.470  12.432  -6.315 -26.115  -1.097 
Ny    :  0.016  -0.005  -0.005   0.004  -0.035  -0.028   0.018 
dav   : -2.511   1.117   5.465  12.436  -6.350 -26.143  -1.079 
dav^  : -2.511   1.117   5.465  12.436  -6.350 -26.143  -1.079 
loop:   7
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  4895.825 837.67 699.827 / 1.311 0.051 -0.022>)
targe-coordst: (#<room73b2-bottle-object #X667e2e8 room73b2-bottle  4900.0 850.0 700.0 / 0.0 0.0 0.0>)
vel-pos : 12.964  -0.880   0.813 
vel-rot :  0.022  -0.051 
vel-pos-norm :  13.019/  1.000
vel-rot-norm :   0.055/  0.017
angle :  -57.4    -4.9    25.1   -36.8    46.1    10.4   -40.5 
usrwei:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
ocost :  0.620   0.291   0.759   0.585   0.753   0.743  40.537 
cost  :  0.825   0.303   0.473   1.295   0.607   0.152  62.164 
weight:  0.548   0.768   1.000   0.436   1.000   1.000   0.016 
k     :  0.000 (manipulability:  0.041, gain:  0.001, limit:  0.100, len:7)
nspace:  0.024  -0.039   0.027  -0.056  -0.117  -0.008   0.007 
J     : -0.143  -0.287   0.256  -0.101  -0.000  -0.000  -0.000 
         0.541   0.284   0.332   0.264   0.115   0.137   0.000 
         0.004  -0.311   0.344  -0.264  -0.033  -0.000  -0.180 
        -0.051   0.675   0.729   0.563  -0.748   0.649  -0.000 
        -0.022   0.736  -0.676   0.682   0.181   0.000   1.000 
J#t   : -1.238  -4.192   0.343   5.088   1.701   1.430  -0.461 
         1.188  -0.678   0.312   1.141   0.787   0.366  -0.176 
        -3.171   8.438   4.862  -8.057   3.263  -3.740   1.823 
        -0.261   0.354   0.239  -0.043  -0.560   0.276   0.025 
        -1.856   2.906   1.660  -1.672   2.089  -1.175   0.674 
x     :  0.013  -0.001   0.001   0.022  -0.051 
J#x   :  3.951 -10.704  -4.068   8.159  -5.400   4.633  -2.180 
Ny    :  0.021  -0.020  -0.008   0.010  -0.032  -0.014   0.009 
dav   :  3.972 -10.724  -4.076   8.169  -5.431   4.619  -2.171 
dav^  :  3.972 -10.724  -4.076   8.169  -5.431   4.619  -2.171 
loop:   8
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  4904.064 848.054 709.615 / 1.419 0.007 0.005>)
targe-coordst: (#<room73b2-bottle-object #X667e2e8 room73b2-bottle  4900.0 850.0 700.0 / 0.0 0.0 0.0>)
vel-pos :  1.373   4.267  -9.626 
vel-rot : -0.005  -0.007 
vel-pos-norm :  10.619/  1.000
vel-rot-norm :   0.008/  0.017
angle :  -53.5   -15.7    21.0   -28.6    40.6    15.1   -42.6 
usrwei:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
ocost :  0.825   0.303   0.473   1.295   0.607   0.152  62.164 
cost  :  0.515   0.203   0.678   2.290   0.508   0.226 228.157 
weight:  1.000   1.000   0.596   0.304   1.000   0.816   0.004 
k     :  0.000 (manipulability:  0.036, gain:  0.001, limit:  0.100, len:7)
nspace:  0.020  -0.027   0.028  -0.061  -0.097  -0.013   0.002 
J     : -0.077  -0.282   0.277  -0.110  -0.000  -0.000  -0.000 
         0.565   0.280   0.400   0.224   0.118   0.132   0.000 
        -0.003  -0.350   0.294  -0.288  -0.047   0.000  -0.180 
        -0.007   0.704   0.682   0.586  -0.711   0.677   0.000 
         0.005   0.710  -0.677   0.733   0.260  -0.000   1.000 
J#t   : -3.827   1.039   4.299   2.385   2.357  -5.031  -0.134 
         1.063   0.380   0.711   0.125   0.543  -0.637  -0.021 
         3.059  -6.361  -5.447  -0.818   2.861  15.817   0.551 
        -0.212   0.030   0.024   0.089  -0.370   0.953   0.023 
        -0.017  -1.794  -1.448   0.624   2.293   5.181   0.200 
x     :  0.001   0.004  -0.010  -0.005  -0.007 
J#x   : -1.666   4.362   4.064   0.407  -2.041 -11.509  -0.402 
Ny    : -0.006   0.016   0.009  -0.012  -0.000  -0.015   0.004 
dav   : -1.672   4.378   4.073   0.395  -2.041 -11.524  -0.399 
dav^  : -1.672   4.378   4.073   0.395  -2.041 -11.524  -0.399 
loop:   9
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  4900.183 846.202 705.598 / 1.238 0.013 -0.002>)
targe-coordst: (#<room73b2-bottle-object #X667e2e8 room73b2-bottle  4900.0 850.0 700.0 / 0.0 0.0 0.0>)
vel-pos :  3.602   1.424  -5.549 
vel-rot :  0.002  -0.013 
vel-pos-norm :   6.767/  1.000
vel-rot-norm :   0.013/  0.017
angle :  -55.1   -11.3    25.1   -28.2    38.6     3.5   -43.0 
usrwei:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
ocost :  0.515   0.203   0.678   2.290   0.508   0.226 228.157 
cost  :  0.636   0.241   0.473   2.361   0.475   0.050 329.451 
weight:  0.611   0.806   1.000   0.298   1.000   1.000   0.003 
k     :  0.000 (manipulability:  0.037, gain:  0.001, limit:  0.100, len:7)
nspace:  0.018  -0.029   0.027  -0.061  -0.090  -0.001   0.002 
J     : -0.181  -0.323   0.217  -0.139  -0.000  -0.000   0.000 
         0.539   0.239   0.408   0.233   0.123   0.132  -0.000 
        -0.001  -0.333   0.314  -0.278  -0.011   0.000  -0.180 
        -0.013   0.589   0.790   0.461  -0.730   0.682   0.000 
        -0.002   0.808  -0.578   0.780   0.062   0.000   1.000 
J#t   : -2.182  -2.979  -0.128   2.818   4.413   5.496  -0.102 
         0.835  -0.588   0.158   0.662   1.818   1.837  -0.045 
        -2.320   6.522   7.189  -1.883  -4.112 -17.121   0.464 
        -0.139   0.197   0.160  -0.028  -0.678   0.402  -0.002 
        -1.778   2.451   2.587   0.390  -0.184  -5.604   0.171 
x     :  0.004   0.001  -0.006   0.002  -0.013 
J#x   :  1.642  -4.509  -4.176   0.945   2.421  10.881  -0.298 
Ny    : -0.000   0.006   0.002  -0.007  -0.001  -0.005   0.002 
dav   :  1.642  -4.503  -4.174   0.938   2.420  10.876  -0.296 
dav^  :  1.642  -4.503  -4.174   0.938   2.420  10.876  -0.296 
loop:  10
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  4900.792 846.057 705.105 / 1.422 0.013 0.003>)
targe-coordst: (#<room73b2-bottle-object #X667e2e8 room73b2-bottle  4900.0 850.0 700.0 / 0.0 0.0 0.0>)
vel-pos :  3.847   1.351  -5.060 
vel-rot : -0.003  -0.013 
vel-pos-norm :   6.499/  1.000
vel-rot-norm :   0.013/  0.017
angle :  -53.5   -15.8    20.9   -27.3    41.0    14.4   -43.3 
usrwei:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
ocost :  0.636   0.241   0.473   2.361   0.475   0.050 329.451 
cost  :  0.517   0.202   0.684   2.540   0.514   0.215 455.501 
weight:  1.000   1.000   0.594   0.282   0.660   0.823   0.002 
k     :  0.000 (manipulability:  0.034, gain:  0.001, limit:  0.100, len:7)
nspace:  0.020  -0.027   0.028  -0.060  -0.065  -0.012   0.001 
J     : -0.078  -0.282   0.278  -0.112  -0.000  -0.000  -0.000 
         0.563   0.285   0.401   0.226   0.120   0.131   0.000 
        -0.003  -0.347   0.297  -0.285  -0.045   0.000  -0.180 
        -0.013   0.707   0.677   0.587  -0.705   0.686   0.000 
         0.003   0.708  -0.679   0.731   0.249  -0.000   1.000 
J#t   : -3.869   1.157   4.325   2.303   2.221  -5.215  -0.065 
         1.067   0.377   0.716   0.145   0.500  -0.684  -0.010 
         3.394  -7.099  -5.680   0.040   2.791  15.793   0.297 
        -0.232   0.048   0.034   0.078  -0.332   0.961   0.011 
         0.114  -2.088  -1.539   0.993   2.206   5.082   0.111 
x     :  0.004   0.001  -0.005  -0.003  -0.013 
J#x   : -1.797   3.877   3.787  -0.241  -1.852  -9.710  -0.185 
Ny    : -0.007   0.016   0.008  -0.012   0.003  -0.011   0.002 
dav   : -1.804   3.893   3.795  -0.252  -1.848  -9.721  -0.183 
dav^  : -1.804   3.893   3.795  -0.252  -1.848  -9.721  -0.183 
loop:  11
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  4900.574 846.888 705.117 / 1.26 0.01 -0.001>)
targe-coordst: (#<room73b2-bottle-object #X667e2e8 room73b2-bottle  4900.0 850.0 700.0 / 0.0 0.0 0.0>)
vel-pos :  2.838   1.502  -5.088 
vel-rot :  0.001  -0.010 
vel-pos-norm :   6.017/  1.000
vel-rot-norm :   0.010/  0.017
angle :  -55.3   -11.9    24.7   -27.5    39.2     4.7   -43.5 
usrwei:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
ocost :  0.517   0.202   0.684   2.540   0.514   0.215 455.501 
cost  :  0.649   0.236   0.491   2.490   0.484   0.067 573.499 
weight:  0.606   0.809   1.000   1.000   1.000   1.000   0.002 
k     :  0.000 (manipulability:  0.035, gain:  0.001, limit:  0.100, len:7)
nspace:  0.018  -0.028   0.028  -0.211  -0.092  -0.002   0.001 
J     : -0.168  -0.318   0.228  -0.137   0.000   0.000  -0.000 
         0.543   0.247   0.408   0.233   0.123   0.131   0.000 
        -0.001  -0.331   0.313  -0.276  -0.015  -0.000  -0.180 
        -0.010   0.609   0.774   0.481  -0.723   0.688   0.000 
        -0.001   0.793  -0.596   0.773   0.082  -0.000   1.000 
J#t   : -1.300  -4.159  -0.347   3.871   2.976   4.473  -0.091 
         1.055  -0.731   0.148   0.785   1.394   1.411  -0.033 
        -2.917   6.813   6.893  -2.045  -2.896 -15.435   0.339 
        -0.172   0.236   0.193  -0.024  -0.665   0.343   0.000 
        -1.661   2.037   2.328   0.791  -0.244  -5.253   0.118 
x     :  0.003   0.002  -0.005   0.001  -0.010 
J#x   :  1.655  -3.858  -3.352   0.846   1.543   8.330  -0.183 
Ny    : -0.005   0.013   0.007  -0.011   0.003  -0.009   0.001 
dav   :  1.649  -3.845  -3.346   0.835   1.546   8.321  -0.182 
dav^  :  1.649  -3.845  -3.346   0.835   1.546   8.321  -0.182 
loop:  12
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  4900.594 847.092 705.629 / 1.404 0.008 0.002>)
targe-coordst: (#<room73b2-bottle-object #X667e2e8 room73b2-bottle  4900.0 850.0 700.0 / 0.0 0.0 0.0>)
vel-pos :  2.815   1.060  -5.608 
vel-rot : -0.002  -0.008 
vel-pos-norm :   6.364/  1.000
vel-rot-norm :   0.008/  0.017
angle :  -53.6   -15.8    21.4   -26.7    40.7    13.0   -43.7 
usrwei:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
ocost :  0.649   0.236   0.491   2.490   0.484   0.067 573.499 
cost  :  0.528   0.202   0.659   2.661   0.509   0.192 742.564 
weight:  1.000   1.000   0.603   0.273   0.663   0.839   0.001 
k     :  0.000 (manipulability:  0.034, gain:  0.001, limit:  0.100, len:7)
nspace:  0.021  -0.027   0.027  -0.060  -0.065  -0.010   0.001 
J     : -0.089  -0.288   0.273  -0.117  -0.000  -0.000   0.000 
         0.562   0.281   0.405   0.227   0.121   0.130   0.000 
        -0.002  -0.345   0.298  -0.283  -0.041   0.000  -0.180 
        -0.008   0.696   0.689   0.574  -0.705   0.691   0.000 
         0.002   0.718  -0.669   0.738   0.225   0.000   1.000 
J#t   : -3.887   1.180   4.250   2.147   2.285  -4.919  -0.050 
         0.988   0.416   0.797   0.170   0.548  -0.783  -0.009 
         3.291  -7.117  -5.585   0.481   2.819  15.233   0.219 
        -0.232   0.076   0.056   0.072  -0.362   0.881   0.007 
         0.051  -2.071  -1.504   1.140   2.237   4.916   0.080 
x     :  0.003   0.001  -0.006  -0.002  -0.008 
J#x   : -1.625   3.456   3.221  -0.334  -1.506  -8.104  -0.117 
Ny    : -0.008   0.016   0.008  -0.011   0.005  -0.010   0.001 
dav   : -1.633   3.472   3.230  -0.345  -1.502  -8.115  -0.115 
dav^  : -1.633   3.472   3.230  -0.345  -1.502  -8.115  -0.115 
loop:  13
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  4900.43 847.334 705.194 / 1.267 0.007 -0.001>)
targe-coordst: (#<room73b2-bottle-object #X667e2e8 room73b2-bottle  4900.0 850.0 700.0 / 0.0 0.0 0.0>)
vel-pos :  2.454   1.210  -5.176 
vel-rot :  0.001  -0.007 
vel-pos-norm :   5.854/  1.000
vel-rot-norm :   0.007/  0.017
angle :  -55.3   -12.3    24.6   -27.0    39.2     4.9   -43.8 
usrwei:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
ocost :  0.528   0.202   0.659   2.661   0.509   0.192 742.564 
cost  :  0.648   0.232   0.496   2.588   0.485   0.070 892.099 
weight:  0.607   0.812   1.000   1.000   1.000   1.000   0.001 
k     :  0.000 (manipulability:  0.035, gain:  0.001, limit:  0.100, len:7)
nspace:  0.018  -0.027   0.029  -0.216  -0.092  -0.002   0.001 
J     : -0.165  -0.317   0.230  -0.137  -0.000  -0.000   0.000 
         0.545   0.249   0.409   0.233   0.124   0.130   0.000 
        -0.001  -0.331   0.313  -0.276  -0.015   0.000  -0.180 
        -0.007   0.614   0.770   0.485  -0.719   0.692   0.000 
        -0.001   0.789  -0.600   0.772   0.085   0.000   1.000 
J#t   : -1.374  -3.968  -0.219   3.704   3.057   4.328  -0.063 
         1.033  -0.638   0.194   0.703   1.398   1.323  -0.022 
        -2.694   6.161   6.521  -1.440  -3.125 -14.986   0.231 
        -0.176   0.240   0.198  -0.019  -0.665   0.332   0.000 
        -1.586   1.807   2.201   1.003  -0.306  -5.089   0.080 
x     :  0.002   0.001  -0.005   0.001  -0.007 
J#x   :  1.344  -3.187  -2.877   0.571   1.562   7.309  -0.113 
Ny    : -0.007   0.016   0.008  -0.012   0.004  -0.011   0.001 
dav   :  1.337  -3.171  -2.869   0.560   1.566   7.299  -0.112 
dav^  :  1.337  -3.171  -2.869   0.560   1.566   7.299  -0.112 
loop:  14
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  4900.385 847.356 705.328 / 1.392 0.007 0.001>)
targe-coordst: (#<room73b2-bottle-object #X667e2e8 room73b2-bottle  4900.0 850.0 700.0 / 0.0 0.0 0.0>)
vel-pos :  2.569   0.842  -5.312 
vel-rot : -0.001  -0.007 
vel-pos-norm :   5.960/  1.000
vel-rot-norm :   0.007/  0.017
angle :  -53.9   -15.4    21.7   -26.5    40.8    12.2   -43.9 
usrwei:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
ocost :  0.648   0.232   0.496   2.588   0.485   0.070 892.099 
cost  :  0.549   0.205   0.640   2.707   0.510   0.179 1084.428 
weight:  1.000   1.000   0.610   0.270   0.662   0.848   0.001 
k     :  0.000 (manipulability:  0.033, gain:  0.001, limit:  0.100, len:7)
nspace:  0.023  -0.027   0.026  -0.060  -0.065  -0.009   0.001 
J     : -0.096  -0.290   0.270  -0.119  -0.000   0.000  -0.000 
         0.561   0.279   0.405   0.228   0.122   0.130   0.000 
        -0.001  -0.342   0.300  -0.281  -0.038  -0.000  -0.180 
        -0.007   0.691   0.695   0.568  -0.704   0.694   0.000 
         0.001   0.723  -0.666   0.740   0.211   0.000   1.000 
J#t   : -3.814   1.086   4.106   2.107   2.303  -4.614  -0.039 
         0.952   0.425   0.833   0.190   0.576  -0.818  -0.007 
         2.989  -6.777  -5.231   0.611   2.882  14.426   0.168 
        -0.239   0.106   0.078   0.062  -0.380   0.818   0.005 
        -0.064  -1.945  -1.390   1.186   2.267   4.652   0.061 
x     :  0.003   0.001  -0.005  -0.001  -0.007 
J#x   : -1.385   2.987   2.769  -0.329  -1.361  -6.961  -0.081 
Ny    : -0.008   0.016   0.008  -0.011   0.005  -0.011   0.001 
dav   : -1.393   3.003   2.777  -0.340  -1.356  -6.971  -0.080 
dav^  : -1.393   3.003   2.777  -0.340  -1.356  -6.971  -0.080 
loop:  15
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  4900.322 847.566 705.15 / 1.274 0.006 -0.0>)
targe-coordst: (#<room73b2-bottle-object #X667e2e8 room73b2-bottle  4900.0 850.0 700.0 / 0.0 0.0 0.0>)
vel-pos :  2.264   1.022  -5.136 
vel-rot :  0.000  -0.006 
vel-pos-norm :   5.705/  1.000
vel-rot-norm :   0.006/  0.017
angle :  -55.3   -12.4    24.5   -26.8    39.4     5.2   -44.0 
usrwei:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
ocost :  0.549   0.205   0.640   2.707   0.510   0.179 1084.428 
cost  :  0.652   0.231   0.501   2.634   0.488   0.074 1263.844 
weight:  0.605   0.813   1.000   1.000   1.000   1.000   0.001 
k     :  0.000 (manipulability:  0.034, gain:  0.001, limit:  0.100, len:7)
nspace:  0.018  -0.027   0.029  -0.218  -0.093  -0.002   0.000 
J     : -0.162  -0.316   0.233  -0.137  -0.000   0.000   0.000 
         0.546   0.251   0.408   0.233   0.124   0.130   0.000 
        -0.001  -0.330   0.313  -0.275  -0.016  -0.000  -0.180 
        -0.006   0.620   0.765   0.492  -0.716   0.695   0.000 
        -0.000   0.785  -0.606   0.769   0.091   0.000   1.000 
J#t   : -1.406  -3.835  -0.085   3.628   3.010   4.043  -0.047 
         1.028  -0.566   0.238   0.650   1.361   1.196  -0.016 
        -2.592   5.717   6.129  -1.152  -2.936 -14.094   0.172 
        -0.182   0.244   0.203  -0.012  -0.664   0.320   0.000 
        -1.553   1.651   2.070   1.105  -0.231  -4.789   0.059 
x     :  0.002   0.001  -0.005   0.000  -0.006 
J#x   :  1.170  -2.774  -2.506   0.469   1.401   6.389  -0.078 
Ny    : -0.008   0.017   0.009  -0.012   0.004  -0.012   0.001 
dav   :  1.162  -2.757  -2.498   0.457   1.405   6.377  -0.077 
dav^  :  1.162  -2.757  -2.498   0.457   1.405   6.377  -0.077 
loop:  16
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  4900.287 847.593 705.227 / 1.383 0.006 0.001>)
targe-coordst: (#<room73b2-bottle-object #X667e2e8 room73b2-bottle  4900.0 850.0 700.0 / 0.0 0.0 0.0>)
vel-pos :  2.341   0.726  -5.215 
vel-rot : -0.001  -0.006 
vel-pos-norm :   5.762/  1.000
vel-rot-norm :   0.006/  0.017
angle :  -54.2   -15.2    22.0   -26.4    40.8    11.6   -44.1 
usrwei:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
ocost :  0.652   0.231   0.501   2.634   0.488   0.074 1263.844 
cost  :  0.565   0.207   0.625   2.733   0.511   0.170 1288.992 
weight:  1.000   1.000   0.615   0.268   0.662   0.855   0.001 
k     :  0.000 (manipulability:  0.033, gain:  0.001, limit:  0.100, len:7)
nspace:  0.024  -0.028   0.026  -0.060  -0.065  -0.008   0.000 
J     : -0.101  -0.292   0.268  -0.121  -0.000  -0.000  -0.000 
         0.561   0.278   0.404   0.229   0.123   0.129   0.000 
        -0.001  -0.340   0.302  -0.280  -0.036   0.000  -0.180 
        -0.006   0.688   0.699   0.564  -0.704   0.696  -0.000 
         0.001   0.726  -0.663   0.741   0.201   0.000   1.000 
J#t   : -3.731   0.956   3.951   2.096   2.337  -4.275  -0.036 
         0.931   0.419   0.848   0.208   0.601  -0.819  -0.007 
         2.688  -6.333  -4.816   0.647   2.838  13.447   0.153 
        -0.244   0.131   0.096   0.053  -0.395   0.765   0.004 
        -0.172  -1.789  -1.255   1.201   2.255   4.329   0.055 
x     :  0.002   0.001  -0.005  -0.001  -0.006 
J#x   : -1.198   2.601   2.399  -0.288  -1.209  -6.040  -0.069 
Ny    : -0.008   0.016   0.009  -0.010   0.004  -0.012   0.001 
dav   : -1.206   2.617   2.408  -0.299  -1.204  -6.052  -0.068 
dav^  : -1.206   2.617   2.408  -0.299  -1.204  -6.052  -0.068 
loop:  17
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  4900.237 847.748 705.105 / 1.28 0.005 -0.0>)
targe-coordst: (#<room73b2-bottle-object #X667e2e8 room73b2-bottle  4900.0 850.0 700.0 / 0.0 0.0 0.0>)
vel-pos :  2.115   0.873  -5.095 
vel-rot :  0.000  -0.005 
vel-pos-norm :   5.585/  1.000
vel-rot-norm :   0.005/  0.017
angle :  -55.4   -12.6    24.4   -26.6    39.6     5.6   -44.1 
usrwei:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
ocost :  0.565   0.207   0.625   2.733   0.511   0.170 1288.992 
cost  :  0.655   0.230   0.505   2.668   0.491   0.079 1288.992 
weight:  0.604   0.813   1.000   1.000   1.000   1.000   0.001 
k     :  0.000 (manipulability:  0.034, gain:  0.001, limit:  0.100, len:7)
nspace:  0.018  -0.027   0.030  -0.220  -0.094  -0.002   0.000 
J     : -0.158  -0.314   0.236  -0.136   0.000  -0.000  -0.000 
         0.547   0.253   0.407   0.234   0.125   0.129   0.000 
        -0.001  -0.329   0.312  -0.274  -0.017  -0.000  -0.180 
        -0.005   0.626   0.760   0.498  -0.714   0.696   0.000 
        -0.000   0.780  -0.611   0.767   0.097   0.000   1.000 
J#t   : -1.454  -3.687   0.073   3.585   2.940   3.680  -0.048 
         1.017  -0.492   0.288   0.612   1.318   1.052  -0.016 
        -2.426   5.221   5.651  -0.985  -2.678 -12.926   0.175 
        -0.187   0.247   0.207  -0.005  -0.662   0.311   0.001 
        -1.497   1.480   1.910   1.164  -0.136  -4.399   0.060 
x     :  0.002   0.001  -0.005   0.000  -0.005 
J#x   :  1.004  -2.411  -2.164   0.423   1.234   5.520  -0.075 
Ny    : -0.008   0.018   0.009  -0.012   0.004  -0.013   0.001 
dav   :  0.996  -2.394  -2.155   0.411   1.239   5.507  -0.074 
dav^  :  0.996  -2.394  -2.155   0.411   1.239   5.507  -0.074 
loop:  18
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  4900.218 847.789 705.124 / 1.375 0.005 0.001>)
targe-coordst: (#<room73b2-bottle-object #X667e2e8 room73b2-bottle  4900.0 850.0 700.0 / 0.0 0.0 0.0>)
vel-pos :  2.150   0.641  -5.114 
vel-rot : -0.001  -0.005 
vel-pos-norm :   5.585/  1.000
vel-rot-norm :   0.005/  0.017
angle :  -54.4   -15.0    22.3   -26.2    40.9    11.1   -44.2 
usrwei:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
ocost :  0.655   0.230   0.505   2.668   0.491   0.079 1288.992 
cost  :  0.581   0.209   0.611   2.758   0.512   0.161 1288.992 
weight:  1.000   1.000   0.621   0.266   0.662   0.861   0.001 
k     :  0.000 (manipulability:  0.033, gain:  0.001, limit:  0.100, len:7)
nspace:  0.025  -0.028   0.025  -0.060  -0.065  -0.007   0.000 
J     : -0.106  -0.294   0.267  -0.122  -0.000  -0.000  -0.000 
         0.560   0.277   0.404   0.230   0.123   0.129   0.000 
        -0.001  -0.338   0.303  -0.279  -0.035   0.000  -0.180 
        -0.005   0.684   0.703   0.560  -0.703   0.697  -0.000 
         0.001   0.729  -0.661   0.742   0.192   0.000   1.000 
J#t   : -3.644   0.797   3.774   2.096   2.399  -3.868  -0.039 
         0.916   0.404   0.853   0.226   0.630  -0.795  -0.008 
         2.375  -5.784  -4.314   0.642   2.683  12.211   0.162 
        -0.249   0.156   0.115   0.044  -0.412   0.711   0.004 
        -0.284  -1.598  -1.091   1.200   2.205   3.919   0.059 
x     :  0.002   0.001  -0.005  -0.001  -0.005 
J#x   : -1.028   2.221   2.042  -0.237  -1.030  -5.136  -0.068 
Ny    : -0.008   0.016   0.009  -0.010   0.004  -0.013   0.001 
dav   : -1.036   2.237   2.051  -0.248  -1.026  -5.149  -0.067 
dav^  : -1.036   2.237   2.051  -0.248  -1.026  -5.149  -0.067 
loop:  19
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  4900.164 847.923 705.034 / 1.287 0.004 -0.0>)
targe-coordst: (#<room73b2-bottle-object #X667e2e8 room73b2-bottle  4900.0 850.0 700.0 / 0.0 0.0 0.0>)
vel-pos :  1.969   0.739  -5.027 
vel-rot :  0.000  -0.004 
vel-pos-norm :   5.449/  1.000
vel-rot-norm :   0.004/  0.017
angle :  -55.4   -12.7    24.3   -26.5    39.8     5.9   -44.3 
usrwei:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
ocost :  0.581   0.209   0.611   2.758   0.512   0.161 1288.992 
cost  :  0.658   0.228   0.510   2.703   0.495   0.084 1288.992 
weight:  0.603   0.814   1.000   1.000   1.000   1.000   0.001 
k     :  0.000 (manipulability:  0.034, gain:  0.001, limit:  0.100, len:7)
nspace:  0.019  -0.027   0.030  -0.221  -0.095  -0.002   0.000 
J     : -0.154  -0.313   0.239  -0.135  -0.000  -0.000   0.000 
         0.549   0.256   0.407   0.234   0.125   0.129   0.000 
        -0.001  -0.329   0.312  -0.274  -0.019   0.000  -0.180 
        -0.004   0.632   0.755   0.504  -0.712   0.698  -0.000 
        -0.000   0.775  -0.616   0.764   0.103   0.000   1.000 
J#t   : -1.521  -3.497   0.269   3.537   2.849   3.222  -0.050 
         1.003  -0.406   0.347   0.570   1.268   0.881  -0.016 
        -2.201   4.588   5.050  -0.801  -2.344 -11.447   0.181 
        -0.192   0.247   0.210   0.004  -0.659   0.305   0.001 
        -1.422   1.264   1.711   1.229  -0.015  -3.907   0.062 
x     :  0.002   0.001  -0.005   0.000  -0.004 
J#x   :  0.830  -2.022  -1.801   0.371   1.048   4.598  -0.073 
Ny    : -0.008   0.018   0.010  -0.012   0.004  -0.014   0.001 
dav   :  0.822  -2.003  -1.791   0.359   1.053   4.584  -0.072 
dav^  :  0.822  -2.003  -1.791   0.359   1.053   4.584  -0.072 
loop:  20
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  4900.154 847.973 705.015 / 1.367 0.004 0.0>)
targe-coordst: (#<room73b2-bottle-object #X667e2e8 room73b2-bottle  4900.0 850.0 700.0 / 0.0 0.0 0.0>)
vel-pos :  1.972   0.559  -5.008 
vel-rot : -0.000  -0.004 
vel-pos-norm :   5.411/  1.000
vel-rot-norm :   0.004/  0.017
angle :  -54.6   -14.7    22.5   -26.1    40.9    10.5   -44.3 
usrwei:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
ocost :  0.658   0.228   0.510   2.703   0.495   0.084 1288.992 
cost  :  0.596   0.211   0.598   2.783   0.512   0.153 1288.992 
weight:  1.000   1.000   0.626   0.264   0.661   0.868   0.001 
k     :  0.000 (manipulability:  0.033, gain:  0.001, limit:  0.100, len:7)
nspace:  0.026  -0.029   0.024  -0.059  -0.065  -0.007   0.000 
J     : -0.111  -0.295   0.265  -0.123  -0.000  -0.000   0.000 
         0.559   0.276   0.404   0.231   0.124   0.129   0.000 
        -0.001  -0.336   0.305  -0.277  -0.033   0.000  -0.180 
        -0.004   0.681   0.707   0.556  -0.703   0.699   0.000 
         0.000   0.733  -0.658   0.743   0.182   0.000   1.000 
J#t   : -3.536   0.589   3.554   2.103   2.487  -3.352  -0.041 
         0.905   0.376   0.848   0.246   0.666  -0.743  -0.009 
         1.991  -5.074  -3.671   0.615   2.444  10.613   0.172 
        -0.254   0.182   0.134   0.034  -0.431   0.654   0.004 
        -0.418  -1.353  -0.880   1.193   2.127   3.390   0.062 
x     :  0.002   0.001  -0.005  -0.000  -0.004 
J#x   : -0.847   1.813   1.663  -0.182  -0.834  -4.177  -0.067 
Ny    : -0.008   0.016   0.009  -0.010   0.003  -0.014   0.001 
dav   : -0.855   1.830   1.672  -0.192  -0.831  -4.190  -0.067 
dav^  : -0.855   1.830   1.672  -0.192  -0.831  -4.190  -0.067 
loop:  21
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  4900.101 848.086 704.945 / 1.295 0.003 -7.161e-05>)
targe-coordst: (#<room73b2-bottle-object #X667e2e8 room73b2-bottle  4900.0 850.0 700.0 / 0.0 0.0 0.0>)
vel-pos :  1.830   0.618  -4.939 
vel-rot :  0.000  -0.003 
vel-pos-norm :   5.304/  1.000
vel-rot-norm :   0.003/  0.017
angle :  -55.5   -12.9    24.2   -26.3    40.1     6.3   -44.4 
usrwei:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
ocost :  0.596   0.211   0.598   2.783   0.512   0.153 1288.992 
cost  :  0.661   0.227   0.515   2.740   0.498   0.090 1288.992 
weight:  0.602   0.815   1.000   1.000   1.000   1.000   0.001 
k     :  0.000 (manipulability:  0.034, gain:  0.001, limit:  0.100, len:7)
nspace:  0.019  -0.026   0.031  -0.223  -0.095  -0.003   0.000 
J     : -0.150  -0.311   0.243  -0.134   0.000   0.000  -0.000 
         0.550   0.259   0.406   0.234   0.125   0.129  -0.000 
        -0.000  -0.328   0.312  -0.273  -0.020  -0.000  -0.180 
        -0.003   0.638   0.750   0.510  -0.710   0.700   0.000 
        -0.000   0.770  -0.622   0.761   0.110   0.000   1.000 
J#t   : -1.607  -3.259   0.509   3.482   2.729   2.652  -0.052 
         0.984  -0.307   0.416   0.525   1.209   0.684  -0.016 
        -1.910   3.797   4.312  -0.597  -1.920  -9.610   0.186 
        -0.197   0.246   0.210   0.014  -0.655   0.304   0.001 
        -1.326   0.997   1.468   1.299   0.135  -3.300   0.063 
x     :  0.002   0.001  -0.005   0.000  -0.003 
J#x   :  0.647  -1.607  -1.418   0.317   0.845   3.623  -0.070 
Ny    : -0.009   0.019   0.010  -0.013   0.004  -0.014   0.001 
dav   :  0.638  -1.588  -1.408   0.304   0.849   3.609  -0.070 
dav^  :  0.638  -1.588  -1.408   0.304   0.849   3.609  -0.070 
loop:  22
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  4900.096 848.142 704.895 / 1.358 0.003 0.0>)
targe-coordst: (#<room73b2-bottle-object #X667e2e8 room73b2-bottle  4900.0 850.0 700.0 / 0.0 0.0 0.0>)
vel-pos :  1.810   0.486  -4.890 
vel-rot : -0.000  -0.003 
vel-pos-norm :   5.237/  1.000
vel-rot-norm :   0.003/  0.017
angle :  -54.8   -14.5    22.8   -26.0    40.9     9.9   -44.5 
usrwei:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
ocost :  0.661   0.227   0.515   2.740   0.498   0.090 1288.992 
cost  :  0.612   0.213   0.584   2.808   0.512   0.144 1288.992 
weight:  1.000   1.000   0.631   0.263   0.661   0.874   0.001 
k     :  0.000 (manipulability:  0.033, gain:  0.001, limit:  0.100, len:7)
nspace:  0.027  -0.029   0.024  -0.059  -0.065  -0.006   0.000 
J     : -0.116  -0.297   0.263  -0.125  -0.000   0.000  -0.000 
         0.558   0.274   0.404   0.232   0.124   0.128   0.000 
        -0.001  -0.334   0.307  -0.276  -0.031   0.000  -0.180 
        -0.003   0.677   0.712   0.552  -0.703   0.701  -0.000 
         0.000   0.736  -0.655   0.744   0.172  -0.000   1.000 
J#t   : -3.408   0.331   3.288   2.118   2.604  -2.723  -0.044 
         0.901   0.333   0.829   0.269   0.712  -0.657  -0.010 
         1.537  -4.191  -2.876   0.562   2.106   8.625   0.180 
        -0.258   0.209   0.155   0.023  -0.451   0.595   0.003 
        -0.575  -1.051  -0.620   1.176   2.015   2.732   0.065 
x     :  0.002   0.000  -0.005  -0.000  -0.003 
J#x   : -0.660   1.386   1.269  -0.124  -0.622  -3.176  -0.066 
Ny    : -0.008   0.017   0.009  -0.010   0.003  -0.015   0.001 
dav   : -0.668   1.403   1.278  -0.134  -0.619  -3.191  -0.065 
dav^  : -0.668   1.403   1.278  -0.134  -0.619  -3.191  -0.065 
loop:  23
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  4900.049 848.234 704.83 / 1.303 0.002 -2.522e-05>)
targe-coordst: (#<room73b2-bottle-object #X667e2e8 room73b2-bottle  4900.0 850.0 700.0 / 0.0 0.0 0.0>)
vel-pos :  1.702   0.514  -4.826 
vel-rot :  0.000  -0.002 
vel-pos-norm :   5.143/  1.000
vel-rot-norm :   0.002/  0.017
angle :  -55.5   -13.1    24.1   -26.2    40.3     6.7   -44.5 
usrwei:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
ocost :  0.612   0.213   0.584   2.808   0.512   0.144 1288.992 
cost  :  0.663   0.225   0.521   2.778   0.502   0.096 1288.992 
weight:  0.601   0.816   1.000   1.000   1.000   1.000   0.001 
k     :  0.000 (manipulability:  0.033, gain:  0.001, limit:  0.100, len:7)
nspace:  0.019  -0.026   0.031  -0.225  -0.096  -0.003   0.000 
J     : -0.146  -0.309   0.246  -0.133   0.000   0.000   0.000 
         0.551   0.261   0.405   0.234   0.125   0.128   0.000 
        -0.000  -0.328   0.312  -0.273  -0.021  -0.000  -0.180 
        -0.002   0.645   0.744   0.517  -0.708   0.702   0.000 
        -0.000   0.764  -0.628   0.757   0.117   0.000   1.000 
J#t   : -1.715  -2.973   0.791   3.424   2.585   1.975  -0.053 
         0.962  -0.198   0.491   0.479   1.144   0.467  -0.016 
        -1.551   2.856   3.446  -0.383  -1.414  -7.439   0.191 
        -0.200   0.241   0.208   0.025  -0.648   0.311   0.002 
        -1.207   0.682   1.184   1.372   0.312  -2.587   0.065 
x     :  0.002   0.001  -0.005   0.000  -0.002 
J#x   :  0.460  -1.181  -1.028   0.260   0.632   2.629  -0.068 
Ny    : -0.009   0.020   0.011  -0.013   0.005  -0.015   0.001 
dav   :  0.451  -1.161  -1.017   0.247   0.637   2.614  -0.067 
dav^  :  0.451  -1.161  -1.017   0.247   0.637   2.614  -0.067 
loop:  24
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  4900.049 848.289 704.754 / 1.349 0.002 0.0>)
targe-coordst: (#<room73b2-bottle-object #X667e2e8 room73b2-bottle  4900.0 850.0 700.0 / 0.0 0.0 0.0>)
vel-pos :  1.669   0.424  -4.750 
vel-rot : -0.000  -0.002 
vel-pos-norm :   5.052/  1.000
vel-rot-norm :   0.002/  0.017
angle :  -55.0   -14.3    23.0   -25.9    40.9     9.3   -44.6 
usrwei:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
ocost :  0.663   0.225   0.521   2.778   0.502   0.096 1288.992 
cost  :  0.629   0.215   0.571   2.835   0.513   0.135 1288.992 
weight:  1.000   1.000   0.636   0.261   0.661   0.881   0.001 
k     :  0.000 (manipulability:  0.033, gain:  0.001, limit:  0.100, len:7)
nspace:  0.028  -0.030   0.023  -0.059  -0.065  -0.005   0.000 
J     : -0.121  -0.299   0.261  -0.126   0.000   0.000   0.000 
         0.557   0.273   0.403   0.233   0.125   0.128   0.000 
        -0.000  -0.332   0.308  -0.275  -0.029  -0.000  -0.180 
        -0.002   0.673   0.716   0.547  -0.702   0.702  -0.000 
         0.000   0.739  -0.652   0.745   0.162  -0.000   1.000 
J#t   : -3.268   0.036   2.990   2.141   2.749  -2.006  -0.045 
         0.902   0.276   0.797   0.294   0.765  -0.536  -0.011 
         1.040  -3.176  -1.966   0.482   1.675   6.331   0.187 
        -0.262   0.235   0.174   0.012  -0.471   0.540   0.003 
        -0.746  -0.706  -0.322   1.151   1.873   1.974   0.067 
x     :  0.002   0.000  -0.005  -0.000  -0.002 
J#x   : -0.476   0.961   0.879  -0.065  -0.406  -2.185  -0.064 
Ny    : -0.008   0.017   0.009  -0.010   0.002  -0.015   0.001 
dav   : -0.483   0.978   0.888  -0.076  -0.404  -2.200  -0.063 
dav^  : -0.483   0.978   0.888  -0.076  -0.404  -2.200  -0.063 
loop:  25
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  4900.013 848.361 704.682 / 1.311 0.002 8.094e-06>)
targe-coordst: (#<room73b2-bottle-object #X667e2e8 room73b2-bottle  4900.0 850.0 700.0 / 0.0 0.0 0.0>)
vel-pos :  1.590   0.433  -4.678 
vel-rot : -0.000  -0.002 
vel-pos-norm :   4.960/  1.000
vel-rot-norm :   0.002/  0.017
angle :  -55.5   -13.3    23.9   -26.0    40.5     7.1   -44.7 
usrwei:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
ocost :  0.629   0.215   0.571   2.835   0.513   0.135 1288.992 
cost  :  0.666   0.223   0.528   2.817   0.506   0.102 1288.992 
weight:  0.600   0.817   1.000   1.000   1.000   1.000   0.001 
k     :  0.000 (manipulability:  0.033, gain:  0.001, limit:  0.100, len:7)
nspace:  0.019  -0.026   0.032  -0.227  -0.097  -0.004   0.000 
J     : -0.141  -0.307   0.250  -0.132  -0.000  -0.000   0.000 
         0.553   0.264   0.404   0.235   0.126   0.128  -0.000 
        -0.000  -0.328   0.312  -0.272  -0.022   0.000  -0.180 
        -0.002   0.651   0.738   0.524  -0.706   0.703  -0.000 
         0.000   0.759  -0.634   0.754   0.124   0.000   1.000 
J#t   : -1.838  -2.661   1.092   3.368   2.428   1.245  -0.054 
         0.937  -0.088   0.566   0.435   1.079   0.250  -0.016 
        -1.148   1.838   2.521  -0.177  -0.872  -5.107   0.194 
        -0.202   0.232   0.202   0.036  -0.639   0.326   0.002 
        -1.075   0.343   0.882   1.442   0.500  -1.824   0.066 
x     :  0.002   0.000  -0.005  -0.000  -0.002 
J#x   :  0.282  -0.775  -0.660   0.206   0.427   1.689  -0.064 
Ny    : -0.010   0.020   0.011  -0.013   0.005  -0.015   0.001 
dav   :  0.273  -0.755  -0.649   0.193   0.432   1.674  -0.064 
dav^  :  0.273  -0.755  -0.649   0.193   0.432   1.674  -0.064 
loop:  26
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  4900.016 848.411 704.583 / 1.341 0.002 0.0>)
targe-coordst: (#<room73b2-bottle-object #X667e2e8 room73b2-bottle  4900.0 850.0 700.0 / 0.0 0.0 0.0>)
vel-pos :  1.552   0.378  -4.580 
vel-rot : -0.000  -0.002 
vel-pos-norm :   4.851/  1.000
vel-rot-norm :   0.002/  0.017
angle :  -55.2   -14.0    23.3   -25.8    41.0     8.8   -44.7 
usrwei:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
ocost :  0.666   0.223   0.528   2.817   0.506   0.102 1288.992 
cost  :  0.645   0.217   0.559   2.862   0.513   0.127 1288.992 
weight:  1.000   1.000   0.641   0.259   0.661   0.887   0.001 
k     :  0.000 (manipulability:  0.033, gain:  0.001, limit:  0.100, len:7)
nspace:  0.030  -0.030   0.022  -0.059  -0.065  -0.005   0.000 
J     : -0.125  -0.300   0.259  -0.128   0.000   0.000   0.000 
         0.557   0.272   0.403   0.234   0.125   0.128  -0.000 
        -0.000  -0.330   0.310  -0.274  -0.028  -0.000  -0.180 
        -0.002   0.670   0.720   0.544  -0.702   0.704  -0.000 
         0.000   0.742  -0.650   0.746   0.153   0.000   1.000 
J#t   : -3.134  -0.258   2.695   2.169   2.905  -1.289  -0.046 
         0.908   0.211   0.757   0.318   0.822  -0.397  -0.012 
         0.560  -2.152  -1.049   0.384   1.202   4.006   0.191 
        -0.263   0.256   0.189   0.002  -0.490   0.493   0.003 
        -0.912  -0.359  -0.023   1.119   1.719   1.206   0.068 
x     :  0.002   0.000  -0.005  -0.000  -0.002 
J#x   : -0.312   0.581   0.532  -0.014  -0.209  -1.300  -0.061 
Ny    : -0.007   0.017   0.009  -0.010   0.002  -0.016   0.001 
dav   : -0.319   0.597   0.541  -0.024  -0.207  -1.316  -0.061 
dav^  : -0.319   0.597   0.541  -0.024  -0.207  -1.316  -0.061 
loop:  27
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  4899.994 848.465 704.496 / 1.318 0.002 3.093e-05>)
targe-coordst: (#<room73b2-bottle-object #X667e2e8 room73b2-bottle  4900.0 850.0 700.0 / 0.0 0.0 0.0>)
vel-pos :  1.495   0.377  -4.494 
vel-rot : -0.000  -0.002 
vel-pos-norm :   4.751/  1.000
vel-rot-norm :   0.002/  0.017
angle :  -55.6   -13.4    23.8   -25.8    40.8     7.5   -44.8 
usrwei:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
ocost :  0.645   0.217   0.559   2.862   0.513   0.127 1288.992 
cost  :  0.670   0.222   0.533   2.856   0.510   0.107 1288.992 
weight:  0.599   0.818   1.000   1.000   1.000   1.000   0.001 
k     :  0.000 (manipulability:  0.033, gain:  0.001, limit:  0.100, len:7)
nspace:  0.019  -0.026   0.032  -0.228  -0.098  -0.004   0.000 
J     : -0.138  -0.305   0.253  -0.131   0.000   0.000  -0.000 
         0.554   0.267   0.403   0.235   0.126   0.128   0.000 
        -0.000  -0.327   0.312  -0.272  -0.023  -0.000  -0.180 
        -0.002   0.657   0.732   0.530  -0.703   0.705   0.000 
         0.000   0.753  -0.639   0.751   0.130   0.000   1.000 
J#t   : -1.955  -2.371   1.368   3.323   2.285   0.572  -0.055 
         0.915   0.008   0.630   0.398   1.023   0.064  -0.015 
        -0.765   0.899   1.679  -0.006  -0.380  -2.975   0.194 
        -0.203   0.221   0.195   0.046  -0.630   0.346   0.002 
        -0.950   0.032   0.608   1.501   0.669  -1.130   0.066 
x     :  0.001   0.000  -0.004  -0.000  -0.002 
J#x   :  0.136  -0.438  -0.357   0.159   0.256   0.918  -0.061 
Ny    : -0.010   0.021   0.011  -0.014   0.005  -0.016   0.001 
dav   :  0.126  -0.417  -0.346   0.145   0.261   0.903  -0.060 
dav^  :  0.126  -0.417  -0.346   0.145   0.261   0.903  -0.060 
loop:  28
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  4899.998 848.509 704.385 / 1.335 0.001 9.687e-05>)
targe-coordst: (#<room73b2-bottle-object #X667e2e8 room73b2-bottle  4900.0 850.0 700.0 / 0.0 0.0 0.0>)
vel-pos :  1.457   0.346  -4.382 
vel-rot : -0.000  -0.001 
vel-pos-norm :   4.631/  1.000
vel-rot-norm :   0.001/  0.017
angle :  -55.4   -13.9    23.5   -25.7    41.0     8.4   -44.9 
usrwei:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
ocost :  0.670   0.222   0.533   2.856   0.510   0.107 1288.992 
cost  :  0.660   0.218   0.550   2.891   0.514   0.121 1288.992 
weight:  1.000   1.000   0.645   0.257   0.661   0.892   0.001 
k     :  0.000 (manipulability:  0.032, gain:  0.001, limit:  0.100, len:7)
nspace:  0.031  -0.030   0.022  -0.059  -0.065  -0.004   0.000 
J     : -0.129  -0.301   0.258  -0.129  -0.000  -0.000   0.000 
         0.556   0.271   0.403   0.235   0.126   0.128  -0.000 
        -0.000  -0.328   0.311  -0.272  -0.026   0.000  -0.180 
        -0.001   0.668   0.722   0.541  -0.701   0.705  -0.000 
         0.000   0.744  -0.648   0.746   0.146   0.000   1.000 
J#t   : -3.031  -0.496   2.455   2.193   3.044  -0.699  -0.047 
         0.914   0.155   0.718   0.339   0.873  -0.271  -0.012 
         0.178  -1.308  -0.293   0.294   0.786   2.079   0.193 
        -0.263   0.270   0.199  -0.006  -0.503   0.461   0.002 
        -1.044  -0.072   0.225   1.089   1.584   0.570   0.069 
x     :  0.001   0.000  -0.004  -0.000  -0.001 
J#x   : -0.189   0.295   0.272   0.023  -0.059  -0.637  -0.058 
Ny    : -0.007   0.017   0.009  -0.010   0.001  -0.016   0.001 
dav   : -0.196   0.311   0.282   0.013  -0.058  -0.653  -0.058 
dav^  : -0.196   0.311   0.282   0.013  -0.058  -0.653  -0.058 
loop:  29
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  4899.987 848.551 704.284 / 1.324 0.001 4.525e-05>)
targe-coordst: (#<room73b2-bottle-object #X667e2e8 room73b2-bottle  4900.0 850.0 700.0 / 0.0 0.0 0.0>)
vel-pos :  1.414   0.342  -4.282 
vel-rot : -0.000  -0.001 
vel-pos-norm :   4.523/  1.000
vel-rot-norm :   0.001/  0.017
angle :  -55.6   -13.5    23.8   -25.7    41.0     7.7   -44.9 
usrwei:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
ocost :  0.660   0.218   0.550   2.891   0.514   0.121 1288.992 
cost  :  0.675   0.221   0.536   2.894   0.513   0.111 1288.992 
weight:  0.597   0.819   1.000   0.257   1.000   1.000   0.001 
k     :  0.000 (manipulability:  0.033, gain:  0.001, limit:  0.100, len:7)
nspace:  0.019  -0.025   0.033  -0.059  -0.098  -0.004   0.000 
J     : -0.135  -0.304   0.255  -0.130   0.000   0.000  -0.000 
         0.554   0.269   0.403   0.235   0.126   0.127   0.000 
        -0.000  -0.327   0.313  -0.271  -0.024   0.000  -0.180 
        -0.001   0.662   0.728   0.535  -0.702   0.706   0.000 
         0.000   0.749  -0.644   0.748   0.135  -0.000   1.000 
J#t   : -2.919  -0.870   2.009   2.131   3.504   0.611  -0.047 
         0.801   0.221   0.723   0.241   1.135  -0.004  -0.014 
        -0.507   0.256   1.085   0.073   0.013  -1.417   0.193 
        -0.216   0.233   0.195   0.035  -0.601   0.373   0.002 
        -1.266   0.408   0.617   0.998   1.408  -0.384   0.069 
x     :  0.001   0.000  -0.004  -0.000  -0.001 
J#x   :  0.005  -0.162  -0.139   0.079   0.192   0.427  -0.057 
Ny    : -0.006   0.016   0.009  -0.009  -0.000  -0.018   0.001 
dav   : -0.001  -0.146  -0.130   0.070   0.191   0.409  -0.056 
dav^  : -0.001  -0.146  -0.130   0.070   0.191   0.409  -0.056 
loop:  30
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  4899.988 848.585 704.17 / 1.331 0.001 7.252e-05>)
targe-coordst: (#<room73b2-bottle-object #X667e2e8 room73b2-bottle  4900.0 850.0 700.0 / 0.0 0.0 0.0>)
vel-pos :  1.383   0.324  -4.168 
vel-rot : -0.000  -0.001 
vel-pos-norm :   4.403/  1.000
vel-rot-norm :   0.001/  0.017
angle :  -55.6   -13.7    23.6   -25.6    41.1     8.1   -45.0 
usrwei:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
ocost :  0.675   0.221   0.536   2.894   0.513   0.111 1288.992 
cost  :  0.675   0.220   0.542   2.911   0.516   0.117 1288.992 
weight:  0.597   1.000   0.648   0.256   0.660   0.895   0.001 
k     :  0.000 (manipulability:  0.032, gain:  0.001, limit:  0.100, len:7)
nspace:  0.019  -0.031   0.022  -0.059  -0.065  -0.004   0.000 
J     : -0.131  -0.302   0.258  -0.129   0.000   0.000   0.000 
         0.555   0.271   0.402   0.236   0.126   0.127  -0.000 
        -0.000  -0.327   0.312  -0.271  -0.026  -0.000  -0.180 
        -0.001   0.668   0.723   0.541  -0.700   0.707   0.000 
         0.000   0.744  -0.649   0.745   0.142   0.000   1.000 
J#t   : -2.768  -0.941   2.141   2.400   2.950  -0.213  -0.045 
         0.864   0.201   0.737   0.300   0.957  -0.222  -0.013 
        -0.093  -0.720   0.209   0.192   0.553   0.851   0.193 
        -0.247   0.254   0.191   0.004  -0.525   0.454   0.002 
        -1.068   0.023   0.330   1.122   1.445   0.207   0.069 
x     :  0.001   0.000  -0.004  -0.000  -0.001 
J#x   : -0.097   0.098   0.107   0.063   0.010  -0.242  -0.055 
Ny    : -0.007   0.016   0.009  -0.009   0.001  -0.016   0.001 
dav   : -0.104   0.114   0.116   0.053   0.010  -0.258  -0.054 
dav^  : -0.104   0.114   0.116   0.053   0.010  -0.258  -0.054 
loop:  31
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  4899.985 848.624 703.964 / 1.327 0.002 5.184e-05>)
targe-coordst: (#<room73b2-bottle-object #X667e2e8 room73b2-bottle  4900.0 850.0 700.0 / 0.0 0.0 0.0>)
vel-pos :  1.347   0.318  -3.961 
vel-rot : -0.000  -0.002 
vel-pos-norm :   4.196/  1.000
vel-rot-norm :   0.002/  0.017
angle :  -55.7   -13.6    23.7   -25.5    41.2     7.9   -45.0 
usrwei:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
ocost :  0.675   0.220   0.542   2.911   0.516   0.117 1288.992 
cost  :  0.683   0.221   0.537   2.924   0.516   0.113 1288.992 
weight:  0.594   0.819   1.000   0.255   0.659   1.000   0.001 
k     :  0.000 (manipulability:  0.032, gain:  0.001, limit:  0.100, len:7)
nspace:  0.019  -0.025   0.033  -0.059  -0.065  -0.004   0.000 
J     : -0.133  -0.302   0.257  -0.130   0.000   0.000  -0.000 
         0.555   0.270   0.402   0.236   0.126   0.127  -0.000 
        -0.000  -0.326   0.313  -0.271  -0.025  -0.000  -0.180 
        -0.002   0.666   0.725   0.538  -0.700   0.707   0.000 
         0.000   0.746  -0.647   0.746   0.137  -0.000   1.000 
J#t   : -2.820  -0.887   2.137   2.338   3.057  -0.108  -0.045 
         0.844   0.211   0.749   0.302   0.982  -0.219  -0.013 
        -0.359  -0.109   0.751   0.114   0.239  -0.534   0.192 
        -0.243   0.252   0.188   0.000  -0.527   0.461   0.002 
        -1.161   0.235   0.515   1.099   1.333  -0.273   0.069 
x     :  0.001   0.000  -0.004  -0.000  -0.002 
J#x   :  0.004  -0.066  -0.048   0.042   0.058   0.137  -0.055 
Ny    : -0.006   0.016   0.009  -0.009  -0.000  -0.018   0.001 
dav   : -0.002  -0.050  -0.039   0.033   0.058   0.119  -0.054 
dav^  : -0.002  -0.050  -0.039   0.033   0.058   0.119  -0.054 
loop:  32
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  4899.988 848.643 703.854 / 1.329 0.002 6.029e-05>)
targe-coordst: (#<room73b2-bottle-object #X667e2e8 room73b2-bottle  4900.0 850.0 700.0 / 0.0 0.0 0.0>)
vel-pos :  1.329   0.313  -3.851 
vel-rot : -0.000  -0.002 
vel-pos-norm :   4.086/  1.000
vel-rot-norm :   0.002/  0.017
angle :  -55.7   -13.6    23.7   -25.5    41.2     8.0   -45.0 
usrwei:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
ocost :  0.683   0.221   0.537   2.924   0.516   0.113 1288.992 
cost  :  0.683   0.220   0.539   2.932   0.517   0.115 1288.992 
weight:  0.594   1.000   0.650   0.254   0.659   0.897   0.001 
k     :  0.000 (manipulability:  0.032, gain:  0.001, limit:  0.100, len:7)
nspace:  0.019  -0.031   0.021  -0.059  -0.065  -0.004   0.000 
J     : -0.132  -0.302   0.258  -0.129   0.000   0.000  -0.000 
         0.555   0.271   0.402   0.236   0.126   0.127  -0.000 
        -0.000  -0.326   0.313  -0.271  -0.025  -0.000  -0.180 
        -0.002   0.668   0.723   0.540  -0.700   0.707   0.000 
         0.000   0.744  -0.649   0.745   0.139   0.000   1.000 
J#t   : -2.741  -1.013   2.064   2.406   3.007  -0.016  -0.045 
         0.865   0.184   0.723   0.306   0.975  -0.176  -0.013 
        -0.207  -0.454   0.456   0.174   0.392   0.202   0.192 
        -0.246   0.258   0.193   0.002  -0.529   0.446   0.002 
        -1.108   0.114   0.410   1.116   1.394  -0.006   0.069 
x     :  0.001   0.000  -0.004  -0.000  -0.002 
J#x   : -0.005   0.011   0.016   0.008  -0.016  -0.050  -0.055 
Ny    : -0.007   0.016   0.009  -0.009   0.001  -0.016   0.001 
dav   : -0.012   0.027   0.025  -0.002  -0.016  -0.066  -0.054 
dav^  : -0.012   0.027   0.025  -0.002  -0.016  -0.066  -0.054 
loop:  33
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  4899.987 848.647 703.855 / 1.328 0.002 5.433e-05>)
targe-coordst: (#<room73b2-bottle-object #X667e2e8 room73b2-bottle  4900.0 850.0 700.0 / 0.0 0.0 0.0>)
vel-pos :  1.325   0.313  -3.852 
vel-rot : -0.000  -0.002 
vel-pos-norm :   4.085/  1.000
vel-rot-norm :   0.002/  0.017
angle :  -55.8   -13.6    23.7   -25.5    41.2     7.9   -45.0 
usrwei:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
ocost :  0.683   0.220   0.539   2.932   0.517   0.115 1288.992 
cost  :  0.684   0.221   0.537   2.932   0.517   0.114 1288.992 
weight:  0.594   0.819   1.000   1.000   1.000   1.000   0.001 
k     :  0.000 (manipulability:  0.032, gain:  0.001, limit:  0.100, len:7)
nspace:  0.019  -0.025   0.033  -0.232  -0.099  -0.004   0.000 
J     : -0.132  -0.302   0.257  -0.130   0.000   0.000   0.000 
         0.555   0.271   0.402   0.236   0.126   0.127   0.000 
        -0.000  -0.326   0.313  -0.271  -0.025  -0.000  -0.180 
        -0.002   0.667   0.724   0.539  -0.700   0.707   0.000 
         0.000   0.745  -0.648   0.745   0.138  -0.000   1.000 
J#t   : -2.110  -1.999   1.722   3.287   2.093  -0.312  -0.054 
         0.889   0.127   0.704   0.355   0.953  -0.162  -0.015 
        -0.270  -0.303   0.605   0.175   0.282  -0.204   0.192 
        -0.201   0.204   0.181   0.060  -0.615   0.380   0.002 
        -0.790  -0.366   0.259   1.567   0.897  -0.234   0.065 
x     :  0.001   0.000  -0.004  -0.000  -0.002 
J#x   :  0.017  -0.036  -0.024   0.017   0.001   0.047  -0.055 
Ny    : -0.010   0.021   0.011  -0.014   0.005  -0.015   0.001 
dav   :  0.007  -0.015  -0.013   0.003   0.006   0.032  -0.054 
dav^  :  0.007  -0.015  -0.013   0.003   0.006   0.032  -0.054 
loop:  34
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  4899.988 848.647 703.855 / 1.329 0.002 5.717e-05>)
targe-coordst: (#<room73b2-bottle-object #X667e2e8 room73b2-bottle  4900.0 850.0 700.0 / 0.0 0.0 0.0>)
vel-pos :  1.325   0.312  -3.852 
vel-rot : -0.000  -0.002 
vel-pos-norm :   4.085/  1.000
vel-rot-norm :   0.002/  0.017
angle :  -55.7   -13.6    23.7   -25.5    41.2     8.0   -45.0 
usrwei:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
ocost :  0.684   0.221   0.537   2.932   0.517   0.114 1288.992 
cost  :  0.684   0.220   0.538   2.932   0.517   0.115 1288.992 
weight:  1.000   1.000   0.650   0.254   0.659   0.897   0.001 
k     :  0.000 (manipulability:  0.032, gain:  0.001, limit:  0.100, len:7)
nspace:  0.033  -0.031   0.021  -0.059  -0.065  -0.004   0.000 
J     : -0.132  -0.302   0.257  -0.129  -0.000  -0.000   0.000 
         0.555   0.271   0.402   0.236   0.126   0.127   0.000 
        -0.000  -0.326   0.313  -0.271  -0.025   0.000  -0.180 
        -0.002   0.667   0.723   0.540  -0.700   0.707   0.000 
         0.000   0.745  -0.649   0.745   0.139   0.000   1.000 
J#t   : -2.920  -0.754   2.197   2.233   3.193  -0.080  -0.046 
         0.925   0.090   0.671   0.363   0.925  -0.127  -0.012 
        -0.251  -0.362   0.531   0.153   0.366   0.028   0.192 
        -0.263   0.284   0.207  -0.014  -0.515   0.434   0.002 
        -1.194   0.250   0.493   1.043   1.452  -0.107   0.068 
x     :  0.001   0.000  -0.004  -0.000  -0.002 
J#x   :  0.004  -0.009  -0.002   0.009  -0.006  -0.002  -0.055 
Ny    : -0.007   0.016   0.009  -0.010   0.001  -0.016   0.001 
dav   : -0.003   0.008   0.007  -0.001  -0.005  -0.019  -0.054 
dav^  : -0.003   0.008   0.007  -0.001  -0.005  -0.019  -0.054 
loop:  35
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  4899.987 848.647 703.855 / 1.328 0.002 5.566e-05>)
targe-coordst: (#<room73b2-bottle-object #X667e2e8 room73b2-bottle  4900.0 850.0 700.0 / 0.0 0.0 0.0>)
vel-pos :  1.325   0.313  -3.852 
vel-rot : -0.000  -0.002 
vel-pos-norm :   4.085/  1.000
vel-rot-norm :   0.002/  0.017
angle :  -55.7   -13.6    23.7   -25.5    41.2     8.0   -45.0 
usrwei:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
ocost :  0.684   0.220   0.538   2.932   0.517   0.115 1288.992 
cost  :  0.684   0.221   0.538   2.932   0.517   0.114 1288.992 
weight:  0.594   0.819   1.000   1.000   1.000   1.000   0.001 
k     :  0.000 (manipulability:  0.032, gain:  0.001, limit:  0.100, len:7)
nspace:  0.019  -0.025   0.033  -0.232  -0.099  -0.004   0.000 
J     : -0.132  -0.302   0.257  -0.129   0.000   0.000   0.000 
         0.555   0.271   0.402   0.236   0.126   0.127  -0.000 
        -0.000  -0.326   0.313  -0.271  -0.025   0.000  -0.180 
        -0.002   0.667   0.723   0.539  -0.700   0.707   0.000 
         0.000   0.745  -0.648   0.745   0.138  -0.000   1.000 
J#t   : -2.115  -1.987   1.733   3.285   2.088  -0.337  -0.054 
         0.888   0.130   0.706   0.353   0.952  -0.168  -0.015 
        -0.254  -0.339   0.573   0.180   0.299  -0.125   0.192 
        -0.201   0.203   0.181   0.061  -0.615   0.381   0.002 
        -0.785  -0.377   0.249   1.568   0.903  -0.209   0.065 
x     :  0.001   0.000  -0.004  -0.000  -0.002 
J#x   :  0.012  -0.026  -0.015   0.015  -0.004   0.024  -0.055 
Ny    : -0.010   0.021   0.011  -0.014   0.005  -0.015   0.001 
dav   :  0.002  -0.005  -0.004   0.001   0.002   0.009  -0.054 
dav^  :  0.002  -0.005  -0.004   0.001   0.002   0.009  -0.054 
loop:  36
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  4899.988 848.647 703.855 / 1.328 0.002 5.648e-05>)
targe-coordst: (#<room73b2-bottle-object #X667e2e8 room73b2-bottle  4900.0 850.0 700.0 / 0.0 0.0 0.0>)
vel-pos :  1.325   0.312  -3.852 
vel-rot : -0.000  -0.002 
vel-pos-norm :   4.085/  1.000
vel-rot-norm :   0.002/  0.017
angle :  -55.7   -13.6    23.7   -25.5    41.2     8.0   -45.0 
usrwei:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
ocost :  0.684   0.221   0.538   2.932   0.517   0.114 1288.992 
cost  :  0.684   0.221   0.538   2.932   0.517   0.115 1288.992 
weight:  1.000   1.000   0.650   0.254   0.659   0.897   0.001 
k     :  0.000 (manipulability:  0.032, gain:  0.001, limit:  0.100, len:7)
nspace:  0.033  -0.031   0.021  -0.059  -0.065  -0.004   0.000 
J     : -0.132  -0.302   0.257  -0.129  -0.000  -0.000  -0.000 
         0.555   0.271   0.402   0.236   0.126   0.127   0.000 
        -0.000  -0.326   0.313  -0.271  -0.025   0.000  -0.180 
        -0.002   0.667   0.723   0.540  -0.700   0.707   0.000 
         0.000   0.745  -0.649   0.745   0.139   0.000   1.000 
J#t   : -2.918  -0.760   2.191   2.234   3.197  -0.066  -0.046 
         0.926   0.089   0.670   0.363   0.926  -0.124  -0.012 
        -0.259  -0.343   0.548   0.151   0.354  -0.017   0.192 
        -0.263   0.284   0.208  -0.015  -0.515   0.433   0.002 
        -1.197   0.257   0.498   1.042   1.448  -0.122   0.068 
x     :  0.001   0.000  -0.004  -0.000  -0.002 
J#x   :  0.006  -0.014  -0.007   0.010  -0.002   0.011  -0.055 
Ny    : -0.007   0.016   0.009  -0.010   0.001  -0.016   0.001 
dav   : -0.001   0.002   0.002  -0.000  -0.001  -0.005  -0.054 
dav^  : -0.001   0.002   0.002  -0.000  -0.001  -0.005  -0.054 
loop:  37
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  4899.988 848.647 703.855 / 1.328 0.002 5.604e-05>)
targe-coordst: (#<room73b2-bottle-object #X667e2e8 room73b2-bottle  4900.0 850.0 700.0 / 0.0 0.0 0.0>)
vel-pos :  1.325   0.312  -3.852 
vel-rot : -0.000  -0.002 
vel-pos-norm :   4.085/  1.000
vel-rot-norm :   0.002/  0.017
angle :  -55.7   -13.6    23.7   -25.5    41.2     8.0   -45.0 
usrwei:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
ocost :  0.684   0.221   0.538   2.932   0.517   0.115 1288.992 
cost  :  0.684   0.221   0.538   2.932   0.517   0.114 1288.992 
weight:  0.594   0.819   1.000   1.000   1.000   1.000   0.001 
k     :  0.000 (manipulability:  0.032, gain:  0.001, limit:  0.100, len:7)
nspace:  0.019  -0.025   0.033  -0.232  -0.099  -0.004   0.000 
J     : -0.132  -0.302   0.257  -0.129   0.000   0.000   0.000 
         0.555   0.271   0.402   0.236   0.126   0.127  -0.000 
        -0.000  -0.326   0.313  -0.271  -0.025  -0.000  -0.180 
        -0.002   0.667   0.723   0.539  -0.700   0.707   0.000 
         0.000   0.745  -0.648   0.745   0.139   0.000   1.000 
J#t   : -2.117  -1.984   1.736   3.284   2.087  -0.344  -0.054 
         0.888   0.131   0.707   0.353   0.951  -0.169  -0.015 
        -0.249  -0.351   0.564   0.183   0.303  -0.102   0.191 
        -0.201   0.203   0.181   0.061  -0.615   0.381   0.002 
        -0.784  -0.381   0.246   1.569   0.905  -0.201   0.065 
x     :  0.001   0.000  -0.004  -0.000  -0.002 
J#x   :  0.011  -0.023  -0.012   0.014  -0.005   0.018  -0.055 
Ny    : -0.010   0.021   0.011  -0.014   0.005  -0.015   0.001 
dav   :  0.001  -0.001  -0.001   0.000   0.000   0.003  -0.054 
dav^  :  0.001  -0.001  -0.001   0.000   0.000   0.003  -0.054 
loop:  38
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  4899.988 848.647 703.855 / 1.328 0.002 5.627e-05>)
targe-coordst: (#<room73b2-bottle-object #X667e2e8 room73b2-bottle  4900.0 850.0 700.0 / 0.0 0.0 0.0>)
vel-pos :  1.325   0.312  -3.852 
vel-rot : -0.000  -0.002 
vel-pos-norm :   4.085/  1.000
vel-rot-norm :   0.002/  0.017
angle :  -55.7   -13.6    23.7   -25.5    41.2     8.0   -45.0 
usrwei:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
ocost :  0.684   0.221   0.538   2.932   0.517   0.114 1288.992 
cost  :  0.684   0.221   0.538   2.933   0.517   0.114 1288.992 
weight:  1.000   1.000   0.650   0.254   0.659   0.897   0.001 
k     :  0.000 (manipulability:  0.032, gain:  0.001, limit:  0.100, len:7)
nspace:  0.033  -0.031   0.021  -0.059  -0.065  -0.004   0.000 
J     : -0.132  -0.302   0.257  -0.129  -0.000  -0.000   0.000 
         0.555   0.271   0.402   0.236   0.126   0.127   0.000 
        -0.000  -0.326   0.313  -0.271  -0.025  -0.000  -0.180 
        -0.002   0.667   0.723   0.540  -0.700   0.707  -0.000 
         0.000   0.745  -0.648   0.745   0.139   0.000   1.000 
J#t   : -2.917  -0.762   2.189   2.234   3.198  -0.062  -0.046 
         0.926   0.088   0.669   0.364   0.927  -0.123  -0.013 
        -0.261  -0.338   0.553   0.150   0.351  -0.031   0.192 
        -0.263   0.284   0.208  -0.015  -0.515   0.433   0.002 
        -1.197   0.259   0.500   1.042   1.447  -0.126   0.068 
x     :  0.001   0.000  -0.004  -0.000  -0.002 
J#x   :  0.007  -0.016  -0.008   0.010  -0.001   0.015  -0.055 
Ny    : -0.007   0.016   0.009  -0.010   0.001  -0.016   0.001 
dav   : -0.000   0.001   0.001  -0.000  -0.000  -0.002  -0.054 
dav^  : -0.000   0.001   0.001  -0.000  -0.000  -0.002  -0.054 
loop:  39
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  4899.988 848.647 703.855 / 1.328 0.002 5.615e-05>)
targe-coordst: (#<room73b2-bottle-object #X667e2e8 room73b2-bottle  4900.0 850.0 700.0 / 0.0 0.0 0.0>)
vel-pos :  1.325   0.312  -3.852 
vel-rot : -0.000  -0.002 
vel-pos-norm :   4.085/  1.000
vel-rot-norm :   0.002/  0.017
angle :  -55.7   -13.6    23.7   -25.5    41.2     8.0   -45.0 
usrwei:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
ocost :  0.684   0.221   0.538   2.933   0.517   0.114 1288.992 
cost  :  0.684   0.221   0.538   2.933   0.517   0.114 1288.992 
weight:  0.594   0.819   1.000   1.000   1.000   1.000   0.001 
k     :  0.000 (manipulability:  0.032, gain:  0.001, limit:  0.100, len:7)
nspace:  0.019  -0.025   0.033  -0.232  -0.099  -0.004   0.000 
J     : -0.132  -0.302   0.257  -0.129  -0.000  -0.000  -0.000 
         0.555   0.271   0.402   0.236   0.126   0.127   0.000 
        -0.000  -0.326   0.313  -0.271  -0.025   0.000  -0.180 
        -0.002   0.667   0.723   0.539  -0.700   0.707  -0.000 
         0.000   0.745  -0.648   0.745   0.139   0.000   1.000 
J#t   : -2.117  -1.983   1.737   3.284   2.086  -0.346  -0.054 
         0.888   0.131   0.707   0.353   0.951  -0.170  -0.014 
        -0.247  -0.354   0.561   0.184   0.304  -0.096   0.191 
        -0.201   0.203   0.181   0.061  -0.615   0.381   0.002 
        -0.783  -0.382   0.245   1.569   0.905  -0.199   0.065 
x     :  0.001   0.000  -0.004  -0.000  -0.002 
J#x   :  0.010  -0.022  -0.011   0.014  -0.005   0.016  -0.055 
Ny    : -0.010   0.021   0.011  -0.014   0.005  -0.015   0.001 
dav   :  0.000  -0.000  -0.000   0.000   0.000   0.001  -0.054 
dav^  :  0.000  -0.000  -0.000   0.000   0.000   0.001  -0.054 
loop:  40
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  4899.988 848.647 703.855 / 1.328 0.002 5.622e-05>)
targe-coordst: (#<room73b2-bottle-object #X667e2e8 room73b2-bottle  4900.0 850.0 700.0 / 0.0 0.0 0.0>)
vel-pos :  1.325   0.312  -3.852 
vel-rot : -0.000  -0.002 
vel-pos-norm :   4.085/  1.000
vel-rot-norm :   0.002/  0.017
angle :  -55.7   -13.6    23.7   -25.5    41.2     8.0   -45.0 
usrwei:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
ocost :  0.684   0.221   0.538   2.933   0.517   0.114 1288.992 
cost  :  0.684   0.221   0.538   2.933   0.517   0.114 1288.992 
weight:  1.000   1.000   0.650   0.254   0.659   0.897   0.001 
k     :  0.000 (manipulability:  0.032, gain:  0.001, limit:  0.100, len:7)
nspace:  0.033  -0.031   0.021  -0.059  -0.065  -0.004   0.000 
J     : -0.132  -0.302   0.257  -0.129  -0.000  -0.000   0.000 
         0.555   0.271   0.402   0.236   0.126   0.127  -0.000 
        -0.000  -0.326   0.313  -0.271  -0.025   0.000  -0.180 
        -0.002   0.667   0.723   0.540  -0.700   0.707  -0.000 
         0.000   0.745  -0.648   0.745   0.139   0.000   1.000 
J#t   : -2.917  -0.762   2.189   2.234   3.198  -0.060  -0.046 
         0.926   0.088   0.669   0.364   0.927  -0.123  -0.013 
        -0.262  -0.336   0.555   0.150   0.350  -0.035   0.192 
        -0.263   0.284   0.208  -0.015  -0.515   0.433   0.002 
        -1.198   0.259   0.500   1.042   1.446  -0.127   0.068 
x     :  0.001   0.000  -0.004  -0.000  -0.002 
J#x   :  0.007  -0.016  -0.009   0.010  -0.001   0.016  -0.055 
Ny    : -0.007   0.016   0.009  -0.010   0.001  -0.016   0.001 
dav   : -0.000   0.000   0.000   0.000  -0.000  -0.000  -0.054 
dav^  : -0.000   0.000   0.000   0.000  -0.000  -0.000  -0.054 
loop:  41
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  4899.988 848.647 703.855 / 1.328 0.002 5.618e-05>)
targe-coordst: (#<room73b2-bottle-object #X667e2e8 room73b2-bottle  4900.0 850.0 700.0 / 0.0 0.0 0.0>)
vel-pos :  1.325   0.312  -3.852 
vel-rot : -0.000  -0.002 
vel-pos-norm :   4.085/  1.000
vel-rot-norm :   0.002/  0.017
angle :  -55.7   -13.6    23.7   -25.5    41.2     8.0   -45.0 
usrwei:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
ocost :  0.684   0.221   0.538   2.933   0.517   0.114 1288.992 
cost  :  0.684   0.221   0.538   2.933   0.517   0.114 1288.992 
weight:  0.594   0.819   1.000   0.254   1.000   1.000   0.001 
k     :  0.000 (manipulability:  0.032, gain:  0.001, limit:  0.100, len:7)
nspace:  0.019  -0.025   0.033  -0.059  -0.099  -0.004   0.000 
J     : -0.132  -0.302   0.257  -0.129  -0.000  -0.000  -0.000 
         0.555   0.271   0.402   0.236   0.126   0.127   0.000 
        -0.000  -0.326   0.313  -0.271  -0.025   0.000  -0.180 
        -0.002   0.667   0.723   0.539  -0.700   0.707   0.000 
         0.000   0.745  -0.648   0.745   0.139   0.000   1.000 
J#t   : -2.993  -0.692   2.174   2.111   3.416   0.198  -0.047 
         0.794   0.270   0.754   0.227   1.094  -0.112  -0.014 
        -0.296  -0.283   0.585   0.118   0.379  -0.063   0.192 
        -0.218   0.227   0.189   0.039  -0.590   0.391   0.003 
        -1.201   0.234   0.454   1.009   1.541   0.062   0.068 
x     :  0.001   0.000  -0.004  -0.000  -0.002 
J#x   :  0.007  -0.016  -0.009   0.009   0.000   0.018  -0.055 
Ny    : -0.006   0.016   0.009  -0.009  -0.000  -0.018   0.001 
dav   :  0.000  -0.000  -0.000   0.000   0.000   0.000  -0.054 
dav^  :  0.000  -0.000  -0.000   0.000   0.000   0.000  -0.054 
loop:  42
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  4899.988 848.647 703.855 / 1.328 0.002 5.620e-05>)
targe-coordst: (#<room73b2-bottle-object #X667e2e8 room73b2-bottle  4900.0 850.0 700.0 / 0.0 0.0 0.0>)
vel-pos :  1.325   0.312  -3.852 
vel-rot : -0.000  -0.002 
vel-pos-norm :   4.085/  1.000
vel-rot-norm :   0.002/  0.017
angle :  -55.7   -13.6    23.7   -25.5    41.2     8.0   -45.0 
usrwei:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
ocost :  0.684   0.221   0.538   2.933   0.517   0.114 1288.992 
cost  :  0.684   0.221   0.538   2.933   0.517   0.114 1288.992 
weight:  1.000   1.000   0.650   0.254   0.659   0.897   0.001 
k     :  0.000 (manipulability:  0.032, gain:  0.001, limit:  0.100, len:7)
nspace:  0.033  -0.031   0.021  -0.059  -0.065  -0.004   0.000 
J     : -0.132  -0.302   0.257  -0.129   0.000  -0.000  -0.000 
         0.555   0.271   0.402   0.236   0.126   0.127   0.000 
        -0.000  -0.326   0.313  -0.271  -0.025   0.000  -0.180 
        -0.002   0.667   0.723   0.539  -0.700   0.707   0.000 
         0.000   0.745  -0.648   0.745   0.139  -0.000   1.000 
J#t   : -2.917  -0.762   2.189   2.234   3.198  -0.060  -0.046 
         0.926   0.088   0.669   0.364   0.927  -0.122  -0.013 
        -0.262  -0.336   0.555   0.150   0.350  -0.036   0.192 
        -0.263   0.284   0.208  -0.015  -0.515   0.433   0.002 
        -1.198   0.259   0.501   1.042   1.446  -0.128   0.068 
x     :  0.001   0.000  -0.004  -0.000  -0.002 
J#x   :  0.007  -0.016  -0.009   0.010  -0.001   0.016  -0.055 
Ny    : -0.007   0.016   0.009  -0.010   0.001  -0.016   0.001 
dav   : -0.000   0.000   0.000   0.000  -0.000  -0.000  -0.054 
dav^  : -0.000   0.000   0.000   0.000  -0.000  -0.000  -0.054 
loop:  43
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  4899.988 848.647 703.855 / 1.328 0.002 5.619e-05>)
targe-coordst: (#<room73b2-bottle-object #X667e2e8 room73b2-bottle  4900.0 850.0 700.0 / 0.0 0.0 0.0>)
vel-pos :  1.325   0.312  -3.852 
vel-rot : -0.000  -0.002 
vel-pos-norm :   4.085/  1.000
vel-rot-norm :   0.002/  0.017
angle :  -55.7   -13.6    23.7   -25.5    41.2     8.0   -45.0 
usrwei:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
ocost :  0.684   0.221   0.538   2.933   0.517   0.114 1288.992 
cost  :  0.684   0.221   0.538   2.933   0.517   0.114 1288.992 
weight:  0.594   0.819   1.000   0.254   1.000   1.000   0.001 
k     :  0.000 (manipulability:  0.032, gain:  0.001, limit:  0.100, len:7)
nspace:  0.019  -0.025   0.033  -0.059  -0.099  -0.004   0.000 
J     : -0.132  -0.302   0.257  -0.129  -0.000  -0.000  -0.000 
         0.555   0.271   0.402   0.236   0.126   0.127  -0.000 
        -0.000  -0.326   0.313  -0.271  -0.025   0.000  -0.180 
        -0.002   0.667   0.723   0.539  -0.700   0.707   0.000 
         0.000   0.745  -0.648   0.745   0.139   0.000   1.000 
J#t   : -2.993  -0.692   2.174   2.111   3.416   0.197  -0.047 
         0.794   0.270   0.754   0.227   1.094  -0.112  -0.014 
        -0.296  -0.283   0.585   0.118   0.379  -0.063   0.192 
        -0.218   0.227   0.189   0.039  -0.590   0.391   0.003 
        -1.201   0.234   0.454   1.009   1.541   0.062   0.068 
x     :  0.001   0.000  -0.004  -0.000  -0.002 
J#x   :  0.007  -0.016  -0.009   0.009   0.000   0.018  -0.055 
Ny    : -0.006   0.016   0.009  -0.009  -0.000  -0.018   0.001 
dav   :  0.000  -0.000  -0.000   0.000   0.000   0.000  -0.054 
dav^  :  0.000  -0.000  -0.000   0.000   0.000   0.000  -0.054 
loop:  44
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  4899.988 848.647 703.855 / 1.328 0.002 5.619e-05>)
targe-coordst: (#<room73b2-bottle-object #X667e2e8 room73b2-bottle  4900.0 850.0 700.0 / 0.0 0.0 0.0>)
vel-pos :  1.325   0.312  -3.852 
vel-rot : -0.000  -0.002 
vel-pos-norm :   4.085/  1.000
vel-rot-norm :   0.002/  0.017
angle :  -55.7   -13.6    23.7   -25.5    41.2     8.0   -45.0 
usrwei:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
ocost :  0.684   0.221   0.538   2.933   0.517   0.114 1288.992 
cost  :  0.684   0.221   0.538   2.933   0.517   0.114 1288.992 
weight:  1.000   1.000   0.650   0.254   0.659   0.897   0.001 
k     :  0.000 (manipulability:  0.032, gain:  0.001, limit:  0.100, len:7)
nspace:  0.033  -0.031   0.021  -0.059  -0.065  -0.004   0.000 
J     : -0.132  -0.302   0.257  -0.129   0.000   0.000  -0.000 
         0.555   0.271   0.402   0.236   0.126   0.127  -0.000 
        -0.000  -0.326   0.313  -0.271  -0.025  -0.000  -0.180 
        -0.002   0.667   0.723   0.539  -0.700   0.707   0.000 
         0.000   0.745  -0.648   0.745   0.139  -0.000   1.000 
J#t   : -2.917  -0.762   2.189   2.234   3.198  -0.060  -0.046 
         0.926   0.088   0.669   0.364   0.927  -0.122  -0.013 
        -0.262  -0.336   0.555   0.150   0.349  -0.036   0.192 
        -0.263   0.284   0.208  -0.015  -0.515   0.433   0.002 
        -1.198   0.259   0.501   1.042   1.446  -0.128   0.068 
x     :  0.001   0.000  -0.004  -0.000  -0.002 
J#x   :  0.007  -0.016  -0.009   0.010  -0.001   0.016  -0.055 
Ny    : -0.007   0.016   0.009  -0.010   0.001  -0.016   0.001 
dav   :  0.000   0.000   0.000   0.000  -0.000  -0.000  -0.054 
dav^  :  0.000   0.000   0.000   0.000  -0.000  -0.000  -0.054 
loop:  45
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  4899.988 848.647 703.855 / 1.328 0.002 5.619e-05>)
targe-coordst: (#<room73b2-bottle-object #X667e2e8 room73b2-bottle  4900.0 850.0 700.0 / 0.0 0.0 0.0>)
vel-pos :  1.325   0.312  -3.852 
vel-rot : -0.000  -0.002 
vel-pos-norm :   4.085/  1.000
vel-rot-norm :   0.002/  0.017
angle :  -55.7   -13.6    23.7   -25.5    41.2     8.0   -45.0 
usrwei:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
ocost :  0.684   0.221   0.538   2.933   0.517   0.114 1288.992 
cost  :  0.684   0.221   0.538   2.933   0.517   0.114 1288.992 
weight:  1.000   0.819   1.000   0.254   1.000   1.000   0.001 
k     :  0.000 (manipulability:  0.032, gain:  0.001, limit:  0.100, len:7)
nspace:  0.033  -0.025   0.033  -0.059  -0.099  -0.004   0.000 
J     : -0.132  -0.302   0.257  -0.129  -0.000  -0.000   0.000 
         0.555   0.271   0.402   0.236   0.126   0.127  -0.000 
        -0.000  -0.326   0.313  -0.271  -0.025   0.000  -0.180 
        -0.002   0.667   0.723   0.539  -0.700   0.707  -0.000 
         0.000   0.745  -0.648   0.745   0.139   0.000   1.000 
J#t   : -3.206  -0.378   2.344   1.912   3.621   0.082  -0.049 
         0.850   0.187   0.709   0.280   1.040  -0.081  -0.013 
        -0.316  -0.252   0.601   0.099   0.399  -0.074   0.192 
        -0.233   0.250   0.201   0.025  -0.575   0.383   0.002 
        -1.287   0.360   0.522   0.929   1.623   0.015   0.067 
x     :  0.001   0.000  -0.004  -0.000  -0.002 
J#x   :  0.007  -0.017  -0.010   0.009  -0.000   0.018  -0.055 
Ny    : -0.007   0.016   0.010  -0.009   0.000  -0.018   0.001 
dav   :  0.000  -0.000  -0.000   0.000  -0.000   0.000  -0.054 
dav^  :  0.000  -0.000  -0.000   0.000  -0.000   0.000  -0.054 
loop:  46
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  4899.988 848.647 703.855 / 1.328 0.002 5.619e-05>)
targe-coordst: (#<room73b2-bottle-object #X667e2e8 room73b2-bottle  4900.0 850.0 700.0 / 0.0 0.0 0.0>)
vel-pos :  1.325   0.312  -3.852 
vel-rot : -0.000  -0.002 
vel-pos-norm :   4.085/  1.000
vel-rot-norm :   0.002/  0.017
angle :  -55.7   -13.6    23.7   -25.5    41.2     8.0   -45.0 
usrwei:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
ocost :  0.684   0.221   0.538   2.933   0.517   0.114 1288.992 
cost  :  0.684   0.221   0.538   2.933   0.517   0.114 1288.992 
weight:  1.000   1.000   0.650   0.254   1.000   0.897   0.001 
k     :  0.000 (manipulability:  0.032, gain:  0.001, limit:  0.100, len:7)
nspace:  0.033  -0.031   0.021  -0.059  -0.099  -0.004   0.000 
J     : -0.132  -0.302   0.257  -0.129  -0.000  -0.000   0.000 
         0.555   0.271   0.402   0.236   0.126   0.127   0.000 
        -0.000  -0.326   0.313  -0.271  -0.025   0.000  -0.180 
        -0.002   0.667   0.723   0.539  -0.700   0.707   0.000 
         0.000   0.745  -0.648   0.745   0.139   0.000   1.000 
J#t   : -3.090  -0.586   2.196   1.992   3.604   0.352  -0.048 
         0.875   0.139   0.671   0.294   1.045  -0.003  -0.013 
        -0.281  -0.316   0.556   0.124   0.394   0.009   0.192 
        -0.235   0.256   0.207   0.024  -0.581   0.367   0.002 
        -1.276   0.339   0.504   0.933   1.630   0.058   0.067 
x     :  0.001   0.000  -0.004  -0.000  -0.002 
J#x   :  0.007  -0.016  -0.009   0.010  -0.001   0.016  -0.055 
Ny    : -0.007   0.016   0.009  -0.010   0.001  -0.016   0.001 
dav   :  0.000  -0.000   0.000   0.000  -0.000  -0.000  -0.054 
dav^  :  0.000  -0.000   0.000   0.000  -0.000  -0.000  -0.054 
loop:  47
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  4899.988 848.647 703.855 / 1.328 0.002 5.619e-05>)
targe-coordst: (#<room73b2-bottle-object #X667e2e8 room73b2-bottle  4900.0 850.0 700.0 / 0.0 0.0 0.0>)
vel-pos :  1.325   0.312  -3.852 
vel-rot : -0.000  -0.002 
vel-pos-norm :   4.085/  1.000
vel-rot-norm :   0.002/  0.017
angle :  -55.7   -13.6    23.7   -25.5    41.2     8.0   -45.0 
usrwei:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
ocost :  0.684   0.221   0.538   2.933   0.517   0.114 1288.992 
cost  :  0.684   0.221   0.538   2.933   0.517   0.114 1288.992 
weight:  1.000   1.000   1.000   0.254   1.000   1.000   0.001 
k     :  0.000 (manipulability:  0.032, gain:  0.001, limit:  0.100, len:7)
nspace:  0.033  -0.031   0.033  -0.059  -0.099  -0.004   0.000 
J     : -0.132  -0.302   0.257  -0.129  -0.000   0.000  -0.000 
         0.555   0.271   0.402   0.236   0.126   0.127   0.000 
        -0.000  -0.326   0.313  -0.271  -0.025   0.000  -0.180 
        -0.002   0.667   0.723   0.539  -0.700   0.707   0.000 
         0.000   0.745  -0.648   0.745   0.139  -0.000   1.000 
J#t   : -3.192  -0.401   2.330   1.925   3.612   0.099  -0.049 
         0.843   0.198   0.716   0.274   1.044  -0.090  -0.013 
        -0.307  -0.268   0.592   0.107   0.393  -0.062   0.192 
        -0.242   0.265   0.210   0.016  -0.570   0.371   0.002 
        -1.300   0.382   0.535   0.917   1.631  -0.002   0.067 
x     :  0.001   0.000  -0.004  -0.000  -0.002 
J#x   :  0.008  -0.018  -0.010   0.010  -0.001   0.019  -0.055 
Ny    : -0.008   0.018   0.010  -0.010   0.001  -0.019   0.001 
dav   :  0.000  -0.000  -0.000   0.000  -0.000   0.000  -0.054 
dav^  :  0.000  -0.000  -0.000   0.000  -0.000   0.000  -0.054 
loop:  48
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  4899.988 848.647 703.855 / 1.328 0.002 5.619e-05>)
targe-coordst: (#<room73b2-bottle-object #X667e2e8 room73b2-bottle  4900.0 850.0 700.0 / 0.0 0.0 0.0>)
vel-pos :  1.325   0.312  -3.852 
vel-rot : -0.000  -0.002 
vel-pos-norm :   4.085/  1.000
vel-rot-norm :   0.002/  0.017
angle :  -55.7   -13.6    23.7   -25.5    41.2     8.0   -45.0 
usrwei:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
ocost :  0.684   0.221   0.538   2.933   0.517   0.114 1288.992 
cost  :  0.684   0.221   0.538   2.933   0.517   0.114 1288.992 
weight:  1.000   1.000   0.650   0.254   1.000   0.897   0.001 
k     :  0.000 (manipulability:  0.032, gain:  0.001, limit:  0.100, len:7)
nspace:  0.033  -0.031   0.021  -0.059  -0.099  -0.004   0.000 
J     : -0.132  -0.302   0.257  -0.129  -0.000  -0.000   0.000 
         0.555   0.271   0.402   0.236   0.126   0.127  -0.000 
        -0.000  -0.326   0.313  -0.271  -0.025   0.000  -0.180 
        -0.002   0.667   0.723   0.539  -0.700   0.707   0.000 
         0.000   0.745  -0.648   0.745   0.139   0.000   1.000 
J#t   : -3.090  -0.586   2.196   1.992   3.604   0.352  -0.048 
         0.875   0.139   0.671   0.294   1.045  -0.003  -0.013 
        -0.281  -0.316   0.556   0.124   0.394   0.009   0.192 
        -0.235   0.256   0.207   0.024  -0.581   0.367   0.002 
        -1.276   0.339   0.504   0.933   1.630   0.058   0.067 
x     :  0.001   0.000  -0.004  -0.000  -0.002 
J#x   :  0.007  -0.016  -0.009   0.010  -0.001   0.016  -0.055 
Ny    : -0.007   0.016   0.009  -0.010   0.001  -0.016   0.001 
dav   :  0.000  -0.000   0.000   0.000  -0.000  -0.000  -0.054 
dav^  :  0.000  -0.000   0.000   0.000  -0.000  -0.000  -0.054 
loop:  49
union-link-list: (:larm-shoulder-y :larm-shoulder-p :larm-shoulder-r :larm-elbow-p :larm-wrist-y :larm-wrist-r :larm-wrist-p)
move-target: (#<cascaded-coords #X7e323e8  4899.988 848.647 703.855 / 1.328 0.002 5.619e-05>)
targe-coordst: (#<room73b2-bottle-object #X667e2e8 room73b2-bottle  4900.0 850.0 700.0 / 0.0 0.0 0.0>)
vel-pos :  1.325   0.312  -3.852 
vel-rot : -0.000  -0.002 
vel-pos-norm :   4.085/  1.000
vel-rot-norm :   0.002/  0.017
angle :  -55.7   -13.6    23.7   -25.5    41.2     8.0   -45.0 
usrwei:  1.000   1.000   1.000   1.000   1.000   1.000   1.000 
ocost :  0.684   0.221   0.538   2.933   0.517   0.114 1288.992 
cost  :  0.684   0.221   0.538   2.933   0.517   0.114 1288.992 
weight:  1.000   1.000   1.000   0.254   1.000   1.000   0.001 
k     :  0.000 (manipulability:  0.032, gain:  0.001, limit:  0.100, len:7)
nspace:  0.033  -0.031   0.033  -0.059  -0.099  -0.004   0.000 
J     : -0.132  -0.302   0.257  -0.129   0.000  -0.000  -0.000 
         0.555   0.271   0.402   0.236   0.126   0.127  -0.000 
        -0.000  -0.326   0.313  -0.271  -0.025   0.000  -0.180 
        -0.002   0.667   0.723   0.539  -0.700   0.707   0.000 
         0.000   0.745  -0.648   0.745   0.139   0.000   1.000 
J#t   : -3.192  -0.401   2.330   1.925   3.612   0.099  -0.049 
         0.843   0.198   0.716   0.274   1.044  -0.090  -0.013 
        -0.307  -0.268   0.592   0.107   0.393  -0.062   0.192 
        -0.242   0.265   0.210   0.016  -0.570   0.371   0.002 
        -1.300   0.382   0.535   0.917   1.631  -0.002   0.067 
x     :  0.001   0.000  -0.004  -0.000  -0.002 
J#x   :  0.008  -0.018  -0.010   0.010  -0.001   0.019  -0.055 
Ny    : -0.008   0.018   0.010  -0.010   0.001  -0.019   0.001 
dav   :  0.000  -0.000  -0.000   0.000  -0.000   0.000  -0.054 
dav^  :  0.000  -0.000  -0.000   0.000  -0.000   0.000  -0.054 
;; inverse-kinematics failed.
;; dif-pos : #f(1.32479 0.312458 -3.85177)/(4.0852/1)
;; dif-rot : #f(-5.619174e-05 -0.002231 0.0)/(0.002232/0.017453)
;;  coords : #<coordinates #X756df18  5000.0 250.0 550.0 / 1.571 0.0 0.0>
;;  angles : (-6.86932 -57.0012 -19.9991 -75.7242 77.2858 49.1445 -15.0728 0.0 -3.0 45.0 0.0 -110.0 0.0 0.0 0.0 0.0 0.0 0.0 -17.54 42.976 -25.435 0.0 0.0 20.6288 0.0 0.0 -17.54 42.976 -25.435 0.0 0.0 8.87905 0.0 -2.0 0.0 -2.0)
;;    args : ((#<room73b2-bottle-object #X667e2e8 room73b2-bottle  4900.0 850.0 700.0 / 0.0 0.0 0.0>) :move-target #<cascaded-coords #X7e323e8  4899.988 848.647 703.855 / 1.328 0.002 5.619e-05> :collision-avoidance-link-pair nil :link-list (#<bodyset-link #X77626f0 :larm-shoulder-y  4895.0 278.0 1110.0 / 0.598 6.893e-17 3.142> #<bodyset-link #X7781968 :larm-shoulder-p  4812.261 399.504 1110.0 / 0.598 -0.238 1.571> #<bodyset-link #X77ca708 :larm-shoulder-r  4797.801 389.658 1105.763 / -1.465 -1.097 2.113> #<bodyset-link #X77e1ec8 :larm-elbow-p  4794.646 518.026 890.439 / -2.761 0.638 -2.079> #<bodyset-link #X78095b0 :larm-wrist-y  4825.645 607.474 776.547 / -0.341 -0.098 -2.354> #<bodyset-link #X7814888 :larm-wrist-r  4856.772 673.912 704.256 / -0.242 5.619e-05 -0.788> #<bodyset-link #X7872508 :larm-wrist-p  4856.772 673.912 704.256 / 1.303 -1.569 0.025>) :link-list (#<bodyset-link #X77626f0 :larm-shoulder-y  4895.0 278.0 1110.0 / 0.598 6.893e-17 3.142> #<bodyset-link #X7781968 :larm-shoulder-p  4812.261 399.504 1110.0 / 0.598 -0.238 1.571> #<bodyset-link #X77ca708 :larm-shoulder-r  4797.801 389.658 1105.763 / -1.465 -1.097 2.113> #<bodyset-link #X77e1ec8 :larm-elbow-p  4794.646 518.026 890.439 / -2.761 0.638 -2.079> #<bodyset-link #X78095b0 :larm-wrist-y  4825.645 607.474 776.547 / -0.341 -0.098 -2.354> #<bodyset-link #X7814888 :larm-wrist-r  4856.772 673.912 704.256 / -0.242 5.619e-05 -0.788> #<bodyset-link #X7872508 :larm-wrist-p  4856.772 673.912 704.256 / 1.303 -1.569 0.025>) :move-target #<cascaded-coords #X7e323e8  4899.988 848.647 703.855 / 1.328 0.002 5.619e-05> :rotation-axis :z :debug-view t)
;; command : (let ((r (instance h7-robot :init))) (progn (send r :newcoords (make-coords :4x4 #2f((2.220446e-16 -1.0 0.0 5000.0) (1.0 2.220446e-16 0.0 250.0) (0.0 0.0 1.0 550.0) (0.0 0.0 0.0 1.0)))) (mapc #'(lambda (j a) (send* j :joint-angle a nil)) (list (send r :larm-shoulder-y) (send r :larm-shoulder-p) (send r :larm-shoulder-r) (send r :larm-elbow-p) (send r :larm-wrist-y) (send r :larm-wrist-r) (send r :larm-wrist-p) (send r :larm-finger1) (send r :rarm-shoulder-y) (send r :rarm-shoulder-p) (send r :rarm-shoulder-r) (send r :rarm-elbow-p) (send r :rarm-wrist-y) (send r :rarm-wrist-r) (send r :rarm-wrist-p) (send r :rarm-finger1) (send r :lleg-crotch-y) (send r :lleg-crotch-r) (send r :lleg-crotch-p) (send r :lleg-knee-p) (send r :lleg-ankle-p) (send r :lleg-ankle-r) (send r :lleg-toe) (send r :head-neck-p) (send r :rleg-crotch-y) (send r :rleg-crotch-r) (send r :rleg-crotch-p) (send r :rleg-knee-p) (send r :rleg-ankle-p) (send r :rleg-ankle-r) (send r :rleg-toe) (send r :head-neck-y) (send r :larm-finger2) (send r :larm-finger3) (send r :rarm-finger2) (send r :rarm-finger3)) '(-6.86932 -57.0012 -19.9991 -75.7242 77.2858 49.1445 -15.0728 0.0 -3.0 45.0 0.0 -110.0 0.0 0.0 0.0 0.0 0.0 0.0 -17.54 42.976 -25.435 0.0 0.0 20.6288 0.0 0.0 -17.54 42.976 -25.435 0.0 0.0 8.87905 0.0 -2.0 0.0 -2.0)) (objects (list r))) (send* r :inverse-kinematics (list (make-coords :pos #f(4900.0 850.0 700.0) :rot #2f((1.0 0.0 0.0) (0.0 1.0 0.0) (0.0 0.0 1.0))) :dump-command nil :debug-view t :move-target (let* ((p (send r :larm-wrist-p)) (c (make-cascoords :coords (send (send p :copy-worldcoords) :transform (make-cascoords :4x4 #2f((2.220446e-16 -1.619158e-16 1.0 0.0) (4.906539e-18 1.0 1.619158e-16 -5.684342e-14) (-1.0 4.906539e-18 2.220446e-16 -180.0) (0.0 0.0 0.0 1.0)))) :parent p))) c) :collision-avoidance-link-pair nil :link-list (list (send r :larm-shoulder-y) (send r :larm-shoulder-p) (send r :larm-shoulder-r) (send r :larm-elbow-p) (send r :larm-wrist-y) (send r :larm-wrist-r) (send r :larm-wrist-p)) :link-list (list (send r :larm-shoulder-y) (send r :larm-shoulder-p) (send r :larm-shoulder-r) (send r :larm-elbow-p) (send r :larm-wrist-y) (send r :larm-wrist-r) (send r :larm-wrist-p)) :move-target (let* ((p (send r :larm-wrist-p)) (c (make-cascoords :coords (send (send p :copy-worldcoords) :transform (make-cascoords :4x4 #2f((2.220446e-16 -1.619158e-16 1.0 0.0) (4.906539e-18 1.0 1.619158e-16 -5.684342e-14) (-1.0 4.906539e-18 2.220446e-16 -180.0) (0.0 0.0 0.0 1.0)))) :parent p))) c) :rotation-axis :z :debug-view t)))
;; dump debug command to /tmp/irtmodel-ik-9251/h7-robot-2012-11-20-21-26-19-failure.l
;; (progn (load "/tmp/irtmodel-ik-9251/h7-robot-2012-11-20-21-26-19-failure.l")(ik-setup)(ik-check))
nil
52.irteusgl$ #<room73b2-kettle-object #X5be3dd0 room73b2-kettle  4900.006 849.99 924.993 / -1.571 8.634e-06 -1.003e-05>
53.irteusgl$ nil
53.irteusgl$ 