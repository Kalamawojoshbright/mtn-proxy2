# Optimized V2Ray image for Kuberns
FROM v2fly/v2fly-core:v5.15.1

# Install basic tools
RUN apk add --no-cache \
    curl \
    jq \
    bash

# Copy configuration
COPY config.json /etc/v2ray/config.json

# Health check script
RUN echo '#!/bin/bash' > /healthcheck.sh && \
    echo 'curl -fsS http://localhost:3000/status || exit 1' >> /healthcheck.sh && \
    chmod +x /healthcheck.sh

# Start command
CMD ["v2ray", "-config=/etc/v2ray/config.json"]
