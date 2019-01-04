set number

au BufNewFile,BufRead *.py,*.rs,*.json,
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

au BufNewFile,BufRead *.js,*.html,*.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
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
Plug 'vim-airline/vim-airline' " status bar
Plug 'plytophogy/vim-virtualenv' " python virtualenv
Plug 'crusoexia/vim-monokai' " colorscheme
Plug 'joshdick/onedark.vim' " colorscheme
Plug 'morhetz/gruvbox' " colorscheme
Plug 'RRethy/vim-illuminate' " auto highlight words under cursor
Plug 'Konfekt/FastFold' " fast folding
Plug 'tmhedberg/SimpylFold' " python folding
Plug 'ncm2/ncm2' " completion manager
Plug 'roxma/nvim-yarp' " completion manager
Plug 'autozimu/LanguageClient-neovim', {'branch': 'next', 'do': 'bash install.sh'} " languageserver client
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'ambv/black' " black code formatting for python
""" completion sources for ncm2
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-github'
Plug 'ncm2/ncm2-tmux'
Plug 'yuki-ycino/ncm2-dictionary'
Plug 'ncm2/ncm2-jedi'
Plug 'ncm2/ncm2-racer'


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

""" ncm2
" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect

" use tab to autocomplete
inoremap <expr> <tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

set shortmess+=c


""" vim illuminate
let g:Illuminate_delay = 250

""" fast fold
nmap zuz <Plug>(FastFoldUpdate)
let g:fastfold_savehook = 1
let g:fastfold_fold_command_suffixes =  ['x','X','a','A','o','O','c','C']
let g:fastfold_fold_movement_commands = [']z', '[z', 'zj', 'zk']
let g:markdown_folding = 1
let g:tex_fold_enabled = 1
let g:vimsyn_folding = 'af'
let g:xml_syntax_folding = 1
let g:javaScript_fold = 1
let g:sh_fold_enabled= 7
let g:ruby_fold = 1
let g:perl_fold = 1
let g:perl_fold_blocks = 1
let g:r_syntax_folding = 1
let g:rust_fold = 1
let g:php_folding = 1

""" Auto black format python code
" autocmd BufWritePre *.py execute ':Black'

""" python 3 provider (for consistency across python virtualenvs)
let g:python_host_prog = '/home/ubuntu/anaconda3/bin//python'
let g:python3_host_prog = '/home/ubuntu/anaconda3/bin//python3'

""" Black python config
let g:black_linelength = 100

""" Ale Linters Config
let g:ale_linters = {
\ 'python': ['black', 'isort', 'mypy']
\}

""" No auto line breaks
set textwidth=0
