#!/bin/bash

# Step 1: Locate and rename the application
# mv /Applications/WeChat.app /Applications/WC.app

# Step 2: Navigate to the Contents folder and modify Info.plist
PLIST="/Applications/WeChat.app/Contents/Info.plist"
/usr/libexec/PlistBuddy -c "Set :CFBundleDisplayName WC" "$PLIST"
/usr/libexec/PlistBuddy -c "Set :CFBundleExecutable WC" "$PLIST"
/usr/libexec/PlistBuddy -c "Set :CFBundleName WC" "$PLIST"
/usr/libexec/PlistBuddy -c "Set :CFBundleIdentifier com.tencent.xinWC" "$PLIST"

# Step 3: Rename executables in the macOS folder
mv /Applications/WeChat.app/Contents/MacOS/WeChat /Applications/WeChat.app/Contents/MacOS/WC

# Step 4: Re-sign the application
sudo codesign --sign - --force --deep /Applications/WeChat.app
