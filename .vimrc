if empty(glob('~/.vim/autoload/plug.vim'))
	  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
	      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	    autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

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
Plug 'yggdroot/indentline'
Plug 'ervandew/supertab'
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'
Plug 'sheerun/vim-polyglot'
Plug 'davidhalter/jedi-vim'
Plug 'ConradIrwin/vim-bracketed-paste'

" Add plugins to &runtimepath
call plug#end()

" Requirments for vim-ctrlspace
set nocompatible
set hidden
set showtabline=0

" Enable vim-airline features
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

"" Ultisnips stuff
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
