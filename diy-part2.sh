#!/bin/bash
# Install LuCI dependencies with force option
./scripts/feeds install -f luci luci-i18n-base-zh-cn
# Modify default IP and other settings
sed -i 's/192.168.1.1/192.168.6.2/g' package/base-files/files/bin/config_generate
sed -i 's/OpenWrt/ImmortalWrt-Pi4/g' package/base-files/files/bin/config_generate
sed -i "s/'UTC'/'CST-8'/g" package/base-files/files/bin/config_generate
