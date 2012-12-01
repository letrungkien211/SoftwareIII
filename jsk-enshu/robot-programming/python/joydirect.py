#!/usr/bin/python
# vim: set fileencoding=utf8 :

# Written by Takahiro OKUDA (03-100275)
# Licensed under the Creative Commons 表示 3.0 Unported License.
# http://creativecommons.org/licenses/by/3.0/

# joydirect.l の移植。


import ctypes
import os
import pickle
import threading
import time
from robot_client import *


joydll = ctypes.cdll.LoadLibrary("%s/prog/jsk-enshu/robot-programming/driver/joystick/joy.so" % (os.getenv("HOME")))
joyInit = joydll.joyInit
joyUpdate = joydll.joyUpdate
joyQuit = joydll.joyQuit
joyGetXPos = joydll.joyGetXPos
joydll.joyGetXPos.restype = ctypes.c_double
joyGetYPos = joydll.joyGetYPos
joydll.joyGetYPos.restype = ctypes.c_double
joyGetZPos = joydll.joyGetZPos
joydll.joyGetZPos.restype = ctypes.c_double
joyGetXRot = joydll.joyGetXRot
joydll.joyGetXRot.restype = ctypes.c_double
joyGetYRot = joydll.joyGetYRot
joydll.joyGetYRot.restype = ctypes.c_double
joyGetZRot = joydll.joyGetZRot
joydll.joyGetZRot.restype = ctypes.c_double
joyGet0Sli = joydll.joyGet0Sli
joydll.joyGet0Sli.restype = ctypes.c_double
joyGet1Sli = joydll.joyGet1Sli
joydll.joyGet1Sli.restype = ctypes.c_double
joyGetPOV = joydll.joyGetPOV
joyGetButtons = joydll.joyGetButtons
joyGetAxis = joydll.joyGetAxis
joydll.joyGetAxis.restype = ctypes.c_double
joyForces = joydll.joyForces
joyRumbleMagnitude = joydll.joyRumbleMagnitude
joyRumbleEnvelope = joydll.joyRumbleEnvelope
joydll.joyRumbleEnvelope.argtypes = [
    ctypes.c_int,
    ctypes.c_double,
    ctypes.c_double,
    ctypes.c_double
]


def joyGetState():
    joydll.joyUpdate()
    x = joydll.joyGetXPos()
    y = joydll.joyGetYPos()
    z = joydll.joyGetZRot()
    v = joydll.joyGet0Sli()
    pov = joydll.joyGetPOV(0)
    b = []
    px = py = 0
    if pov >= 0:
        p = pov / 4500
        if p in [0, 1, 7]:
            py = 1
        elif p in [3, 4, 5]:
            py = -1
        if p in [1, 2, 3]:
            px = 1
        elif p in [5, 6, 7]:
            px = -1
    for i in range(12):
        if joydll.joyGetButtons(i) > 0:
            b.append(i + 1)
    return {
               "arrow1": [x, -y],
               "arrow2": [z, -v],
               "pov": [px, py],
               "button": b
           }

def tekkiGetState():
    a = []
    b = []
    joydll.joyUpdate()
    for i in range(11):
        a.append(joydll.joyGetAxis(i))
    for i in range(37):
        if joydll.joyGetButtons(i) > 0:
            b.append(i)
    return {
               "sight": [a[10], -a[9]],
               "rotation": [a[8]],
               "aiming": [a[7], -a[6]],
               "gear": [a[5]],
               "pedals": [a[4], a[3], a[2]],
               "tuner": [a[1], a[0]],
               "button": b
           }

def joyCalib():

    joydll.joyInit()
    joydll.joyUpdate()
    print "Calibrating a joystick for SNES like use:"

    ret = {}
    button_list = ["A", "B", "X", "Y", "L1", "L2", "R1", "R2", "Start", "Select"]

    old_r = joyGetState()
    for button in button_list:
        print "push %s key:" % button
        loop = True
        last_r = r = None
        while loop:
            time.sleep(0.01)
            r = joyGetState()
            get_button = r["button"]
            if old_r != r and last_r != r and get_button:
                ret[button] = get_button[0]
                loop = False
        last_r = r

    print "push any arrow key:"
    loop = True
    while loop:
        time.sleep(0.01)
        r = joyGetState()
        if old_r != r:
            for arrow in ["arrow1", "arrow2", "pov"]:
                if old_r[arrow] != r[arrow]:
                    ret["stick"] = arrow
                    break
            else:
                continue
            break

    pickle.dump(ret, open("joyCalib.dat", "w"))
    return ret

def joyReadCalib():
    if os.path.isfile("joyCalib.dat"):
        return pickle.load(open("joyCalib.dat"))
    return joyCalib()


class joydirect:
    
    def __init__(self):
        joydll.joyInit(0)
        joydll.joyUpdate()
        self.start_thread()

    def quit(self):
        joydll.joyQuit()

    def state(self):
        self.joy_data = joyGetState()
        return self.joy_data

    def get_state(self):
        return self.joy_data

    def start_thread(self):
        self.state_thread = True
        self.thread = threading.Thread(
            target = self.state_thread
        )

    def stop_thread(self):
        self.state_thread = False
        self.thread.join()
    
    def state_thread(self):
        time.sleep(1.0);
        while self.state_thread:
            self.state()
            time.sleep(0.01)

    def buttons(self):
        return self.joy_data['button']

    def button(self, num):
        btn = self.joy_data['button']
        return num in btn

    def read_data(self, name, num):
        data = self.joy_data[name]
        if num == 0:
            return data[0]
        elif num == 1:
            return data[1]
        else:
            raise NameError(
                      "Exception occured in the method %s of joystick." % name
                  )

    def arrow1(self, num):
        return self.read_data("arrow1", num)

    def arrow2(self, num):
        return self.read_data("arrow2", num)

    def pov(self, num):
        return self.send_data("pov", num)


def tekkidirect(joydirect):

    def state(self):
        self.joy_data = tekkiGetState()
        return self.joy_data

    def sight(self, num):
        return self.read_data("sight", num)

    def rotation(self, num):
        return self.read_data("rotation", num)

    def aiming(self, num):
        return self.read_data("aiming", num)

    def gear(self, num):
        return self.read_data("gear", num)

    def pedals(self, num):
        return self.read_data("pedals", num)

    def tuner(self, num):
        return self.read_data("tuner", num)



def test_joystick():
    joydll.joyInit(0)
    joydll.joyUpdate()
    for i in range(15):
        r = joyGetState()
        print r
        print r["button"]
        print 1 in r["button"]
        if 1 in r["button"]:
            joydll.joyRumbleEnvelope(8000, 0.1, 0.1, 0.6)
        if 2 in r["button"]:
            joydll.joyRumbleEnvelope(10000, 1.0, 1.0, 3.0)
        else:
            joydll.joyRumbleEnvelope(0, 0, 0, 0)
        time.sleep(1.0)
    joydll.joyRumbleMagnitude(0)
    joydll.joyQuit()

