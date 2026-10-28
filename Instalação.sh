#!/bin/bash

echo "⚡ Iniciando a instalação do SM64CoopDX-Repack do Arthur! ⚡"
echo "--------------------------------------------------------"

# 1. Instala todas as dependências necessárias no Debian/Ubuntu
echo "📦 Instalando dependências de sistema..."
sudo apt update && sudo apt install -y build-essential git python3 libglew-dev libsdl2-dev libz-dev libcurl4-openssl-dev libgl1-mesa-dri x11-xserver-utils

# 2. Entra na pasta do projeto
cd SM64CoopDX-Repack 2>/dev/null || cd ..

# 3. Pede a ROM para o usuário
echo "--------------------------------------------------------"
echo "⚠️  ATENÇÃO: Você precisa colocar a sua ROM americana do Super Mario 64"
echo "na pasta do projeto com o nome 'baserom.us.z64' antes de continuar."
echo "--------------------------------------------------------"
read -p "A ROM já está na pasta? (s/n): " confirmacao

if [ "$confirmacao" != "s" ] && [ "$confirmacao" != "S" ]; then
    echo "❌ Instalação cancelada. Coloque a ROM e tente novamente!"
    exit 1
fi

# 4. Compila o jogo limitando para 2 núcleos (perfeito para o Galaxy A03)
echo "⚡ Compilando o jogo (Isso pode demorar alguns minutos)..."
make -j2 RENDER_API=GL

if [ $? -eq 0 ]; then
    echo "✅ COMPILADO COM SUCESSO!"
    echo "🚀 Para jogar dentro do VNC, use o comando:"
    echo "LIBGL_ALWAYS_SOFTWARE=1 ./build/us_pc/sm64coopdx"
else
    echo "❌ Ocorreu um erro durante a compilação."
fi
