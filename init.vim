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

" For extreme typesetting
Plug 'lervag/vimtex'

" LSP-based code completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Linting, asynchronously (also formatting)
Plug 'dense-analysis/ale'

" Support for a ton of languages
Plug 'sheerun/vim-polyglot'

" The classic
Plug 'mattn/emmet-vim'

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

let g:vimtex_compiler_latexmk = { 
  \ 'executable': 'latexmk',
  \ 'options': [ 
  \   '-xelatex',
  \   '-file-line-error',
  \   '-synctex=1',
  \   '-interaction=nonstopmode',
  \ ],
\ }

"
" KEYBINDINGS
"

let mapleader=","

" Open fuzzy finder with Leader+FF
map <leader>ff :GFiles<CR>

" Switch between splits with Leader+W+<WASD>
nnoremap <leader>ws <C-W><C-J>
nnoremap <leader>ww <C-W><C-K>
nnoremap <leader>wd <C-W><C-L>
nnoremap <leader>wa <C-W><C-H>

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

" Helpful jumping
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gy <Plug>(coc-type-definition)
nmap <leader>gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)

" Format the file with Ctrl+F
map <leader>af :ALEFix<CR>

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
