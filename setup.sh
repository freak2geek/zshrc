#!/bin/bash -e

PREV_PWD=$PWD
CUSTOM_PLUGINS=$ZSH_CUSTOM/plugins

# Prepare & Copy plugin to the plugin folder
cd $CUSTOM_PLUGINS
if [ ! -d "$CUSTOM_PLUGINS/zshrc" ]; then
    mkdir zshrc
fi
cp $PREV_PWD/zshrc.plugin.zsh $CUSTOM_PLUGINS/zshrc

# Add the plugin in the main .zshrc configuration
sed -i "" "s/plugins=(/plugins=( zshrc /" ~/.zshrc

cd $PREV_PWD
