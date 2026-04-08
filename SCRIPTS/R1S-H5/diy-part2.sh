#!/bin/bash
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)

# 修改默认 LAN IP
sed -i 's/192.168.1.1/192.168.10.1/g' package/base-files/files/bin/config_generate

# 修改默认 hostname
sed -i 's/ImmortalWrt/R1S-H5/g' package/base-files/files/bin/config_generate 2>/dev/null || true

# 开启 BBR
cat >> package/base-files/files/etc/sysctl.conf << 'EOF'
net.core.default_qdisc=fq
net.ipv4.tcp_congestion_control=bbr
EOF

echo "diy-part2.sh completed."
