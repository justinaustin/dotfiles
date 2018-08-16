set number

au BufNewFile,BufRead *.py *.rs
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix

au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2

""""" Colors
syntax enable

""""" VIM PLUG

call plug#begin()

Plug 'rust-lang/rust.vim' " Rust stuff
Plug 'tpope/vim-commentary' " comment/uncomment text with gc
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' } " file tree
Plug 'raimondi/delimitMate' " auto closing of quotes/parens/brackets/etc
Plug 'Yggdroot/indentLine' " vertical indentation lines
Plug 'tpope/vim-surround' " additional surroundings
Plug 'wellle/targets.vim' " adds more text objects
Plug 'justinmk/vim-sneak' " new motion (s) to goto position specified by two chars
Plug 'luochen1990/rainbow' " rainbow parens!
Plug 'gabrielelana/vim-markdown' " markdown plugin
Plug 'w0rp/ale' " language server
Plug 'vim-scripts/indentpython.vim' " python indentation
Plug 'vim-airline/vim-airline' " status bar
Plug 'plytophogy/vim-virtualenv' " python virtualenv
Plug 'vim-syntastic/syntastic' " syntax checker
Plug 'crusoexia/vim-monokai' " colorscheme
Plug 'joshdick/onedark.vim' " colorscheme
Plug 'morhetz/gruvbox' " colorscheme
Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}


call plug#end()

" colorscheme 

set background=dark
colorscheme onedark

""""" NERDTree 
map <C-n> :NERDTreeToggle<CR>
" close vim when only open window is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" open NERDTree automatically when vim starts on directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif


""""" Remapping for viewports and :terminal
" escaping terminal
tnoremap <esc><esc> <C-\><C-n>
" split pane
set splitbelow
set splitright
map <C-h> <C-w>h
map <C-l> <C-w>l
map <C-j> <C-w>j
map <C-k> <C-w>k

"""" Rainbow Parens
let g:rainbow_active = 1

""" Language Server
let g:ale_completion_enabled = 1

""" Flag extra whitespace as red
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

""" Syntastic
let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list = 1
let g:syntastic_chec_on_open = 1
let g:syntastic_check_on_wq = 0

""" deoplete
let g:deoplete#enable_at_startup = 1
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
