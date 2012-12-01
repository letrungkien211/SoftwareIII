#!/usr/bin/python
# vim: set fileencoding=utf8 :

# Written by Takahiro OKUDA (03-100275)
# Licensed under the Creative Commons 表示 3.0 Unported License.
# http://creativecommons.org/licenses/by/3.0/

# sample-vision.l の移植。

from robot_client import *


print "sample_vision.demo()"

def demo(t = 500):
    width = 640.0
    rs = connect_robot_server()
    vs = connect_vision_server()
    rs.arm_poweron_vector([1, 0, 0, 0, 0])
    def go(*args):
        result = vs.result()["centroid"]
        print result
        angle = 40 * (result[0] - width * 0.5) / (width * 0.5)
        print angle
        rs.arm_angle_vector([angle, 0, 0, 0, 0], t)
        time.sleep(t / 1000.0)
    do_until_key(go)
    rs.arm_poweron_vector([0] * 5)

