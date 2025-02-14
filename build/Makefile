KERNEL_OUT_DIR=out
BOARD_ARCH=arm64
KERNEL_DIR=..
BOARD_NAME=rk3568

kernel-config:
	mkdir -p $(KERNEL_OUT_DIR)
	cp -f $(KERNEL_DIR)/arch/$(BOARD_ARCH)/configs/$(BOARD_NAME)_defconfig $(KERNEL_OUT_DIR)/.config
	make -C $(KERNEL_DIR) KBUILD_OUTPUT=$(KERNEL_OUT_DIR) ARCH=$(BOARD_ARCH) menuconfig
	cp -f $(KERNEL_OUT_DIR)/.config $(KERNEL_DIR)/arch/$(BOARD_ARCH)/configs/$(BOARD_NAME)_defconfig
