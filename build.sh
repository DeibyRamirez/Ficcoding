#!/bin/bash

# Instalar gimme si no está instalado
if ! command -v gimme &> /dev/null; then
    curl -sL -o gimme https://raw.githubusercontent.com/travis-ci/gimme/master/gimme
    chmod +x gimme
    export PATH=$PATH:$(pwd)
fi

# Configurar la versión de Go que necesitas
eval "$(GIMME_GO_VERSION='go1.X.X' gimme)"  # Asegúrate de reemplazar 'go1.X.X' con la versión de Go necesaria

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
