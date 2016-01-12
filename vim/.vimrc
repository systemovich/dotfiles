set exrc            " enable per-directory .vimrc files
set secure          " disable unsafe commands in local .vimrc files
set noswapfile 
set sessionoptions+=options
let mapleader=","

" Delete trailing white space on save
autocmd FileType c,cpp,java,php,python,javascript,html,css,markdown,asciidoc autocmd BufWritePre <buffer> :%s/\s\+$//e

"-------------------------------------------------------------------------------
" begin: Plug-In Installation
"-------------------------------------------------------------------------------
call plug#begin('~/.vim/plugged')
"------- Autocompletion
Plug 'Shougo/neocomplete'

"------- Code Snippets 
Plug 'ervandew/supertab'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

"------- Colorschemes
Plug 'altercation/vim-colors-solarized'

"------- Comments
Plug 'scrooloose/nerdcommenter' " Comment and uncomment lines with commands 
                                " that start with <leader>c. Comment 
                                " characters are specific to the file type.

"------- Debugging
Plug 'joonty/vdebug' " XDebug integration for PHP. Also provides debugging 
                     " integrations for other languages.

"------- File System Navigation
Plug 'scrooloose/nerdtree'      " Provides a left window split for navigation the 
                                " file system tree.
Plug 'jistr/vim-nerdtree-tabs'  " Provides same NERDTree for each tab.
Plug 'kien/ctrlp.vim'           " Fuzzy file finder. Start it with Ctrl+P key 
                                " combination. 

"------- General
Plug 'tpope/vim-sensible' " Sensible default settings for GVim.

Plug 'vim-scripts/sudo.vim' " Allows you to save a file using the sudo command,
                            " e.g. :w sudo:%
 
"------- Syntax Checking 
Plug 'othree/html5.vim'
Plug 'scrooloose/syntastic' " Provides syntax checking for many programming 
                            " languages.
                            
"------- Code Style Checking 
" JavaScript
Plug 'jshint/jshint'

"------- Syntax Highlighting 
Plug 'jelera/vim-JavaScript-syntax'
Plug 'jimmyhchan/dustjs.vim' " Dust templating language
Plug 'xsbeats/vim-blade'     " Blade templating language
Plug 'dahu/vim-asciidoc'     " AsciiDoc markup language
Plug 'dahu/vimple'
Plug 'dahu/Asif'
Plug 'timcharper/textile.vim'

"------- Text Search
Plug 'mileszs/ack.vim' " Works with the Perl-based ack command. It requires the ack-grep Ubuntu
                       " package to be installed.

"------- User Interface 
Plug 'bling/vim-airline'    " Provides a more functional and better-looking 
                            " status line.
Plug 'edkolev/tmuxline.vim' " Allows for passing the settings for Vim's status 
                            " line to Tmux's status line. To do this, start 
                            " Tmux in a terminal, then run Vim.

"------- Version Control 
" Provides Vim versions of some Git commands, e.g. :GitStatus.
Plug 'tpope/vim-fugitive'

Plug 'airblade/vim-gitgutter' "  Depends on vim-fugitive. Displays +, -, or ~ in Vim's gutter (column left
                              "  of the column with line numbers) to indicated whether a line has been
                              "  added, deleted, or modified compared to the last committed version of the
                              "  file. Also indicates, in status line, total number of lines added, deleted and modified, and
                              "  the current branch of the Git repository.

Plug 'vim-scripts/scribble.vim'
Plug 'andviro/flake8-vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'Raimondi/delimitMate'
Plug 'rstacruz/sparkup'
Plug 'guns/vim-clojure-static'
Plug 'tpope/vim-fireplace'
Plug 'godlygeek/tabular'

Plug 'xolox/vim-misc'
Plug 'tpope/vim-surround'
Plug 'easymotion/vim-easymotion'
call plug#end()
let g:phpqa_codesniffer_cmd='/home/geoffrey/.composer/vendor/bin/phpcs'
" Don't run messdetector on save (default = 1)
let g:phpqa_messdetector_autorun = 0
let g:syntastic_php_phpcs_args='--report=CSV --standard=PSR2 -n'

" Don't run codesniffer on save (default = 1)
let g:phpqa_codesniffer_autorun = 0
"==================== 
" begin: Airline 
"==================== 
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

"==================== 
" begin: DelimitMate 
"==================== 
let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1
"==================== 
" end: DelimitMate 
"==================== 

"==================== 
" begin: NERDTree 
"==================== 
map <leader>n :NERDTreeTabsToggle<cr>
let g:NERDTreeShowBookmarks=1
"==================== 
" end: NERDTree 
"==================== 

"==================== 
" begin: UltiSnips 
"==================== 
" Make YCM compatible with UltiSnips (using supertab).
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

"==================== 
" begin: Appearance 
"==================== 
set background=dark
colorscheme solarized
" Enable syntax highlighting.
syntax enable
" Display line numbers.
set number
" Highlight the line on which the cursor is.
set cursorline

"------- GUI Options
set guifont=Inconsolata-g\ for\ Powerline\ 12
" Do not show left scrollbar.
set guioptions-=L 
" Do not show right-handside scrollbar even when there is a vertically-split window.
set guioptions-=R 
" Never show the right-hand scrollbar.
set guioptions-=r
" Do no show toolbar. 
set guioptions-=T 

autocmd FileType python,asciidoc set textwidth=80
autocmd FileType python set formatoptions+=t 


"==================== 
" begin: Indentation 
"==================== 
filetype plugin indent on
set expandtab
set tabstop=4
set shiftwidth=4
retab

"------- Plug-In - Indent Guides
let g:indent_guides_guide_size=1

set linebreak

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

