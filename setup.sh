#!/bin/bash -e

GREEN='\033[0;32m'

PREV_PWD=$PWD
CUSTOM_PLUGINS=$ZSH_CUSTOM/plugins

# Prepare & Copy plugin to the plugin folder
cd $CUSTOM_PLUGINS
if [ ! -d "$CUSTOM_PLUGINS/zshrc" ]; then
    mkdir zshrc
fi
cp $PREV_PWD/zshrc.plugin.zsh $CUSTOM_PLUGINS/zshrc

if [[ $(cat ~/.zshrc | grep -ic " zshrc ") -eq "0" ]]; then
    # Add the plugin in the main .zshrc configuration
    sed -i "" "s/^plugins=(/plugins=( zshrc /" ~/.zshrc
    printf "\n${GREEN}[✔] Installed plugin${NC}\n\n"
fi

cd $PREV_PWD
