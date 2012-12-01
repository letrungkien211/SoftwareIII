#!/usr/bin/python
# vim: set fileencoding=utf8 :

# Written by Takahiro OKUDA (03-100275)
# Licensed under the Creative Commons 表示 3.0 Unported License.
# http://creativecommons.org/licenses/by/3.0/

# vision-lib.l の移植。
# 動くかどうかはちょっと分からない。

import ctypes
import os
from robot_client import *


visionlib = ctypes.cdll.LoadLibrary("%s/prog/jsk-enshu/robot-programming/client/vision-viewer/visionlib.so" % (os.getenv("HOME")))
visionlib.init_vision.argtypes = [ctypes.c_char_p, ctypes.c_int]

print "vision_lib.test_eus_vision()"
def test_eus_vision():
    visionlib.init_vision(HOSTNAME, 9000)
    visionlib.init_facedetect()
    def proc(*args):
        visionlib.proc_vision()
        result = visionlib.detect_and_draw()
        print "facepos = ", result
        time.sleep(0.01)
    do_until_key(proc)

    visionlib.quit_vision()

