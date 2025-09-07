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

# 1. 修改默认IP地址、主机名、时区等
sed -i 's/192.168.1.1/192.168.6.2/g' package/base-files/files/bin/config_generate
sed -i 's/OpenWrt/ImmortalWrt-Pi4/g' package/base-files/files/bin/config_generate
sed -i "s/'UTC'/'CST-8'/g" package/base-files/files/bin/config_generate

# 2. 添加 SSR-Plus 软件源 (因为 .config 里选了它, 所以必须添加它的源码)
git clone https://github.com/fw876/helloworld.git package/helloworld

echo "DIY script part 2 finished."
