#!/bin/bash
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)

# ===== 网络配置 =====

# 修改默认 LAN IP
sed -i 's/192.168.1.1/192.168.10.1/g' package/base-files/files/bin/config_generate

# ===== 系统配置 =====

# 修改默认 hostname
sed -i 's/ImmortalWrt/R1S-H5/g' package/base-files/files/bin/config_generate 2>/dev/null || true

# 设置时区为上海
sed -i "s/'UTC'/'CST-8'\n\t\tset system.@system[-1].zonename='Asia/Shanghai'/" \
    package/base-files/files/bin/config_generate 2>/dev/null || true

# ===== 主题默认化 =====

# 将 argon 设为默认主题
if [ -d "package/lean/luci-theme-argon" ] || [ -d "feeds/luci/themes/luci-theme-argon" ]; then
    sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' \
        feeds/luci/collections/luci/Makefile 2>/dev/null || true
fi

# ===== 版本信息 =====

# 在 banner 中添加构建信息
cat >> package/base-files/files/etc/banner << 'EOF'

  +-------------------------------------------------+
  |  Device : NanoPi R1S-H5                        |
  |  Branch : ImmortalWrt 21.02                    |
  |  Build  : GitHub Actions                       |
  +-------------------------------------------------+
EOF

# ===== 开启 BBR =====
cat >> package/base-files/files/etc/sysctl.conf << 'EOF'

# TCP BBR 拥塞控制
net.core.default_qdisc=fq
net.ipv4.tcp_congestion_control=bbr
EOF

echo "diy-part2.sh completed."
