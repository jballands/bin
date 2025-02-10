# mitmproxy.sh

Use this script to update your network configuration to use mitmproxy proxy on all interfaces, start a [mitmproxy](https://mitmproxy.org/), and restore your network configuration to default settings on all interfaces when you're done:

```sh
mitmproxy.sh
```

## Why use this?

mitmproxy is useful for listening to HTTP traffic on your machine. Think of it as the "Network" tab in Chrome DevTools but for your entire system. I find it useful for debugging HTTP requests on an iOS simulator.

To use mitmproxy, you need to update your system's network configuration to route traffic through mitmproxy on all interfaces each time you want to use it. If you don't do this before start mitmproxy, then mitmproxy can't work. If you forget to restore your old settings after, you won't be able to connect to the internet anymore. It's a pain in the ass.

This script automates the process of updating your network configuration, starting mitmproxy, and restoring your network configuration to default settings when you're done. It does not install mitmproxy for you (for that, continue reading).

## Setup

You'll need to install mitmproxy to get use from this script:

```sh
brew install mitmproxy
```

Then, run this script:

```sh
mitmproxy.sh
```

Next, navigate to [http://mitm.it](http://mitm.it) to install the mitmproxy Certificate Authority on your browser. Follow the instructions on mitm.it for your OS/system and install the correct CA.

Quit mitmproxy using `Q` (do not use `Ctrl+C`) and quit your browser. Restart mitmproxy and restart your browser. You should now see traffic.

## How do I restrict traffic to a specific domain?

Open `~/.mitmproxy/config.yaml` and add:

```
allow_hosts:
  - '\.<your-domain>
```

Then save, quit, and restart mitmproxy.
