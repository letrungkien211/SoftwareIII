#!/usr/bin/python
# vim: set fileencoding=utf8 :

# Written by Takahiro OKUDA (03-100275)
# Licensed under the Creative Commons 表示 3.0 Unported License.
# http://creativecommons.org/licenses/by/3.0/

# arm_kinematics.c の移植。


import math


L1 = 40
L2 = 50
L3 = 160
BASE_X = 0
BASE_Y = 0
BASE_Z = 20

def forward_kinematics_by_geometry(angles, position):
    position[0] = BASE_X + (
                      L1 + \
                      L2 * math.cos(math.radians(-angles[1])) + \
                      L3 * math.cos(math.radians(-(angles[1] + angles[2]))) \
                  ) * math.cos(math.radians(angles[0]))
    position[1] = BASE_Y + (
                      L1 + \
                      L2 * math.cos(math.radians(-angles[1])) + \
                      L3 * math.cos(math.radians(-(angles[1] + angles[2]))) \
                  ) * math.sin(math.radians(angles[0]))
    position[2] = BASE_Z - \
                  L2 * math.sin(math.radians(-angles[1])) - \
                  L3 * math.sin(math.radians(-(angles[1] + angles[2])))
    return True

def inverse_kinematics_by_geometry(position, angles):
    x, y, z = position[0] - BASE_X, position[1] - BASE_Y, position[2] - BASE_Z
    if x == 0:
        if y > 0:
            angles[0][0] = angles[1][0] = 90
        else:
            angles[0][0] = angles[1][0] = -90
    else:
        angles[0][0] = angles[1][0] = math.degrees(math.atan(y / x))
    yy = math.hypot(x, y) - L1
    ll = math.hypot(yy, z)
    th1 = -math.atan2(z, yy)
    tmp = (-L3 * L3 + (L2 * L2 + ll * ll)) / (2.0 * L2 * ll)
    if (abs(tmp) > 1.0):
        return 0
    th2 = math.acos(tmp)
    th3 = math.acos((-L2 * L2 + (L3 * L3 + ll * ll)) / (2.0 * L3 * ll))
    print th1, th2, th3
    angles[0][1] = -math.degrees(th1 + th2)
    angles[0][2] = math.degrees(th2 + th3)
    angles[1][1] = -math.degrees(th1 - th2)
    angles[1][2] = -math.degrees(th2 + th3)
    return 2

