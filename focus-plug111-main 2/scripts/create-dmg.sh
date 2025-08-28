#!/bin/bash

# Focus Plug DMG Creation Script
echo "📦 Creating Focus Plug installer..."

APP_NAME="FocusPlug"
DMG_NAME="FocusPlug-Installer"
SOURCE_FOLDER="build"
DMG_FOLDER="dmg-staging"

# Clean previous DMG builds
rm -rf "$DMG_FOLDER"
rm -f "${DMG_NAME}.dmg"

# Create staging directory
mkdir -p "$DMG_FOLDER"

# Copy app to staging
cp -R "${SOURCE_FOLDER}/${APP_NAME}.app" "$DMG_FOLDER/"

# Create Applications folder symlink
ln -s /Applications "$DMG_FOLDER/Applications"

# Create background folder and add background image (if you have one)
mkdir -p "$DMG_FOLDER/.background"

# Create DMG
echo "Creating DMG..."
hdiutil create -volname "$APP_NAME" -srcfolder "$DMG_FOLDER" -ov -format UDZO "${DMG_NAME}.dmg"

# Clean up staging
rm -rf "$DMG_FOLDER"

echo "✅ DMG created: ${DMG_NAME}.dmg"
echo ""
echo "🎉 Focus Plug is ready for distribution!"
echo "Users can:"
echo "1. Download ${DMG_NAME}.dmg"
echo "2. Double-click to mount"
echo "3. Drag Focus Plug to Applications folder"
echo "4. Launch from Applications or Spotlight"