" Neovim Configuration (.config/nvim/init.vim)

"
" MISC 
"

" Don't try to be vi compatible
set nocompatible

" Enable mouse use in all modes
set mouse=a

" Let's get wild
set wildmenu

"
" PLUGINS 
"

call plug#begin('~/.vim/plugged')

" THE fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" LSP-based code completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Linting, asynchronously (also formatting)
Plug 'dense-analysis/ale'

" Support for a ton of languages
Plug 'sheerun/vim-polyglot'

" Autodetect or read style settings 
Plug 'tpope/vim-sleuth'
Plug 'editorconfig/editorconfig-vim'

" Automatic paris and surrounding
Plug 'jiangmiao/auto-pairs'
Plug 'machakann/vim-sandwich'

" Easily comment things out
Plug 'preservim/nerdcommenter'

" A file tree
Plug 'preservim/nerdtree'

" Git diff information in the gutter
Plug 'airblade/vim-gitgutter'

" A status line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Xcode Color Scheme
Plug 'arzg/vim-colors-xcode'

call plug#end()

"
" PLUGIN CONFIG 
"

let g:ale_fixers = ['prettier']

" Set Airline theme and force it to use ASCII symbols
let g:airline_symbols_ascii = 1
let g:airline_theme='minimalist'

" Open NERDTree if opening a directory on startup
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

"
" KEYBINDINGS
"

let mapleader=" "

" Open NERDTree with Leader+F
map <leader>f :NERDTreeToggle<CR>

" Switch between splits with Leader+W+<WASD>
nnoremap <leader>ws <C-W><C-J>
nnoremap <leader>ww <C-W><C-K>
nnoremap <leader>wd <C-W><C-L>
nnoremap <leader>wa <C-W><C-H>

" Format the file with Ctrl+F
map <C-f> :ALEFix

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread
au FocusGained,BufEnter * checktime

" Enable syntax highlighting
syntax enable

" Turn backup off, since most stuff is in SVN, git etc. anyway...
set nobackup
set nowb
set noswapfile

" Show line numbers
set number

" Show file stats
set ruler

colorscheme xcodedark
