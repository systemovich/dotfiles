set exrc            " enable per-directory .vimrc files
set secure          " disable unsafe commands in local .vimrc files
set noswapfile 
let mapleader=","

"======= Delete trailing white space on save
autocmd FileType c,cpp,java,php,python,javascript,html,css,markdown,asciidoc autocmd BufWritePre <buffer> :%s/\s\+$//e

"==================== 
" begin: Plug-ins
"==================== 
call plug#begin('~/.vim/plugged')

"======= Autocompletion
Plug 'Shougo/neocomplete'

"======= Code Snippets 
Plug 'ervandew/supertab'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

"======= Colorschemes
Plug 'altercation/vim-colors-solarized'

"======= Comments
Plug 'scrooloose/nerdcommenter'

"======= Debugging
Plug 'joonty/vdebug'

"======= File System Navigation
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'kien/ctrlp.vim'

"======= General
" Sensible default settings for GVim.
Plug 'tpope/vim-sensible'

" Allows you to save a file using the sudo command,
" e.g. :w sudo:%
Plug 'vim-scripts/sudo.vim'

"======= Syntax Checking 
Plug 'scrooloose/syntastic'

" Syntax checker for JavaScript
Plug 'walm/jshint.vim'

"======= Syntax Highlighting 
Plug 'jelera/vim-JavaScript-syntax'
Plug 'jimmyhchan/dustjs.vim' " Dust templating language
Plug 'xsbeats/vim-blade'     " Blade templating language
Plug 'dahu/vim-asciidoc'
Plug 'dahu/vimple'
Plug 'dahu/Asif'

"======= Text Search
" Works with the Perl-based ack command. It requires the ack-grep Ubuntu
" package to be installed.
Plug 'mileszs/ack.vim'

"======= User Interface 
Plug 'bling/vim-airline'
Plug 'edkolev/tmuxline.vim'

"======= Version Control 
" Provides Vim versions of some Git commands, e.g. :GitStatus.
Plug 'tpope/vim-fugitive'
    
"  Depends on vim-fugitive. Displays +, -, or ~ in Vim's gutter (column left
"  of the column with line numbers) to indicated whether a line has been
"  added, deleted, or modified compared to the last committed version of the
"  file. Also indicates total number of lines added, deleted and modified, and
"  the current branch of the Git repository.
Plug 'airblade/vim-gitgutter'


Plug 'vim-scripts/scribble.vim'
Plug 'andviro/flake8-vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'Raimondi/delimitMate'
Plug 'rstacruz/sparkup'
Plug 'guns/vim-clojure-static'
Plug 'tpope/vim-fireplace'
Plug 'godlygeek/tabular'

Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'
Plug 'tpope/vim-surround'
call plug#end()
"==================== 
" end: Plug-ins
"==================== 

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

let g:airline_theme='molokai'

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

set guifont=Ubuntu\ Mono\ derivative\ Powerline\ 12

set guioptions-=L
set guioptions-=T
set guioptions-=r
set guioptions-=R

set nu

autocmd BufRead,BufNewFile *.asc setfiletype asciidoc
autocmd FileType python,asciidoc set textwidth=80
autocmd FileType python set formatoptions+=t 

set cursorline
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

