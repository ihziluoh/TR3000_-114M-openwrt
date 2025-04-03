#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

# 修改 分区大小，默认 mod 分区大小为 112MB：0x7000000。改为 114MB：0x7200000
sed -i '/label = "ubi"/{n;s/reg = <0x5c0000 0x[0-9a-f]\+>/reg = <0x5c0000 0x7200000>/}' target/linux/mediatek/dts/mt7981b-cudy-tr3000-v1.dts 

# 修改默认ip地址 
sed -i 's/192.168.1.1/192.168.16.1/g' package/base-files/files/bin/config_generate

# Modify default theme
#sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# 修改主机名称
sed -i 's/OpenWrt/Cudy-TR3000/g' package/base-files/files/bin/config_generate
# 修改WIFI名称
sed -i 's/OpenWrt/TR3000/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh

# 修改默认 WiFi 密码
sed -i "/set wireless.default_radio\${devidx}.encryption=/c\        set wireless.default_radio\${devidx}.encryption='psk2'" package/kernel/mac80211/files/lib/wifi/mac80211.sh
sed -i "/set wireless.default_radio\${devidx}.key=/c\        set wireless.default_radio\${devidx}.key='123456'" package/kernel/mac80211/files/lib/wifi/mac80211.sh

# 修改时区
sed -i 's/UTC/Asia\/Shanghai/g' package/base-files/files/bin/config_generate
