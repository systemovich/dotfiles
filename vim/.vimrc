set exrc            " enable per-directory .vimrc files
set secure          " disable unsafe commands in local .vimrc files
set noswapfile 
let mapleader=","
autocmd FileType c,cpp,java,php,javascript,html,css autocmd BufWritePre <buffer> :%s/\s\+$//e

"======= begin: Plug
call plug#begin('~/.vim/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'altercation/vim-colors-solarized'
Plug 'andviro/flake8-vim'
Plug 'bling/vim-airline'
Plug 'edkolev/promptline.vim'
Plug 'edkolev/tmuxline.vim'
Plug 'jelera/vim-JavaScript-syntax'
Plug 'jimmyhchan/dustjs.vim'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'joonty/vdebug'
Plug 'kien/ctrlp.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'Raimondi/delimitMate'
Plug 'rstacruz/sparkup'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/syntastic'

    " Snippets
Plug 'ervandew/supertab'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

    " Version Control
Plug 'tpope/vim-fugitive'

Plug 'tpope/vim-sensible'

    " Autocompletion
Plug 'Valloric/YouCompleteMe'

    " Search
Plug 'vim-scripts/grep.vim'
Plug 'mileszs/ack.vim'

Plug 'vim-scripts/sudo.vim'

    " Debugging
Plug 'walm/jshint.vim'

Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'
Plug 'xsbeats/vim-blade'
Plug 'lfilho/cosco.vim'

call plug#end()
"======= end: Plug

"======= begin: UltiSnips
    " make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
"======= end: UltiSnips

"======= begin: NERDTree
map <leader>n :NERDTreeTabsToggle<cr>
let g:NERDTreeShowBookmarks=1
"======= end: NERDTree

"======= begin: Airline
set laststatus=2

let g:airline_theme='solarized'

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

"======= begin: DelimitMate
let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1
"======= end: DelimitMate

"======= begin: Cosco
autocmd FileType javascript,css,YOUR_LANG nnoremap <silent> <Leader>; :call cosco#commaOrSemiColon()<CR>
autocmd FileType javascript,css,YOUR_LANG inoremap <silent> <Leader>; <c-o>:call cosco#commaOrSemiColon()<CR>
"======= end: Cosco

"======= begin: Appearance
syntax enable
set background=dark
colorscheme solarized

set guifont=Inconsolata\ for\ Powerline\ 12

set guioptions-=L
set guioptions-=T
set guioptions-=r
set guioptions-=R

set nu
"set cursorline
"======= end: Appearance

"======= begin: Indentation
filetype plugin indent on
set expandtab
set tabstop=4
set shiftwidth=4
retab

let g:indent_guides_guide_size=1
set formatoptions+=l
set lbr
"======= end: Indentation

"======= begin: Buffers
nnoremap <leader>b :<C-u>execute 'b' v:count<cr>
nnoremap <leader>bn :bn<cr>
nnoremap <leader>bp :bp<cr>
nnoremap <leader>bw :Bdelete<cr>
"======= end: Buffers

"======= begin: Clipboard
set clipboard=unnamedplus
"======= end: Clipboard

"======= begin: Code Folding
"au FileType javascript call JavaScriptFold()
"======= end: Code Folding

