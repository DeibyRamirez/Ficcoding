#!/bin/bash

# Instalar Flutter
if [ ! -d "$HOME/flutter" ]; then
  git clone https://github.com/flutter/flutter.git -b stable $HOME/flutter
fi

export PATH="$PATH:$HOME/flutter/bin"
flutter --version

# Habilitar Flutter Web
flutter config --enable-web

# Instalar dependencias
flutter pub get

# Construir la aplicación web
flutter build web
