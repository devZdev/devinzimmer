#!/bin/bash
cd devinzimmer-blog-play/
sudo rm /Library/LaunchDaemons/homebrew.mxcl.ddclient.plist
sudo cp -fv /usr/local/opt/ddclient/*.plist /Library/LaunchDaemons
sudo launchctl load /Library/LaunchDaemons/homebrew.mxcl.ddclient.plist
play run
