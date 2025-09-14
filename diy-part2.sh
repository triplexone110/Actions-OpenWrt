#!/bin/bash
# Modify default IP and other settings
sed -i 's/192.168.1.1/192.168.6.2/g' package/base-files/files/bin/config_generate
sed -i 's/OpenWrt/ImmortalWrt-Pi4/g' package/base-files/files/bin/config_generate
sed -i "s/'UTC'/'CST-8'/g" package/base-files/files/bin/config_generate
