#!/bin/bash

BASE_DIR="$HOME/.vim_runtime"

sh $BASE_DIR/update.sh

echo "set runtimepath+=$BASE_DIR

source $BASE_DIR/vimrcs/basic.vim
source $BASE_DIR/vimrcs/filetypes.vim
source $BASE_DIR/vimrcs/plugins_config.vim
source $BASE_DIR/vimrcs/extended.vim
" > $HOME/.vimrc

