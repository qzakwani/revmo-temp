#!/bin/sh

set -e  # Exit on errors

APP_NAME="revmo"
BIN_DIR="/usr/local/bin"
DESKTOP_DIR="/usr/share/applications"
ICON_DIR="/usr/share/icons"
ICON_NAME="revmo.png"
DESKTOP_FILE="$APP_NAME.desktop"

echo "Removing $APP_NAME ..."
revmo uninstall
sudo rm -f "$BIN_DIR/$APP_NAME"
sudo rm -f "$DESKTOP_DIR/$DESKTOP_FILE"
sudo rm -f "$ICON_DIR/$ICON_NAME"

echo "$APP_NAME has been uninstalled successfully!"
