# SPDX-License-Identifier: GPL-2.0
#
# Rockchip Clock specific Makefile
#

obj-y	+= clk.o
obj-y	+= clk-pll.o
obj-y	+= clk-cpu.o
obj-y	+= clk-half-divider.o
obj-y	+= clk-mmc-phase.o
obj-y	+= clk-muxgrf.o
obj-y	+= clk-ddr.o
obj-$(CONFIG_ROCKCHIP_CLK_INV)	+= clk-inverter.o
obj-$(CONFIG_ROCKCHIP_CLK_PVTM)	+= clk-pvtm.o
obj-$(CONFIG_ROCKCHIP_DCLK_DIV)	+= clk-dclk-divider.o
obj-$(CONFIG_RESET_CONTROLLER)	+= softrst.o

obj-$(CONFIG_CPU_RK3568)	+= clk-rk3568.o

obj-$(CONFIG_COMMON_CLK_ROCKCHIP_REGMAP)	+= regmap/
