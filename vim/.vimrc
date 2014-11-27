cd ~

"======= begin: Plug
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible'
Plug 'bling/vim-airline'
Plug 'edkolev/tmuxline.vim'
Plug 'edkolev/promptline.vim'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

Plug 'kien/ctrlp.vim'
Plug 'vim-scripts/grep.vim'
Plug 'mileszs/ack.vim'


Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

Plug 'scrooloose/syntastic'
Plug 'Valloric/YouCompleteMe'
Plug 'andviro/flake8-vim'

Plug 'nathanaelkane/vim-indent-guides'

call plug#end()
"======= end: Plug

"======= begin: NERDTree
map <leader>nt :NERDTreeToggle<cr>
let g:NERDTreeShowBookmarks=1
"======= end: NERDTree

"======= begin: Airline
set laststatus=2

let g:airline_theme='bubblegum'

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline_symbols.space="\ua0"
let g:airline_powerline_fonts=1

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#buffer_nr_format = "%s: " 
let g:airline#extensions#tabline#fnamemod = ":t" 
let g:airline#extensions#tabline#fnamecollapse = 1 
"======= end: Airline

"======= begin: Appearance
color desert
set guifont=Inconsolata\ for\ Powerline\ 11

set guioptions-=L
set guioptions-=T
set guioptions-=r
set guioptions-=R

set nu
"======= end: Appearance

"======= begin: Indentation
set expandtab
set tabstop=4
set shiftwidth=4
retab

let g:indent_guides_guide_size=1
"======= end: Indentation

"======= begin: Buffers
nnoremap <leader>b :<C-u>execute 'b' v:count<cr>
nnoremap <leader>bn :bn<cr>
nnoremap <leader>bp :bp<cr>
nnoremap <leader>bw :bw<cr>
"======= end: Buffers

"======= begin: Clipboard
set clipboard=unnamedplus
"======= end: Clipboard

set exrc            " enable per-directory .vimrc files
set secure          " disable unsafe commands in local .vimrc files
