PWD=$(shell pwd)
KERNEL_OUT_DIR=$(PWD)/out
BOARD_ARCH=arm64
KERNEL_DIR=$(PWD)/..
BOARD_NAME=rk3568
CROSS_COMPILE= /home/topeet/code/rk356x_linux/prebuilts/gcc/linux-x86/aarch64/gcc-linaro-6.3.1-2017.05-x86_64_aarch64-linux-gnu/bin/aarch64-linux-gnu-
QEMU_DIR=$(PWD)/qemu

kernel-config:
	mkdir -p $(KERNEL_OUT_DIR)
	cp -f $(KERNEL_DIR)/arch/$(BOARD_ARCH)/configs/$(BOARD_NAME)_defconfig $(KERNEL_OUT_DIR)/.config
	make -C $(KERNEL_DIR) KBUILD_OUTPUT=$(KERNEL_OUT_DIR) ARCH=$(BOARD_ARCH) menuconfig
	cp -f $(KERNEL_OUT_DIR)/.config $(KERNEL_DIR)/arch/$(BOARD_ARCH)/configs/$(BOARD_NAME)_defconfig

kernel-build:
	mkdir -p $(KERNEL_OUT_DIR)
	intercept-build make -C $(KERNEL_DIR) CROSS_COMPILE=$(CROSS_COMPILE) KBUILD_OUTPUT=$(KERNEL_OUT_DIR) ARCH=$(BOARD_ARCH) $(BOARD_NAME)_defconfig
	intercept-build make -C $(KERNEL_DIR) CROSS_COMPILE=$(CROSS_COMPILE) KBUILD_OUTPUT=$(KERNEL_OUT_DIR) ARCH=$(BOARD_ARCH)
	cp -f $(PWD)/compile_commands.json $(KERNEL_DIR)/

.PHONY: run
run:
	mkdir -p $(QEMU_DIR)
	cp -f $(KERNEL_OUT_DIR)/arch/$(BOARD_ARCH)/boot/Image $(QEMU_DIR)/
	cp -f $(KERNEL_OUT_DIR)/arch/$(BOARD_ARCH)/boot/dts/rockchip/rk3568.dtb $(QEMU_DIR)/
	qemu-system-aarch64 -M virt -cpu cortex-a57 -nographic -kernel $(QEMU_DIR)/Image -dtb $(QEMU_DIR)/rk3568.dtb -s -S

.PHONY: image
image:
	mkdir -p $(QEMU_DIR)
	cp -f $(KERNEL_OUT_DIR)/arch/$(BOARD_ARCH)/boot/Image $(QEMU_DIR)/
	cp -f $(KERNEL_OUT_DIR)/arch/$(BOARD_ARCH)/boot/dts/rockchip/rk3568.dtb $(QEMU_DIR)/
	rm -f $(QEMU_DIR)/boot.img
	/home/topeet/code/rk356x_linux/rkbin/tools/mkimage -f $(QEMU_DIR)/.tmp_its  -E -p 0x800 $(QEMU_DIR)/boot.img
