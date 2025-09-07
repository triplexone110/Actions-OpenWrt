#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more details.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# --- 基础设置 ---
# 1. 修改默认IP地址、主机名、时区
sed -i 's/192.168.1.1/192.168.6.2/g' package/base-files/files/bin/config_generate
sed -i 's/OpenWrt/ImmortalWrt-Pi4/g' package/base-files/files/bin/config_generate
sed -i "s/'UTC'/'CST-8'/g" package/base-files/files/bin/config_generate

# --- 插件源码 ---
# 2. 添加 SSR-Plus 软件源
git clone https://github.com/fw876/helloworld.git package/helloworld

# --- 软件包选择 ---
# 3. 自动选择您需要的软件包
# 注释掉的行 = 未选中, 去掉 # 号 = 选中
#
# A. 核心代理插件
sed -i 's/# CONFIG_PACKAGE_luci-app-ssr-plus is not set/CONFIG_PACKAGE_luci-app-ssr-plus=y/' .config
sed -i 's/# CONFIG_PACKAGE_luci-app-passwall is not set/CONFIG_PACKAGE_luci-app-passwall=y/' .config

# B. 磁盘与文件共享
sed -i 's/# CONFIG_PACKAGE_luci-app-samba4 is not set/CONFIG_PACKAGE_luci-app-samba4=y/' .config
sed -i 's/# CONFIG_PACKAGE_luci-app-minidlna is not set/CONFIG_PACKAGE_luci-app-minidlna=y/' .config
sed -i 's/# CONFIG_PACKAGE_luci-app-diskman is not set/CONFIG_PACKAGE_luci-app-diskman=y/' .config
sed -i 's/# CONFIG_PACKAGE_hd-idle is not set/CONFIG_PACKAGE_hd-idle=y/' .config

# C. 下载工具
sed -i 's/# CONFIG_PACKAGE_luci-app-qbittorrent is not set/CONFIG_PACKAGE_luci-app-qbittorrent=y/' .config
sed -i 's/# CONFIG_PACKAGE_luci-app-transmission is not set/CONFIG_PACKAGE_luci-app-transmission=y/' .config

# D. 主题 (默认主题会自动包含, 这里额外添加 Argon 主题)
sed -i 's/# CONFIG_PACKAGE_luci-theme-argon is not set/CONFIG_PACKAGE_luci-theme-argon=y/' .config

# E. 推荐的驱动 (旁路由建议使用)
sed -i 's/# CONFIG_PACKAGE_kmod-usb-net-rtl8152 is not set/CONFIG_PACKAGE_kmod-usb-net-rtl8152=y/' .config

echo "DIY script part 2 finished."
