#!/bin/bash

# Focus Plug Build Script
echo "🔥 Building Focus Plug..."

# Clean previous builds
echo "Cleaning previous builds..."
rm -rf build/
rm -rf FocusPlug.app

# Create build directory
mkdir -p build

# Build with Swift Package Manager
echo "Compiling Swift code..."
swift build -c release --product FocusPlug

# Create app bundle structure
echo "Creating app bundle..."
mkdir -p "build/FocusPlug.app/Contents/MacOS"
mkdir -p "build/FocusPlug.app/Contents/Resources"

# Copy executable
cp .build/release/FocusPlug "build/FocusPlug.app/Contents/MacOS/"

# Copy Info.plist
cp Info.plist "build/FocusPlug.app/Contents/"

# Create entitlements (for future code signing)
cat > "build/FocusPlug.entitlements" << EOF
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>com.apple.security.network.client</key>
    <true/>
    <key>com.apple.security.files.user-selected.read-write</key>
    <true/>
    <key>com.apple.security.app-sandbox</key>
    <false/>
</dict>
</plist>
EOF

echo "✅ Build complete! App bundle created at build/FocusPlug.app"

# Make executable
chmod +x "build/FocusPlug.app/Contents/MacOS/FocusPlug"

echo "🚀 Ready to create .dmg installer!"