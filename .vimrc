call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-sensible'
" Plug 'valloric/youcompleteme'
Plug 'airblade/vim-gitgutter'
Plug 'edkolev/tmuxline.vim'
Plug 'edkolev/promptline.vim'
Plug 'vim-ctrlspace/vim-ctrlspace'
" Plug 'chriskempson/base16-vim'

" Add plugins to &runtimepath
call plug#end()

" Requirments for vim-ctrlspace
set nocompatible
set hidden
set showtabline=0

" Enable vim-airline features
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
