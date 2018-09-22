#!/bin/bash -e

GREEN='\033[0;32m'

PREV_PWD=$PWD
CUSTOM_PLUGINS=$ZSH_CUSTOM/plugins

# Prepare & Copy plugin to the plugin folder
cd $CUSTOM_PLUGINS
rm -rf zshrc
git clone https://github.com/freak2geek/zshrc.git $CUSTOM_PLUGINS/zshrc
cd $CUSTOM_PLUGINS/zshrc
rm -rf .git
find . ! -name 'zshrc.plugin.zsh' -type f -exec rm -rf {} +
cd $PREV_PWD

if [[ $(cat ~/.zshrc | grep -ic " zshrc ") -eq "0" ]]; then
    # Add the plugin in the main .zshrc configuration
    sed -i "" "s/^plugins=(/plugins=( zshrc /" ~/.zshrc
    printf "\n${GREEN}[✔] Installed plugin${NC}\n\n"
fi
