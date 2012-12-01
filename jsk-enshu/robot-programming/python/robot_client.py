#!/usr/bin/python
# vim: set fileencoding=utf8 :

# Written by Takahiro OKUDA (03-100275)
# Licensed under the Creative Commons 表示 3.0 Unported License.
# http://creativecommons.org/licenses/by/3.0/

# 動作例は一番下にあります。

import functools
import math
import re
import socket
import threading
import time


# ロボットサーバのアドレス。
# 使用環境に応じて変更しなければならないのはここだけ。
HOSTNAME = "192.168.2.12"
# socket.recv で指定するバッファのサイズ。
# 横着しているので、できるだけ大きめに取ること。
BUFSIZE = 65536

# 定数群の定義。
PWM_CONTROL = 0
VELOCITY_CONTROL = 1
ANGLE_CONTROL = 2
INTERPOLATE_FINISH = 0
INTERPOLATE_LINEAR = 1
INTERPOLATE_MINJERK = 2
BLUE_THRESHOLD = [0, 200, 0, 200, 200, 255]
RED_THRESHOLD = [200, 255, 0, 200, 0, 200]
GREEN_THRESHOLD = [0, 200, 200, 255, 0, 200]
CYAN_THRESHOLD = [0, 200, 200, 255, 200, 255]
MAGENTA_THRESHOLD = [200, 255, 0, 200, 200, 255]
YELLOW_THRESHOLD = [200, 255, 200, 255, 0, 200]

# ソケット通信はロックを取得して行う。
socket_lock = threading.Lock()


# Lisp 形式 -> Python 形式 の変換を行う。
def lisp2python(vector):
    vector = vector.strip()
    if vector == "nil":
        return None
    elif vector == "t":
        return True
    try:
        return float(vector)
    except ValueError:
        match = re.compile("#f\((.*?)\)").match(vector)
        if match:
            return map(
                       lambda x: float(x),
                       match.groups()[0].strip().split(" ")
                   )
    return vector

# Python 形式 -> Lisp 形式 の変換を行う。
def python2lisp(vector):
    if isinstance(vector, list):
        return "#f(" + " ".join(
                   map(lambda x: str(x), vector)
               ) + ")"
    return str(vector)

# ViewClient.result 形式 -> Python 形式 の変換を行う。
# 複数のパラメータに対応した。
def vsresult2python(result):
    if not result:
        return {}
    ret = {}
    for m in re.compile(
                "\(:([-\w]+)((?: (?:#f\([-0-9\. ]*?\)|[-\w]+))*)\)"
             ).findall(result.strip()):
        ret[m[0]] = map(
                        lisp2python,
                        re.compile("(#f\(.*?\)|[-\w]+)").findall(m[1][1:])
                    )
    return ret


# ソケット通信を行う全てのクラスの基底となるクラス。
class SocketClient:

    def __init__(self, host = None, port = 5000):
        if host:
            self.connect(host, port)
        else:
            self.socket = None

    def __del__(self):
        self.close()

    def connect(self, host, port = 5000):
        self.socket = socket.socket(
                          socket.AF_INET,
                          socket.SOCK_STREAM
                      )
        self.socket.connect((host, port))
   
    def close(self):
        if self.socket and socket:
            self.socket.shutdown(socket.SHUT_RDWR)
            self.socket = None

    # コマンドを送信する。
    # returnval = True なら、返り値を待つ。
    def command(self, command, returnval = False):
        if not self.socket:
            return False
        socket_lock.acquire()
        self.socket.sendall(command + "\n")
        r = True
        if returnval:
            time.sleep(0.1)
            r = self.socket.recv(BUFSIZE)
        socket_lock.release()
        return r

    def command_with_vector(self, name, vector):
        vector.insert(0, name)
        self.command(" ".join(map(
            lambda x: str(x), vector
        )))


# robot-server のクライアントになるクラス。
class RobotClient(SocketClient):

    # 以下、（だいたい）API。
    def get_robot_state(self):
        return rs.command("get-robot-state", True)
    def get_robot_state_by_name(self, name):
        match = re.compile("\(%s (.*?) \)" % (name)).search(
                     self.get_robot_state()
                 )
        if not match:
            return []
        return map(
                   lambda x: float(x),
                   match.groups()[0].split(" ")[1:]
               )

    def psd_vector(self):
        return self.get_robot_state_by_name("psd-data")
    def bumper_vector(self):
        return self.get_robot_state_by_name("bumper-onoff")
    def get_wheels_angle(self):
        return self.get_robot_state_by_name("wheels-angle")
    def get_wheels_controlmode(self):
        return self.get_robot_state_by_name("wheels-control-mode")

    def wheel_controlmode_vector(self, vector):
        self.command_with_vector("wheel-controlmode-vector", vector[:])
    def wheel_angle_vector(self, vector, time):
        vector = vector[:]
        vector.append(time)
        self.command_with_vector("wheel-angle-vector", vector)
    def wheel_velocity_vector(self, vector):
        self.command_with_vector("wheel-velocity-vector", vector[:])
    def wheel_reset(self):
        self.command("wheel-reset")
    def daisya_velocity_vector(self, vector):
        self.command_with_vector("daisya-velocity-vector", vector[:])
    def arm_poweron_vector(self, vector):
        self.command_with_vector("servo-poweron-vector", vector[:])
    def arm_interpolation_method(self, im):
        self.command_with_vector("servo-interpolation-method", [im])
    def arm_angle_vector(self, vector, time = 1000):
        vector = vector[:]
        vector.append(time)
        self.command_with_vector("servo-angle-vector", vector)

    def wheel_velocity_pgain_vector(self, vector = False):
        if vector:
            self.command_with_vector(
                "set-wheel-velocity-pgain-vector",
                vector[:]
            )
        else:
            return lisp2python(self.command(
                       "get-wheel-velocity-pgain-vector", True
                   ))
    def wheel_velocity_dgain_vector(self, vector = False):
        if vector:
            self.command_with_vector(
                "set-wheel-velocity-dgain-vector",
                vector[:]
            )
        else:
            return lisp2python(self.command(
                       "get-wheel-velocity-dgain-vector", True
                   ))
    def wheel_velocity_igain_vector(self, vector = False):
        if vector:
            self.command_with_vector(
                "set-wheel-velocity-igain-vector",
                vector[:]
            )
        else:
            return lisp2python(self.command(
                       "get-wheel-velocity-igain-vector", True
                   ))
    def wheel_angle_pgain_vector(self, vector = False):
        if vector:
            self.command_with_vector(
                "set-wheel-angle-pgain-vector",
                vector[:]
            )
        else:
            return lisp2python(self.command(
                       "get-wheel-angle-pgain-vector", True
                   ))
    def wheel_angle_dgain_vector(self, vector = False):
        if vector:
            self.command_with_vector(
                "set-wheel-angle-dgain-vector",
                vector[:]
            )
        else:
            return lisp2python(self.command(
                       "get-wheel-angle-dgain-vector", True
                   ))
    def wheel_angle_igain_vector(self, vector = False):
        if vector:
            self.command_with_vector(
                "set-wheel-angle-igain-vector",
                vector[:]
            )
        else:
            return lisp2python(self.command(
                       "get-wheel-angle-igain-vector", True
                   ))

    def daisya_controlmode(self, mode):
        self.command_with_vector("daisya-controlmode", [mode])
    def daisya_position_vector(self, vector = False, time = 1000):
        if vector:
            vector = vector[:]
            vector[2] = math.radians(vector[2])
            vector.append(time)
            self.command_with_vector("set-daisya-position-vector", vector)
        else:
            ret = lisp2python(self.command("get-daisya-position-vector"))
            ret[2] = math.degrees(ret[2])
            return ret
    def daisya_position_pgain_vector(self, vector = False):
        if vector:
            self.command_with_vector(
                "set-daisya-position-pgain-vector",
                vector[:]
            )
        else:
            return lisp2python(self.command(
                       "get-daisya-position-pgain-vector", True
                   ))
    def daisya_reset(self):
        self.command("daisya-reset")


# vision-server のクライアントになるクラス。
class VisionClient(SocketClient):

    def __init__(self, host = None, port = 9000):
        SocketClient.__init__(self, host, port)

    def connect(self, host, port = 9000):
        SocketClient.connect(self, host, port)

    def result(self):
        if not self.socket:
            return False
        self.command("result")
        return vsresult2python(self.command("result", True))

    def color_threshold(self, cthre_vector = None):
        if cthre_vector:
            self.command_with_vector("color-threshold", cthre_vector[:])
            return cthre_vector
        else:
            return lisp2python(self.command(
                       "get-color-threshold", True
                   ))

    def displaylabel_num(self, dpn = None):
        if dpn:
            self.command_with_vector("set-displaylabel-num", [dpn])
        else:
            return lisp2python(self.command(
                       "get-displaylabel-num", True
                   ))

    def minimum_area_size(self, mas = None):
        if mas:
            self.command_with_vector("set-minarea", [mas])
        else:
            return lisp2python(self.command(
                       "get-minarea", True
                   ))


# robot-server-simulator のクライアントになるクラス。
class RobotSimClient(SocketClient):
    
    def __init__(self, host = "localhost", port = 5000):
        SocketClient.__init__(self, host, port)

    # 関数名の "_" を "-" に置換し、コマンドとして実行する。
    def __getattr__(self, name):
        if not name.startswith("__"):
            return functools.partial(self.command, name.replace("_", "-"))

    def command(self, *args):
        return lisp2python(SocketClient.command(
                   self,
                   "(send *sim* :" + " ".join(map(
                       lambda x: python2lisp(x),
                       args
                   )) + ")",
                   returnval = True
               ))

    def command_without_returnval(self, *args):
        SocketClient.command(
            self,
            "(send *sim* :" + " ".join(map(
                lambda x: python2lisp(x),
                args
            )) + ")"
        )

    def wheel_reset(self):
        self.command_without_returnval("wheel-reset")

    # VisionSimServer の役割を兼ねるための関数。
    def result(self):
        return vsresult2python(self.command("camera-vector"))


rs, vs = None, None

# 実機に接続する。
def connect_robot_server():
    global rs
    rs = RobotClient(HOSTNAME)
    return rs
def connect_vision_server():
    global vs
    vs = VisionClient(HOSTNAME)
    return vs

# シミュレーション環境に接続する。
def connect_robotsim_server():
    global rs
    rs = RobotSimClient()
    return rs
def connect_visionsim_server():
    global vs
    vs = RobotSimClient()
    return vs

# スレッドを用いた do-until-keys の実装。
def do_until_key(func, *args):
    def target(lock, args = args):
        while not lock.acquire(False):
            func(args)
    lock = threading.Lock()
    lock.acquire()
    thread = threading.Thread(target = target, args = (lock,))
    thread.start()
    raw_input()
    lock.release()
    thread.join()



# 以下、動作例。
if __name__ == "__main__":

    # 接続。
    # global変数の rs に代入される。
    # connect_robot_server()
    connect_robotsim_server()

    # 各状態量の出力。
    # 配列として表示される。
    print rs.psd_vector()
    print rs.bumper_vector()
    print rs.get_wheels_controlmode()

    # 以下の2つの出力は、シミュレーション環境では不可能。
#    print rs.wheel_velocity_pgain_vector()
#    print rs.daisya_position_vector()

    # サーボモータへの指令。
    # ベクトルは、配列として指定する。タプルは不可。
    rs.arm_poweron_vector([1, 0, 1, 0, 1])
    rs.arm_angle_vector([90, 0, 90, 0, 90], 2000)
    time.sleep(2.0)

    # 位置制御。
    rs.daisya_controlmode(ANGLE_CONTROL)
    rs.daisya_position_vector([0, 0, 90], 1000)
    time.sleep(1.0)
    rs.daisya_controlmode(VELOCITY_CONTROL)

    # do_until_key の使用。
    def go_and_back(args):
        bmp = rs.bumper_vector()
        if bmp[0] or bmp[5]:
            rs.daisya_velocity_vector([-200, 0, 0])
        elif bmp[2] or bmp[3]:
            rs.daisya_velocity_vector([200, 0, 0])
        elif bmp[1]:
            rs.daisya_velocity_vector([0, -200, 0])
        elif bmp[4]:
            rs.daisya_velocity_vector([0, 200, 0])
        time.sleep(0.01)
    rs.daisya_velocity_vector([200, 0, 0])
    do_until_key(go_and_back)

    rs.daisya_velocity_vector([0, 0, 0])
    rs.arm_poweron_vector([0, 0, 0, 0, 0])

    # 接続の切断。
    # デストラクタで行うので、実は明示的に行う必要はない。
    rs.close()

    print "end"

