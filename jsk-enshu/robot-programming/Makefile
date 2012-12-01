include common/Makefile.gen

#PC側でcompileのみする場合
all:
	(cd common/lib; make all)
	(cd standalone/arm; make all)
	(cd standalone/wheels; make all)
	(cd standalone/sensors; make all)
	(cd standalone/checkers; make all)
	(cd server/robot-server; make all)
	(cd server/vision-server; make all)
#	(cd client/robot-viewer; make all)
	(cd client/vision-viewer; make all)

#PC側のcompileおよび、SH側へのコピーまで一括で行う場合
#vision-serverはsh側でしかmakeできないので少し違う。
#また、vision-serverはデバッグ用にPCにUSBカメラを指した場合でも動くようになっているので
#その場合は、Makefile.pcでcompileする
#clientのプログラムはそもそもsh側にはないので、上の場合と同じ(copyはしない)
allcopy:
	ssh root@$(DAISYA_IP) '(mkdir -p ~/bin)'
	(cd common/lib; make all)
	(cd standalone/arm; make copy)
	(cd standalone/wheels; make copy)
	(cd standalone/sensors; make copy)
	(cd standalone/checkers; make copy)
	(cd server/robot-server; make copy)
#	(cd server/vision-server; make -f Makefile.pc all; make allcopy all)
	(cd server/vision-server; make copy)
#	(cd client/robot-viewer; make all)
	(cd client/vision-viewer; make all)
clean:
	rm -f *~
	(cd common/lib; make clean)
	(cd standalone/arm; make clean)
	(cd standalone/wheels; make clean)
	(cd standalone/sensors; make clean)
	(cd standalone/checkers; make clean)
	(cd server/robot-server; make clean)
	(cd server/vision-server; make clean)
	(cd client/robot-viewer; make clean)
	(cd client/vision-viewer; make clean)
