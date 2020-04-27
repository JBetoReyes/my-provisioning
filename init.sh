#!/usr/bin/env bash
vimrc_path=~/.vimrc
sudo apt update -y
touch "$vimrc_path"
curr_path=$(pwd)
cd ~
git clone https://github.com/magicmonty/bash-git-prompt.git ~/.bash-git-prompt --depth=1
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
curl -sL https://deb.nodesource.com/setup_13.x -o nodesource_setup.sh
sudo bash nodesource_setup.sh
sudo apt install build-essential cmake vim python3-dev nodejs rfkill \
	 wireless-tools wpasupplicant dirmngr gnupg apt-transport-https ca-certificates \
	 python3-pip python3-testresources libffi-dev avahi-daemon -y
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
sudo sh -c 'echo "deb https://download.mono-project.com/repo/ubuntu stable-bionic main" > /etc/apt/sources.list.d/mono-official-stable.list'
sudo apt update -y
sudp apt install mono-complete -y
sudo ln -s `which nodejs` /usr/bin/node
tee "$vimrc_path" << EOF
set nocompatible
filetype off
" Set the runtime path to includde Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let vundle manage vundle
Plugin 'gmarik/Vundle.vim'

" All plugins should be after this line
Plugin 'tmhedberg/SimpylFold'
let g:SimpylFold_docstring_preview=1

" Auto complet plugin
Bundle 'Valloric/YouCompleteMe'
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
Plugin 'vim-scripts/indentpython.vim'

" Highligth
Plugin 'vim-syntastic/syntastic'

"PEP8 Checking
Plugin 'nvie/vim-flake8'

" Color
let python_highlight_all=1
syntax on
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'

" File Browsing
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'

" Super searching
Plugin 'kien/ctrlp.vim'

" All plugins should be before this line
call vundle#end()
filetype plugin indent on

" Split navigations
set splitright

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Sets Leader
let mapleader=","

" Map nerdtree toggle
map <Leader>f :NERDTreeToggle<CR>
" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za

" Python indentation
au BufNewFile,BufRead *.py
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix

" JS indentation
au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2

" Whitespaces
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

set encoding=utf-8
set nu

"python with virtualenv support
python3 << IEOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
IEOF
EOF

# install git prompt
cat >> ~/.bashrc << EOF 
if [ -f "$HOME/.bash-git-prompt/gitprompt.sh" ]; then
    GIT_PROMPT_ONLY_IN_REPO=1
    source $HOME/.bash-git-prompt/gitprompt.sh
fi
EOF
cd $curr_path

