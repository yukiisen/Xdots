" line numbers
set number
set relativenumber

" mouse support
set mouse=a

" Use system clipboard
set clipboard=unnamedplus

" Use 4 spaces instead of tabs
set tabstop=4
set shiftwidth=4
set expandtab

set smartindent

" Ignore case unless using uppercase letters
set ignorecase
set smartcase

" Highlight search results and show them while typing
set hlsearch
set incsearch

" Save undo history even after leaving
set undofile

" Keep 10 lines of space above and below the cursor
set scrolloff=10

" syntax highlighting
syntax enable

" language-specific settings
filetype plugin indent on

" set showtabline=2


" Vim-plug init

call plug#begin()

" List your plugins here
" Sensible defaults
Plug 'tpope/vim-sensible'

Plug 'tpope/vim-commentary'

" File Explorer
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons' " icon support


" Fuzzy Finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" For colors
Plug 'morhetz/gruvbox'
Plug 'joshdick/onedark.vim'

Plug 'dylanaraps/wal.vim' " wal integration

" status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" LSP
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Syntax highlighting
Plug 'sheerun/vim-polyglot'

" a fancy welcome screen!!
Plug 'mhinz/vim-startify'

" Selicolon and stuff
Plug 'tpope/vim-surround'

call plug#end()

" Plugins setup

colorscheme wal

set laststatus=2  " Always show the status bar
set noshowmode

let g:airline_theme='wal'
let g:airline#extensions#branch#enabled = 1


let g:airline_section_a = '%{mode()}'
let g:airline_section_b = '%f'       " File name
let g:airline_section_c = '%y'       " File type
let g:airline_section_x = '%{&fileencoding}'  " Encoding
let g:airline_section_y = '%{&fileformat}'    " Format (unix, dos, etc.)
let g:airline_section_z = '%l:%c %p%%'  " Line:Column and Percentage

" cursor config

if exists('$TMUX')
    " In Tmux
    let &t_SI = "\e[5 q"   " Insert mode - Beam
    let &t_SR = "\e[3 q"   " Replace mode - Underline
    let &t_EI = "\e[1 q"   " Normal mode - Block
else
    " Regular terminal
    let &t_SI = "\e[6 q"   " Insert mode - Beam
    let &t_SR = "\e[4 q"   " Replace mode - Underline
    let &t_EI = "\e[2 q"   " Normal mode - Block
endif

" Startify config
 
let g:startify_enable_fortune = 0  " Disable the fortune quote
let g:startify_padding_left = winwidth(0) / 3  " Center the menu


let g:ascii = [  
            \ '                                   ________  __ __        ',
            \ '              __                  /\_____  \/\ \\ \       ',
            \ '      __  __ /\_\    ___ ___      \/___//''/''\ \ \\ \    ',
            \ '     /\ \/\ \\/\ \ /'' __` __`\        /'' /''  \ \ \\ \_ ',
            \ '     \ \ \_/ |\ \ \/\ \/\ \/\ \      /'' /''__  \ \__ ,__\',
            \ '      \ \___/  \ \_\ \_\ \_\ \_\    /\_/ /\_\  \/_/\_\_/  ',
            \ '       \/__/    \/_/\/_/\/_/\/_/    \//  \/_/     \/_/    ',
            \ ]

let g:startify_custom_header =
          \ startify#pad(g:ascii)

" Coc (LSP) config

" Show documentation using (K key)
nnoremap <silent> K :call CocActionAsync('doHover')<CR>
" select element using Enter key
inoremap <silent><expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"

nnoremap <silent> f  :Files<CR>
nnoremap <silent> gf :GFiles<CR>
nnoremap <silent> tt :tabe<CR>
" Go to definition with gd
nnoremap <silent> gd <Plug>(coc-definition)

" Jump to previous/next error
nnoremap <silent> [g <Plug>(coc-diagnostic-prev)
nnoremap <silent> ]g <Plug>(coc-diagnostic-next)

" Commands
command NTT NERDTreeToggle " toggle file explorer using :NTT
command W T
command! W w

" Matching brackets, etc...
inoremap ( ()<Left>
inoremap [ []<Left>
inoremap { {}<Left>
inoremap ' ''<Left>
inoremap " ""<Left>
