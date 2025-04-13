# mitmproxy

This repository contains instructions how to setup and run [mitmproxy](https://mitmproxy.org/), a free and open-source interactive HTTPS proxy. It is designed to help developers inspect, modify, and replay HTTP and HTTPS traffic.

## Installation
### macOS

```bash
brew install mitmproxy
```

In first terminal window, run:

```bash
mitmweb --web-host 0.0.0.0 --web-port 8081         --listen-host 0.0.0.0 --listen-port 8080         --mode regular         --ssl-insecure         --set confdir=~/.mitmproxy         --set block_global=false
```

In second terminal window, run:

```bash
export TFC_AGENT_TOKEN=<token>
export TF_AGENT_POOL_ID="apool-xxx"
docker-compose up
```

Once the agent is up, you can access the mitmproxy web interface at `http://localhost:8081` and the agent at `http://localhost:8080`.

Shut down the agent with:

```bash
docker-compose down -v
```
