#!/usr/bin/python
# vim: set fileencoding=utf8 :

# Written by Takahiro OKUDA (03-100275)
# Licensed under the Creative Commons 表示 3.0 Unported License.
# http://creativecommons.org/licenses/by/3.0/

# sample-sim-real.l の移植。
# 関数名のハイフンがアンダーバーになっている以外はほぼ一緒。


# ライブラリの読み込み。
from robot_client import *

print "sample.demo()"
print "sample.demo(real = True)"

def demo(real = False):

    # 実機かシミュレータか、引数によって接続先を変更する。
    if real:
        rs = connect_robot_server()
    else:
        rs = connect_robotsim_server()
    
    # 制御モードを位置制御に変更する。
    rs.daisya_controlmode(ANGLE_CONTROL)

    # Enter が押されるまで続ける部分の定義。
    # def func(*args) として定義する。
    def go(*args):
        # bumper の状態を取得する。
        result = rs.bumper_vector()
        # bumper の状態を表示する。 print だけ。
        print "bumper_vector:", result
        # bumper の状態に応じて台車の挙動を変更する。
        if result[0] or result[5]:
            # 1秒かけてバック、回転する。
            rs.daisya_position_vector([-300, 0, 50], 1000)
            # 1秒休む。単位は Lisp と異なり、秒である。
            time.sleep(1.0)
        elif result[2] or result[3]:
            rs.daisya_position_vector([300, 0, 0], 1000)
            time.sleep(1.0)
        elif result[4]:
            rs.daisya_position_vector([0, 200, 0], 1000)
            time.sleep(1.0)
        elif result[1]:
            rs.daisya_position_vector([0, -200, 0], 1000)
            time.sleep(1.0)
        else:
            rs.daisya_position_vector([300, 0, 0], 1000)
            time.sleep(1.0)
    # do_until_key の実行。
    # do_until_key(func, arg1, arg2, ...)
    # arg1, arg2, ... を指定すると、func に args として渡される。
    do_until_key(go)

    # 制御モードを速度制御に戻し、速度も0にする。
    rs.daisya_controlmode(VELOCITY_CONTROL)
    rs.daisya_velocity_vector([0, 0, 0])


