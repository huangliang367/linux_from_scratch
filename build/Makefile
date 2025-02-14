PWD=$(shell pwd)
KERNEL_OUT_DIR=$(PWD)/out
BOARD_ARCH=arm64
KERNEL_DIR=$(PWD)/..
BOARD_NAME=rk3568
CROSS_COMPILE= /home/topeet/code/rk356x_linux/prebuilts/gcc/linux-x86/aarch64/gcc-linaro-6.3.1-2017.05-x86_64_aarch64-linux-gnu/bin/aarch64-linux-gnu-

kernel-config:
	mkdir -p $(KERNEL_OUT_DIR)
	cp -f $(KERNEL_DIR)/arch/$(BOARD_ARCH)/configs/$(BOARD_NAME)_defconfig $(KERNEL_OUT_DIR)/.config
	make -C $(KERNEL_DIR) KBUILD_OUTPUT=$(KERNEL_OUT_DIR) ARCH=$(BOARD_ARCH) menuconfig
	cp -f $(KERNEL_OUT_DIR)/.config $(KERNEL_DIR)/arch/$(BOARD_ARCH)/configs/$(BOARD_NAME)_defconfig

kernel-build:
	make -p $(KERNEL_OUT_DIR)
	make -C $(KERNEL_DIR) CROSS_COMPILE=$(CROSS_COMPILE) KBUILD_OUTPUT=$(KERNEL_OUT_DIR) ARCH=$(BOARD_ARCH) $(BOARD_NAME)_defconfig
	make -C $(KERNEL_DIR) CROSS_COMPILE=$(CROSS_COMPILE) KBUILD_OUTPUT=$(KERNEL_OUT_DIR) ARCH=$(BOARD_ARCH)