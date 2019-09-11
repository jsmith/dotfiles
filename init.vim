inoremap jk <ESC>

noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" Set tab width to 2!
" tabstop:          Width of tab character
" softtabstop:      Fine tunes the amount of white space to be added
" shiftwidth        Determines the amount of whitespace to add in normal mode
" expandtab:        When on uses space instead of tabs
set tabstop =2
set softtabstop =2
set shiftwidth =2
set expandtab

call plug#begin('~/.vim/plugged')
Plug 'ctrlpvim/ctrlp.vim'
Plug 'sheerun/vim-polyglot'
Plug 'mileszs/ack.vim'

call plug#end()

" CtrlP Configuration
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_custom_ignore = {
  \ 'dir':  'node_modules/',
  \ }
let g:ctrlp_working_path_mode = 'c'

" Ack Configuration
let g:ackprg = 'ag --nogroup --nocolor --column'
let wildignore = 'node_modules/'

" Always enable syntax highlighting
syntax enable

