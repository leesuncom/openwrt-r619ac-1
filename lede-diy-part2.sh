#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate
echo '修改网关地址'
sed -i 's/192.168.1.1/192.168.10.1/g' package/base-files/files/bin/config_generate

echo '添加登录密码密文'
sed -i 's/root::0:0:99999:7:::/root:$1$V4UetPzk$CYXluq4wUazHjmCDBCqXF.:0:0:99999:7:::/g'  package/base-files/files/etc/shadow

echo '修改时区'
sed -i "s/'UTC'/'CST-8'\n        set system.@system[-1].zonename='Asia\/Shanghai'/g" package/base-files/files/bin/config_generate

echo '修改wifi设置，强制开启HT40'
cp -f $GITHUB_WORKSPACE/lede-mac80211.sh package/kernel/mac80211/files/lib/wifi/mac80211.sh
