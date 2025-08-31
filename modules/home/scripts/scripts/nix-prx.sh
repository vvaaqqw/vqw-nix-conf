#!/usr/bin/env bash
# 文件名：set-nix-proxy.sh
# 作用：为 nix-daemon 配置 socks5 代理

set -e

PROXY="socks5h://localhost:7890"
UNIT_DIR="/run/systemd/system/nix-daemon.service.d"
OVERRIDE_FILE="${UNIT_DIR}/override.conf"

echo ">> 创建目录：${UNIT_DIR}"
sudo mkdir -p "${UNIT_DIR}"

echo ">> 写入代理配置到 ${OVERRIDE_FILE}"
sudo tee "${OVERRIDE_FILE}" >/dev/null <<EOF
[Service]
Environment="https_proxy=${PROXY}"
EOF

echo ">> 重新加载 systemd 配置"
sudo systemctl daemon-reload

echo ">> 重启 nix-daemon"
sudo systemctl restart nix-daemon

echo ">> nix-daemon 已应用代理 ${PROXY}"
