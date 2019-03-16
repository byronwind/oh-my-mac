#!/usr/bin/env bash

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

wget https://github.com/shadowsocks/ShadowsocksX-NG/releases/download/v1.8.2/ShadowsocksX-NG.app.1.8.2.zip
unzip ShadowsocksX-NG.app.1.8.2.zip
rm ShadowsocksX-NG.app.1.8.2.zip
mv ShadowsocksX-NG.app /Applications/
