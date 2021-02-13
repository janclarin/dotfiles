" =============================================================================
" Jan Clarin's vim configuration file
" =============================================================================

" -----------------------------------------------------------------------------
" vim-plug
" -----------------------------------------------------------------------------
" Plugins directory
call plug#begin('~/.vim/plugged')

" Neovim plugins
if has('nvim')
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
endif

Plug 'altercation/vim-colors-solarized'
Plug 'dense-analysis/ale'
Plug 'godlygeek/tabular'        " for plasticboy/vim-markdown
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'pangloss/vim-javascript'
Plug 'plasticboy/vim-markdown'
Plug 'Raimondi/delimitMate'
Plug 'tomlion/vim-solidity'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Local plugins
if filereadable($HOME . "/.vimrc.plugins.local")
  source ~/.vimrc.plugins.local
endif

call plug#end()

" -----------------------------------------------------------------------------
" Theme settings
" -----------------------------------------------------------------------------
set t_Co=256
set background=dark
colorscheme solarized
let g:airline_theme='solarized'

" -----------------------------------------------------------------------------
" Basic settings
" -----------------------------------------------------------------------------
" UI config
set relativenumber              " enable line numbers based on current line
set number                      " show line numbers
set mouse=a                     " enable mouse support
set colorcolumn=80              " set marker at column 80
set cursorline                  " highlight current line
set hidden                      " keeps buffers when abandoned
set encoding=utf-8              " unicode character encoding
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
set smartindent                 " copy syntax/style of code being edited
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

" Language configs
" HTML/CSS/JavaScript: Use 2-space tabs as per Google Style guidelines
au BufNewFile,BufRead *.js,*.json,*.jsx,*.html,*.css,*.scss
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2

" -----------------------------------------------------------------------------
" Mappings
" -----------------------------------------------------------------------------
" Set map leader
let mapleader=' '

" Key mappings
inoremap jk <esc>
vnoremap v <esc>
nnoremap H ^
nnoremap L $
" Remove highlighting
nnoremap // :nohl<cr>
" Paste from clipboard
nnoremap <leader>v "+p

" Buffer managing mappings
nnoremap <leader>e :edit 
nnoremap <leader>l :bnext<cr>
nnoremap <leader>h :bprevious<cr>
nnoremap <leader>q :bdelete<cr>

" Move between panes using control and h, j, k, l
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Alias :W for :w
command! -bar -nargs=* -complete=file -range=% -bang W <line1>,<line2>write<bang> <args>

" -----------------------------------------------------------------------------
" Plugins
" -----------------------------------------------------------------------------
" ale settings
let g:ale_emit_conflict_warnings=0
let g:ale_fix_on_save=1

" delimitMate settings
let g:delimitMate_expand_cr=1

" deoplete settings
let g:deoplete#enable_at_startup = 1

" fzf mappings
nnoremap <C-T> :Files<cr>
nnoremap <leader><enter> :Buffers<cr>
nnoremap <leader>gl :Commits<cr>

" vim-airline settings
let g:airline#extensions#branch#enabled=1
let g:airline#extensions#tabline#enabled=1

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
nnoremap <leader>gp :Git pull<cr>
nnoremap <leader>gP :Git push<cr>

" vim-jsx settings
let g:jsx_ext_required=0

" vim-markdown settings
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_new_list_item_indent = 2

" -----------------------------------------------------------------------------
" Local configuration
" -----------------------------------------------------------------------------
if filereadable($HOME . "/.vimrc.local")
  source ~/.vimrc.local
endif
