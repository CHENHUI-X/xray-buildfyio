#!/bin/sh
set -e
: "${UUID:?UUID environment variable is required}"
WS_PATH="${WS_PATH:-/xray}"
PORT="${PORT:-8080}"
cat > /tmp/config.json <<JSONEOF
{
  "log": {"loglevel": "warning"},
  "inbounds": [
    {
      "port": ${PORT},
      "protocol": "vless",
      "settings": {
        "clients": [{"id": "${UUID}"}],
        "decryption": "none"
      },
      "streamSettings": {
        "network": "ws",
        "wsSettings": {"path": "${WS_PATH}"}
      }
    }
  ],
  "outbounds": [{"protocol": "freedom"}]
}
JSONEOF
exec /usr/local/bin/xray run -config /tmp/config.json
