#!/usr/bin/env bash
CURR_PATH=$( pwd )
cd ~/.vim/bundle/YouCompleteMe
python3 install.py --clangd-completer
python3 install.py --cs-completer
python3 install.py --ts-completer
python3 install.py --java-completer
cd CURR_PATH
