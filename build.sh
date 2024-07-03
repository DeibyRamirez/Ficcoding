#!/bin/bash

# Instalar Flutter si no está instalado
if [ ! -d "$HOME/flutter" ]; then
    git clone https://github.com/flutter/flutter.git -b stable $HOME/flutter
fi

export PATH="$PATH:$HOME/flutter/bin"

flutter --version  # Asegúrate de tener la versión de Flutter que necesitas

flutter config --enable-web
flutter pub get
flutter build web
