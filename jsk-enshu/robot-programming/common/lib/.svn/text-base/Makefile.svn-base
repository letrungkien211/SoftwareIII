TOP = ../..
include ${TOP}/common/Makefile.gen

SERVO_INCS = ../include/servo.h ../include/servo_mt.h
SENSER_INCS = ../include/sensor.h ../include/bumper.h ../include/psd.h
WHEEL_INCS = ../include/wheels.h ../include/wheels_kinematics.h
SOCKET_INCS = ../include/socket_functions.h ../include/multi_socket_functions.h ../include/interpreter.h
CFLAGS += -I${COMMON_INCLUDE_DIR} -I$(PC104_INCLUDE_DIR)
PC_CFLAGS += -I${COMMON_INCLUDE_DIR} -I$(PC104_INCLUDE_DIR)

all: pc sh

sh: makedir $(SERVO_OBJS) $(SENSOR_OBJS) $(WHEEL_OBJS) \
     $(WHEEL_KINEMATICS_OBJS) \
     $(SOCKET_SH_OBJS) $(ROBOT_OBJS)

pc: makedir $(SOCKET_PC_OBJS) $(ROBOT_PC_OBJS)

#objファイルの生成

#robotデバイス制御用関数
$(SH_OBJ_DIR)/servo.o: servo.c $(SERVO_INCS)
	$(CC) $(CFLAGS) -c -o $@ $<
$(SH_OBJ_DIR)/servo_mt.o: servo_mt.c $(SERVO_INCS)
	$(CC) $(CFLAGS) -c -o $@ $<
$(SH_OBJ_DIR)/bumper.o: bumper.c $(SENSOR_INCS)
	$(CC) $(CFLAGS) -c -o $@ $<
$(SH_OBJ_DIR)/psd.o: psd.c $(SENSOR_INCS)
	$(CC) $(CFLAGS) -c -o $@ $<
$(SH_OBJ_DIR)/sensor.o: sensor.c $(SENSOR_INCS)
	$(CC) $(CFLAGS) -c -o $@ $<
$(SH_OBJ_DIR)/wheels.o: wheels.c $(WHEEL_INCS)
	$(CC) $(CFLAGS) -c -o $@ $<
$(SH_OBJ_DIR)/wheels_kinematics.o: wheels_kinematics.c $(WHEEL_INCS)
	$(CC) $(CFLAGS) -c -o $@ $<
#
# socket通信(PC側/sh側両方兼用)
$(SH_OBJ_DIR)/socket_functions.o: socket_functions.c $(SOCKET_INCS)
	$(CC) $(CFLAGS) -c -o $@ $<
$(SH_OBJ_DIR)/multi_socket_functions.o: multi_socket_functions.c $(SOCKET_INCS)
	$(CC) $(CFLAGS) -c -o $@ $<
$(SH_OBJ_DIR)/interpreter.o: interpreter.c $(SOCKET_INCS)
	$(CC) $(CFLAGS) -c -o $@ $<
$(PC_OBJ_DIR)/socket_functions.o: socket_functions.c $(SOCKET_INCS)
	$(PC_CC) $(PC_CFLAGS) -c -o $@ $<
$(PC_OBJ_DIR)/multi_socket_functions.o: multi_socket_functions.c $(SOCKET_INCS)
	$(PC_CC) $(PC_CFLAGS) -c -o $@ $<
$(PC_OBJ_DIR)/interpreter.o: interpreter.c $(SOCKET_INCS)
	$(PC_CC) $(PC_CFLAGS) -c -o $@ $<
#
# robotstate(センサデータの定義)

#
# robotcommand(台車へ送る命令セット関数)
$(SH_OBJ_DIR)/command.o: command.c ../include/command.h
	$(CC) $(CFLAGS) -c -o $@ $<
$(SH_OBJ_DIR)/robot_state.o: robot_state.c ../include/robot_state.h
	$(CC) $(CFLAGS) -c -o $@ $<
$(SH_OBJ_DIR)/read_robot_state.o: read_robot_state.c ../include/read_robot_state.h
	$(CC) $(CFLAGS) -c -o $@ $<
$(PC_OBJ_DIR)/read_robot_state.o: read_robot_state.c ../include/read_robot_state.h
	$(PC_CC) $(PC_CFLAGS) -c -o $@ $<
$(PC_OBJ_DIR)/robot_state.o: robot_state.c ../include/robot_state.h
	$(PC_CC) $(PC_CFLAGS) -c -o $@ $<
$(PC_OBJ_DIR)/command.o: command.c ../include/command.h
	$(PC_CC) $(PC_CFLAGS) -c -o $@ $<

makedir:
	@mkdir -p sh
	@mkdir -p pc
clean:
	rm -f *.o *~ $(SH_OBJ_DIR)/*.o $(PC_OBJ_DIR)/*.o
