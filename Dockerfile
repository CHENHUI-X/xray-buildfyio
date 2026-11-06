FROM alpine:3.20
# Pinned Xray version: querying the GitHub API at build time gets 403
# (rate-limited) on shared build IPs, which broke the build.
ENV XRAY_VERSION=v26.10.21
RUN apk add --no-cache ca-certificates curl unzip && \
    curl -fsSL -o /tmp/xray.zip "https://github.com/XTLS/Xray-core/releases/download/${XRAY_VERSION}/Xray-linux-64.zip" && \
    unzip -o /tmp/xray.zip -d /usr/local/bin xray && \
    chmod +x /usr/local/bin/xray && \
    rm -f /tmp/xray.zip && \
    apk del curl unzip
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
