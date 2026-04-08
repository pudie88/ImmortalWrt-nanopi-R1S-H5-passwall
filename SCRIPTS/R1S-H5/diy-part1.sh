#!/bin/bash
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)

# 添加 passwall 软件源
sed -i '$a src-git passwall_packages https://github.com/xiaorouji/openwrt-passwall-packages;main' feeds.conf.default
sed -i '$a src-git passwall https://github.com/xiaorouji/openwrt-passwall;main' feeds.conf.default

# 添加 OpenList（原 AList）
# 如果 ImmortalWrt 源中没有 openlist，可从第三方 feed 引入
# sed -i '$a src-git openlist https://github.com/sbwml/luci-app-alist;main' feeds.conf.default

# 添加 helloworld（ShadowSocksR Plus+）如需保留可取消注释
# sed -i '$a src-git helloworld https://github.com/fw876/helloworld;master' feeds.conf.default
