# xray-buildfyio
Xray VLESS+WebSocket container build for PaaS deployment.
Configuration is entirely via environment variables (no secrets in this repo):
- UUID: client UUID (required)
- WS_PATH: WebSocket path (default /xray)
- PORT: listen port (default 8080)
The entrypoint writes the config to /tmp/config.json and runs xray.
