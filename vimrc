" Vim configuration file

" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

" vim-plug plugins
Plug 'chriskempson/base16-vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'junegunn/vader.vim'
Plug 'klen/python-mode', { 'for': 'python' }
Plug 'mxw/vim-jsx', { 'for': 'javascript'}
Plug 'pangloss/vim-javascript', { 'for': 'javascript'}
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'w0rp/ale'

" Initialize plugin system
call plug#end()

" Use vim settings over vi settings
set nocompatible

" Theme
colorscheme base16-eighties

" ale settings
let g:ale_emit_conflict_warnings=0

" ctrlp settings
let g:ctrlp_match_window='bottom,order:ttb'
let g:ctrlp_switch_buffer=0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_custom_ignore='node_modules\|^\.DS_Store\|^\.git'
" Ignore files in .gitignore
let g:ctrlp_user_command=['.git', 'cd %s && git ls-files -co --exclude-standard']

" vim-airline settings
let g:airline_theme='base16_eighties'
let g:airline#extensions#branch#enabled=1
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#buffer_nr_show=1

" delimitMate settings
let delimitMate_expand_cr=1

" vim-jsx settings
let g:jsx_ext_required=0

" python-mode settings
let g:pymode_breakpoint=0
let g:pymode_folding=0
let g:pymode_lint=1
let g:pymode_python='python3'
let g:pymode_rope=0
let g:pymode_run=0
let g:pymode_syntax=1
let g:pymode_syntax_all=1
let g:pymode_syntax_indent_errors=g:pymode_syntax_all
let g:pymode_syntax_space_errors=g:pymode_syntax_all
let g:pymode_virtualenv=1

" Set map leader
let mapleader=' '

" Key mappings
nnoremap ; :
inoremap jk <esc>
vnoremap v <esc>
nnoremap j gj
nnoremap k gk
nnoremap H ^
nnoremap L $
" Remove highlighting
nnoremap // :nohl<cr>
" Paste from clipboard
nnoremap <leader>v "+p

" Buffer managing mappings
nnoremap <leader>be :edit 
nnoremap <leader>ba :badd 
nnoremap <leader>l :bnext<cr>
nnoremap <leader>h :bprevious<cr>
nnoremap <leader>q :bdelete<cr>
" Switch to buffer number
nnoremap <leader>1 :1b<cr>
nnoremap <leader>2 :2b<cr>
nnoremap <leader>3 :3b<cr>
nnoremap <leader>4 :4b<cr>
nnoremap <leader>5 :5b<cr>
nnoremap <leader>6 :6b<cr>
nnoremap <leader>7 :7b<cr>
nnoremap <leader>8 :8b<cr>
nnoremap <leader>9 :9b<cr>
nnoremap <leader>0 :10b<cr>

" vim-fugitive mappings
nnoremap <leader>gb :Gblame<cr>
nnoremap <leader>gB :Gbrowse<cr>
nnoremap <leader>gc :Gcommit<cr>
nnoremap <leader>gd :Gdiff<cr>
nnoremap <leader>gg :Ggrep<space>
nnoremap <leader>gm :Gmove<cr>
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gw :Gwrite<cr>
nnoremap <leader>gW :Gwq<cr>
nnoremap <leader>git :Git<space>
nnoremap <leader>gl :Git log --pretty=oneline -n 20 --graph --abbrev-commit<cr>
nnoremap <leader>gp :Git pull<cr>
nnoremap <leader>gP :Git push<cr>

" Language configs
" HTML/CSS/JavaScript: Use 2-space tabs as per Google Style guidelines
au BufNewFile,BufRead *.js,*.json,*.html,*.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2

" UI Config
set mouse=a                     " enable mouse support
set colorcolumn=80              " set marker at column 80
set cursorline                  " highlight current line
set hidden                      " keeps buffers when abandoned
set encoding=utf-8              " unicode character encoding
set number                      " show line numbers
set ruler                       " show ruler
set showcmd                     " show command in bottom bar
set showmatch                   " highlight matching [{()}]
set showmode                    " always show current editing mode
set scrolloff=5                 " maintains 5 lines above cursor when scrolling
set laststatus=2                " always display status line
set visualbell                  " visual bell enabled
set splitbelow                  " split windows appear below
set splitright                  " split windows appear to the right
set wildmenu                    " enable completion on the command line
set wildmode=list:longest       " list all matches
set ttyfast                     " fast terminal connection
set lazyredraw                  " redraw only when it needs to

" Formatting
set tabstop=4                   " number of visual spaces per tab
set softtabstop=4               " number of spaces in tab when editing
set shiftwidth=4                " number of spaces for autoindenting
set expandtab                   " use spaces in place of tabs
set smarttab                    " use shiftwidth setting for inserting tabs
set shiftround                  " use multiple of shiftwidth when indenting
set autoindent                  " allow autoindentation
set copyindent                  " copy previous level of indentation
set backspace=indent,eol,start  " allow backspaces over everything

" Searching
set incsearch                   " search as characters are entered
set hlsearch                    " highlight matches
set ignorecase                  " ignore case on search
set smartcase                   " ignore case if all lowercase

" Set command timeout length
set ttimeout
set ttimeoutlen=100

" Set backup file directory
set backupdir=~/.vim/tmp        
set directory=~/.vim/tmp
