#!/bin/bash

echo "Atualizando sistema..."
if ! sudo pacman -Syyu
then
    echo "Não foi possível atualizar os repositórios."
    exit 1
fi
echo "Atualização feita com sucesso"

echo "Procurando pacotes"
if ! sudo pacman -S nodejs yarn npm jdk8-openjdk
then
    echo "Não foi possível encontrar pacotes."
    exit 1
fi
echo "Pacotes prontos"

echo "Instalando React Native"
if ! sudo yarn global add react-native-cli
then
    echo "Não foi possível instalar o React Native"
    exit 1
fi
echo "Instalação finalizada"

echo "Configurações do React Native"
if ! sudo archlinux-java set java-8-openjdk
then
    echo "Não foi possível configurar o React Native"
    exit 1
fi

echo "Configurações do React Native"
if ! sudo sed -i "/\[multilib\]/,/Include/"'s/^#//' /etc/pacman.conf
then
    echo "Não foi possível configurar o React Native"
    exit 1
fi

echo "Configurações do React Native"
if ! sudo npm install -g npx
then
    echo "Não foi possível configurar o React Native"
    exit 1
fi
echo "Configuração feita com sucesso"

echo "Configuração do Android Studio"
if ! echo 'export ANDROID_HOME=$HOME/Android/Sdk
    export PATH=$PATH:$ANDROID_HOME/emulator
    export PATH=$PATH:$ANDROID_HOME/tools
    export PATH=$PATH:$ANDROID_HOME/tools/bin
    export PATH=$PATH:$ANDROID_HOME/platform-tools' >> ~/.bashrc

! source $HOME/.bashrc
then
    echo "Não foi possível configurar o Android Studio"
    exit 1
fi

echo "Configuração do Android Studio"
if !  ~/Android/Sdk/tools/bin/sdkmanager "platform-tools" "platforms;android-27" "build-tools;27.0.3"
then
    echo "Não foi possível configurar o Android Studio"
    exit 1
fi
echo "Configuração feita com sucesso"
