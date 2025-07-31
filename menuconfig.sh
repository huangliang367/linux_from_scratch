#!/bin/bash
BOARD_ARCH=arm64
BOARD_NAME=rk3568
CROSS_COMPILE=/home/topeet/code/rk356x_linux/prebuilts/gcc/linux-x86/aarch64/gcc-linaro-6.3.1-2017.05-x86_64_aarch64-linux-gnu/bin/aarch64-linux-gnu-


intercept-build make CROSS_COMPILE=${CROSS_COMPILE} ARCH=${BOARD_ARCH} ${BOARD_NAME}_defconfig
intercept-build make CROSS_COMPILE=${CROSS_COMPILE} ARCH=${BOARD_ARCH} menuconfig
intercept-build make CROSS_COMPILE=${CROSS_COMPILE} ARCH=${BOARD_ARCH} -j$(nproc)

mkdir -p build/images
cp -f arch/${BOARD_ARCH}/boot/Image build/images/
cp -f arch/${BOARD_ARCH}/boot/dts/rockchip/rk3568.dtb build/images/
rm -f build/images/boot.img
/home/topeet/code/rk356x_linux/rkbin/tools/mkimage -f build/images/.tmp_its  -E -p 0x800 build/images/boot.img

