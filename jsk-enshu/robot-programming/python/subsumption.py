#!/usr/bin/python
# vim: set fileencoding=utf8 :

# Written by Takahiro OKUDA (03-100275)
# Licensed under the Creative Commons 表示 3.0 Unported License.
# http://creativecommons.org/licenses/by/3.0/

# subsumption.l の移植。

import threading
import time


sub_lock = threading.Lock()


class Subsumption:

    def __init__(self, c, debug = True, sensor_vector = None):
        self.owner = 0
        self.debug = debug
        self.sensor_vector = sensor_vector or ([0] * 6)
        self.clients = sorted(c, cmp = lambda x, y:cmp(y.priority, x.priority))
        for i in self.clients:
            i.main = self
            i.debug = debug
        self.print_clients()
        self.execute(self.clients[-1])

    def print_clients(self):
        print "%16s (%8s) %s" % ("name", "priority", "state")
        for i in self.clients:
            print "%16s (%8d) %s" % (i.name, i.priority, i.state)

    def execute(self, client):

        for i in self.clients:
            if i.state:
                return None
        if self.owner and client.priority < self.owner:
            return None
        
        if self.debug:
            print ">execute    %12s (%3d) / owner = %3d" % (
                      client.name, client.priority, self.owner
                  )

        self.owner = client.priority
        client.state = True

    def start_clients(self):
        for i in self.clients:
            i.thread_start()

    def stop_clients(self):
        for i in self.clients:
            i.thread_stop()


class SubsumptionTask:

    def __init__(
            self, name = "SubsumptionClient", priority = 100, debug = False,
            check_func = None, action_func = None
        ):
        self.name = name
        self.state = False
        self.check_func = check_func
        self.action_func = action_func
        self.loop = False
        self.priority = priority
        self.debug = debug

    def action(self):
        if self.action_func:
            self.action_func()
            time.sleep(1)

    def check(self, sensor_vector):
        if self.check_func:
            sub_lock.acquire()
            ret = self.check_func(sensor_vector)
            sub_lock.release()
            return ret
        return None

    def thread_start(self):
        if not self.loop:
            self.loop = True
            self.thr = threading.Thread(target = self.thread_loop).start()
        return self.thr

    def thread_loop(self):
        while self.loop:
            check = self.check(self.main.sensor_vector)
            owner = self.main.owner
            if check:
                self.main.execute(self)
            if self.debug:
                print ">thread_loop %12s (%3d) / state = %6s / sensor %s" % (
                          self.name, self.priority, self.state, check
                      )
            if self.state:
                self.action()
                self.state = False
                self.main.owner = owner
            time.sleep(0.1)

    def thread_stop(self):
        self.loop = False
        if self.thr:
            if self.debug:
                print ";; wait thread %s ..." % self.name
            self.thr.join()
            if self.debug:
                print "done %s" % self.name


