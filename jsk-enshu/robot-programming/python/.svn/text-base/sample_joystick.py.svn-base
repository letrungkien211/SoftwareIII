#!/usr/bin/python
# vim: set fileencoding=utf8 :

# Written by Takahiro OKUDA (03-100275)
# Licensed under the Creative Commons 表示 3.0 Unported License.
# http://creativecommons.org/licenses/by/3.0/

# joystick-sample.l の移植。

from robot_client import *
from joydirect import *


HOOK_POSE = [0, 20, -20, 90, -40]
GRASP_POSE = [0, 20, -20, 90, -80]
NEUTRAL_POSE = [0, 0, 0, 90, -40]

def init_joystick():
    global rs, vs
    rs = connect_robot_server()
    vs = connect_vision_server()
    rs.arm_poweron_vector([1, 1, 1, 1, 1])

def start_joystick_control():
    joydll.joyInit()
    joydll.joyUpdate()
    print "Start joystick control loop"
    def joystick_control(*args):
        st = joyGetState()
        axis = st["arrow1"]
        btn = st["button"]
        print "axis:", axis, "btn:", btn
        if axis[0] > 0.2:
            print "move right"
            rs.daisya_velocity_vector([0, -500, 0])
        elif axis[0] < 0.8:
            print "move left"
            rs.daisya_velocity_vector([0, 500, 0])
        elif axis[1] > -0.8:
            print "move forward"
            rs.daisya_velocity_vector([500, 0, 0])
        elif axis[1] < -0.2:
            print "move backward"
            rs.daisya_velocity_vector([-500, 0, 0])
        elif 7 in btn:
            print "turn left"
            rs.daisya_velocity_vector([0, 0, 200])
        elif 8 in btn:
            print "turn right"
            rs.daisya_velocity_vector([0, 0, -200])
        elif 1 in btn:
            print "move arm to hook-pose"
            rs.arm_angle_vector(HOOK_POSE, 1500)
            time.sleep(1.5)
        elif 2 in btn:
            print "move arm to grasp-pose"
            rs.arm_angle_vector(GRASP_POSE, 1000)
            time.sleep(1.0)
        elif 3 in btn:
            print "move arm to neutral-pose"
            rs.arm_angle_vector(NEUTRAL_POSE, 1000)
            time.sleep(1.0)
        else:
            rs.daisya_velocity_vector([0, 0, 0])
    do_until_key(joystick_control)
    rs.arm_poweron_vector([0, 0, 0, 0, 0])
    joydll.joyRumbleMagnitude(0)
    joydll.joyQuit()

print "joystick_sample.init_joystick()"
print "joystick_sample.start_joystick_control()"

