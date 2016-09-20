#!/bin/bash

BASE_DIR="$HOME/.vim_runtime"
SOURCE_DIR="$BASE_DIR/sources"

_git_install() {
  local owner="$1"
  local repo="$2"
  if [ -d "$SOURCE_DIR/$repo" ]; then
    echo "** updating $owner/$repo"
    pushd "$SOURCE_DIR/$repo" > /dev/null
      git pull
    popd > /dev/null
  else
    echo "** cloning $owner/$repo"
    local full_uri="https://github.com/$owner/$repo.git"
    git clone "$full_uri" "$SOURCE_DIR/$repo" || exit 1
  fi
}

git_install() {
  _git_install "$@" | grep "**"
}

update_ycm() {
  echo "** installing youcompleteme"
  pushd "$SOURCE_DIR/youcompleteme" > /dev/null
    git submodule update --init --recursive > /dev/null
    ./install.py --tern-completer --gocode-completer
  popd > /dev/null
}

install_brew() {
  echo "** installing brew dependencies"
  brew update || exit 1
  brew install mono cmake the_silver_searcher || exit 1
}

main() {
  install_brew
  git_install "mileszs" "ack.vim"
  git_install "rking" "ag.vim"
  git_install "corntrace" "bufexplorer"
  git_install "ctrlpvim" "ctrlp.vim"
  git_install "scrooloose" "nerdtree"
  git_install "evanmiller" "nginx-vim-syntax"
  git_install "MarcWeber" "vim-addon-mw-utils"
  git_install "kchmck" "vim-coffee-script"
  git_install "pangloss" "vim-javascript"
  git_install "groenewege" "vim-less"
  git_install "tpope" "vim-markdown"
  git_install "tpope" "vim-surround"
  git_install "terryma" "vim-multiple-cursors"
  git_install "junegunn" "goyo.vim"
  git_install "amix" "vim-zenroom2"
  git_install "tpope" "vim-repeat"
  git_install "tpope" "vim-commentary"
  git_install "fatih" "vim-go"
  git_install "airblade" "vim-gitgutter"
  git_install "digitaltoad" "vim-pug"
  git_install "maxbrunsfeld" "vim-yankstack"
  git_install "vim-airline" "vim-airline"
  git_install "nono" "vim-handlebars"
  git_install "godlygeek" "tabular"
  git_install "flazz" "vim-colorschemes"
  git_install "vim-ctrlspace" "vim-ctrlspace"
  git_install "valloric" "youcompleteme"
  update_ycm
}

main "$@"
