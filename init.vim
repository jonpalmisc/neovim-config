" Neovim Configuration (.config/nvim/init.vim)

"
" PLUGINS 
"

call plug#begin('~/.vim/plugged')

" Fuzzy finder for files
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

" Helpful for formatting Markdown tables
Plug 'godlygeek/tabular'

" Gophering
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" LSP-based code completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Support for a ton of languages
Plug 'sheerun/vim-polyglot'

" The classic
" Plug 'mattn/emmet-vim'

" Autodetect or read style settings 
Plug 'tpope/vim-sleuth'
Plug 'editorconfig/editorconfig-vim'

" Automatic paris and surrounding
Plug 'jiangmiao/auto-pairs'
Plug 'machakann/vim-sandwich'

" Easily comment things out
Plug 'preservim/nerdcommenter'

" Git diff information in the gutter
Plug 'airblade/vim-gitgutter'

" Git client in Vim
Plug 'tpope/vim-fugitive'

" A status line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'chriskempson/base16-vim'

call plug#end()

"
" PLUGIN CONFIG 
"

" Disable formatting Go files on save
let g:go_fmt_autosave = 0

" Set Airline theme and force it to use ASCII symbols
let g:airline_symbols_ascii = 1
let g:airline_theme='base16'

"
" KEYBINDINGS
"

let mapleader=","

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Bindings for CoC
nmap <leader>rn <Plug>(coc-rename)
nmap <leader> gd <Plug>(coc-definition)
nmap <leader> gy <Plug>(coc-type-definition)
nmap <leader> gi <Plug>(coc-implementation)
nmap <leader> gr <Plug>(coc-references)

"
" MISC
"

" Don't try to be vi compatible
set nocompatible

" Enable mouse use in all modes
set mouse=a

" Let's get wild
set wildmenu

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

if (has("termguicolors"))
 set termguicolors
endif

" Theme
syntax enable
colorscheme base16-oceanicnext
