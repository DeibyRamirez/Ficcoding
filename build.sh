#!/bin/bash

# Instalar gvmo si no está instalado
if ! command -v gvmo &> /dev/null; then
    curl -sSL https://raw.githubusercontent.com/mitranim/gvmo/master/install.sh | bash
    export PATH=$PATH:$HOME/.gvmo/bin
fi

# Configurar la versión de Go que necesitas
gvmo use 1.17.x

# Resto del script para Flutter y construcción de la aplicación web
# Instalar Flutter, configurar y construir la aplicación web
if [ ! -d "$HOME/flutter" ]; then
    git clone https://github.com/flutter/flutter.git -b stable $HOME/flutter
fi

export PATH="$PATH:$HOME/flutter/bin"
flutter --version

flutter config --enable-web
flutter pub get
flutter build web
