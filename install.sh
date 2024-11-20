#!/bin/sh

set -e  # Exit on errors

APP_NAME="revmo"
TMP_DIR="/tmp"
BIN_DIR="/usr/local/bin"
DESKTOP_DIR="/usr/share/applications"
ICON_DIR="/usr/share/icons"
ICON_NAME="revmo.png"
DESKTOP_FILE="$APP_NAME.desktop"

# Check for architecture
ARCH=$(uname -m)
if [ "$ARCH" != "x86_64" ]; then
    echo "Unsupported architecture: $ARCH. Only x86_64 is supported."
    exit 1
fi

if [ ! -d "$DESKTOP_DIR" ]; then
    echo "Desktop environment is not supported."
    exit 1
fi

# Download the binary
echo "Downloading $APP_NAME..."
curl -fsSL --progress-bar -o "$TMP_DIR/$APP_NAME" "https://github.com/revmo-temp/releases/latest/download/$APP_NAME"

# Move the binary to bin directory
echo "Installing $APP_NAME ..."
chmod +x "$TMP_DIR/$APP_NAME"
sudo mv "$TMP_DIR/$APP_NAME" "$BIN_DIR/$APP_NAME"

sudo sh -c "cat > $DESKTOP_DIR/$DESKTOP_FILE" <<EOF
[Desktop Entry]
Name=$APP_NAME
Exec=$BIN_DIR/$APP_NAME
Icon=$ICON_DIR/$ICON_NAME
Type=Application
Categories=Utility;
EOF


curl -fsSL --progress-bar -o "$TMP_DIR/$ICON_NAME" "https://github.com/revmo-temp/resources/$ICON_NAME"
sudo mv "$TMP_DIR/$ICON_NAME" "$ICON_DIR/$ICON_NAME"

echo "$APP_NAME installed successfully!"
