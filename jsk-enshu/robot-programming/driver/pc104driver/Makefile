OVCAM_KVER := $(shell uname -r)
OVCAM_MAJMIN := $(shell echo $(OVCAM_KVER) | cut -d . -f 1-2)
SHTOPDIR = /mnt/flash

TOP = ../..
include ${TOP}/common/Makefile.gen

ifeq ($(OVCAM_MAJMIN),2.6)

ifneq ($(KERNELRELEASE),)
#
# Make rules for use from within 2.6 kbuild system
#
ARCH ?= sh
CROSS_COMPILE ?= sh-linux-
obj-m	+= pc104driver.o

pc104ctl-objs := pc104driver.o

else  # We were called from command line

KDIR	:= /home/jsk/yoshikai/prog/jikken/sh-linux-apps/sh2007/kernel/linux-sh-2.6.20.10
PWD	:= $(shell pwd)
all:
	$(MAKE) -C $(KDIR) M=$(PWD) modules

install:
	scp pc104driver.ko root@$(DAISYA_IP):/lib/modules/2.6.20.10/kernel/drivers/pc104driver.ko
#	$(MAKE) -C $(KDIR) M=$(PWD) modules_install

install_header:
	cp pc104driver.h $(SHTOPDIR)/usr/include/linux/

clean:
	rm -rf .*.cmd  *.mod.c *.ko *.o .tmp_versions Module.symvers *~ core *.i *.cmd
endif

endif
