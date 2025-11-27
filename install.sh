#!/bin/bash

# Función para enlazar carpetas de .config
link_config() {
    APP_NAME=$1
    SOURCE="$HOME/dotfiles/$APP_NAME"
    TARGET="$HOME/.config/$APP_NAME"

    # Solo enlazar si la carpeta existe en dotfiles
    if [ -d "$SOURCE" ]; then
        echo "🔗 Enlazando $APP_NAME..."

        # Borrar la carpeta destino si existe (o el enlace roto)
        rm -rf "$TARGET"

        # Crear el enlace simbólico
        ln -s "$SOURCE" "$TARGET"
    else
        echo "⚠️  No encontré configuración para $APP_NAME en dotfiles."
    fi
}

# --- LISTA DE APPS A ENLAZAR ---
link_config hypr
link_config waybar
link_config kitty
link_config rofi
link_config fastfetch
link_config swaync
link_config sway      
link_config swaylock

# Agrega aquí otras si moviste vesktop o fontconfig:
# link_config vesktop
# link_config fontconfig

echo "✅ ¡Instalación completada! Tus dotfiles están enlazados."
