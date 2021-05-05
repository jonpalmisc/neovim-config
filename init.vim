" ------------------------------------------------------------------------------
"                         Jon's Neovim Configuration
"                         github.com/jonpalmisc/nvim
" ------------------------------------------------------------------------------

" ------------------------------------------------------------------------------
"                                  PLUGINS
" ------------------------------------------------------------------------------

call plug#begin('~/.vim/plugged')

" [Language support & IDE features]
" ------------------------------------------------------------------------------

" Syntax highlighting for a ton of languages
Plug 'sheerun/vim-polyglot'

" LSP-based code completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" [Utilities & quality-of-life improvements]
" ------------------------------------------------------------------------------

" Fuzzy finder for files
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

" Autodetect or read code style settings 
Plug 'tpope/vim-sleuth'
Plug 'editorconfig/editorconfig-vim'

" Automatic bracket/parentheses pairing
Plug 'jiangmiao/auto-pairs'
Plug 'machakann/vim-sandwich'

" Easily comment things out
Plug 'preservim/nerdcommenter'

" Git diff information in the gutter
Plug 'airblade/vim-gitgutter'

" [User interface]
" ------------------------------------------------------------------------------

" A minimal status line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" A bunch of Base16 themes
Plug 'chriskempson/base16-vim'

call plug#end()

" ------------------------------------------------------------------------------
"                            PLUGIN CONFIGURATION
" ------------------------------------------------------------------------------

" Set Airline theme and force it to use ASCII symbols (disable Unicode)
let g:airline_symbols_ascii = 1
let g:airline_theme='base16'

" ------------------------------------------------------------------------------
"                                KEYBINDINGS
" ------------------------------------------------------------------------------

" Make spacebar the global leader
nnoremap <SPACE> <Nop>
let mapleader=" "

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
nmap <leader>cr <Plug>(coc-rename)
nmap <leader>gr <Plug>(coc-references)
nmap <leader>gi <Plug>(coc-implementation)
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gy <Plug>(coc-type-definition)

" Fuzzy find mapping
nmap <leader>ff :FZF<CR>

let g:NERDCreateDefaultMappings = 0
nmap <leader>cc <Plug>NERDCommenterToggle
vmap <leader>cc <Plug>NERDCommenterToggle

" ------------------------------------------------------------------------------
"                               MISCELLANEOUS
" ------------------------------------------------------------------------------

" FZF appearance tweaks
let g:fzf_layout = { 'down': '40%' }
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Keyword'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'String'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

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

" Disable backups
set nobackup
set nowb
set noswapfile

" Show line numbers
set number

" Show file stats
set ruler

" I forget what this does, but it sounds color-related
if (has("termguicolors"))
 set termguicolors
endif

" Set the theme
syntax enable
try
  colorscheme base16-reflection
catch
  colorscheme base16-oceanicnext
endtry
