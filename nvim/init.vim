set number
set tabstop=4 shiftwidth=4 expandtab

""""" Colors
syntax enable

" colorscheme 

set background=dark
colorscheme gruvbox


""""" VIM PLUG

call plug#begin()

Plug 'rust-lang/rust.vim' " Rust stuff
Plug 'tpope/vim-commentary' " comment/uncomment text with gc
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } " autocompletion
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' } " file tree
Plug 'vim-syntastic/syntastic' " syntax checker 
Plug 'raimondi/delimitMate' " auto closing of quotes/parens/brackets/etc
Plug 'Yggdroot/indentLine' " vertical indentation lines
Plug 'tpope/vim-surround' " additional surroundings
Plug 'wellle/targets.vim' " adds more text objects
Plug 'justinmk/vim-sneak' " new motion (s) to goto position specified by two chars
Plug 'luochen1990/rainbow' " rainbow parens!

call plug#end()


""""" Deoplete Autocompletion
let g:deoplete#enable_at_startup = 1
if !exists('g:deoplete#omni#input_patters')
    let g:deoplete#omni#input_patters = {}
endif
" let g:deoplete#disable_auto_complete = 1
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
" Deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"


""""" NERDTree 
map <C-n> :NERDTreeToggle<CR>
" close vim when only open window is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" open NERDTree automatically when vim starts on directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

""""" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%* 

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open = 1
" Rust syntastic integration
" let g:syntastic_rust_checkers = ['rustc'] " Not working correctly though...


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
