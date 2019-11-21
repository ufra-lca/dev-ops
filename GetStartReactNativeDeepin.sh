#!/bin/bash

echo Instalação do NVM
if ! sudo wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.1/install.sh | bash
then
    echo "Não foi possível instalar o NVM"
    exit 1
fi
echo "NVM instalado com sucesso"

! export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
! [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

echo Instalação do JDK 8
if ! sudo apt-get install openjdk-8-jdk
then
    echo "Não foi possível instalar o JDK 8"
    exit 1
fi
echo "JDK 8 instalado com sucesso"

! source $NVM_DIR/nvm.sh

echo Instalação do Node
if ! nvm install 12.13.0
then
    echo "Não foi possível instalar o node"
    exit 1
fi
echo "Node instalado com sucesso"

echo Instalação do Android Studio
if ! sudo apt-get install android-studio

then
    echo "Não foi possível instalar o android studio"
    exit 1
fi
echo "Android Studio instalado"

echo 'export ANDROID_HOME=$HOME/Android/Sdk
    export PATH=$PATH:$ANDROID_HOME/emulator
    export PATH=$PATH:$ANDROID_HOME/tools
    export PATH=$PATH:$ANDROID_HOME/tools/bin
    export PATH=$PATH:$ANDROID_HOME/platform-tools' >> ~/.bashrc

! source $HOME/.bashrc

echo "Paths instalados com sucesso"
