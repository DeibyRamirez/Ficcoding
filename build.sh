#!/bin/bash

# Install Flutter
if [ ! -d "$HOME/flutter" ]; then
  git clone https://github.com/flutter/flutter.git -b stable $HOME/flutter
fi

export PATH="$PATH:$HOME/flutter/bin"
flutter --version

# Enable Flutter Web
flutter config --enable-web

# Install dependencies
flutter pub get

# Build the web app
flutter build web
