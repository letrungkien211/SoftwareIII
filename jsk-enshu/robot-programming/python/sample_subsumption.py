#!/usr/bin/python
# vim: set fileencoding=utf8 :

# Written by Takahiro OKUDA (03-100275)
# Licensed under the Creative Commons 陦ｨ遉ｺ 3.0 Unported License.
# http://creativecommons.org/licenses/by/3.0/

from robot_client import *
from subsumption import *

print "sample_subsumption.demo(t, real)"
def demo(t = 200, real = False):

    if real:
        rs = connect_robot_server()
    else:
        rs = connect_robotsim_server()

    ts = []
    def action():
        rs.daisya_velocity_vector([-200, 0, 0])
    ts.append(SubsumptionTask(
        name = "Front bumper",
        priority = 90,
        check_func = lambda bmp: bmp[0] or bmp[5],
        action_func = action
    ))
    def action():
        rs.daisya_velocity_vector([200, 0, 0])
    ts.append(SubsumptionTask(
        name = "Back bumper",
        priority = 100,
        check_func = lambda bmp: bmp[2] or bmp[3],
        action_func = action
    ))
    s = Subsumption(ts, sensor_vector = [0] * 6, debug = True)

    rs.arm_poweron_vector([1] * 5)
    rs.arm_angle_vector([80, 20, 70, 0, 0], 1000)
    time.sleep(1.0)

    rs.daisya_velocity_vector([200, 0, 0])

    s.start_clients()
    def run(*args):
        bmp = rs.bumper_vector()
        print ";; bmp %s" % bmp
        s.sensor_vector = bmp
        time.sleep(t / 1000.0)
    do_until_key(run)
    s.stop_clients()
    
    rs.wheel_reset()
    rs.arm_angle_vector([0] * 5, 3000)
    time.sleep(3.0)
    rs.arm_poweron_vector([0] * 5)

