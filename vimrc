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
  Plug 'neovim/nvim-lspconfig'
  Plug 'williamboman/mason.nvim'
  Plug 'williamboman/mason-lspconfig.nvim'
endif


Plug 'godlygeek/tabular'        " for plasticboy/vim-markdown
Plug 'herringtondarkholme/yats.vim'
Plug 'jparise/vim-graphql'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'lifepillar/vim-solarized8'
Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins' }
Plug 'plasticboy/vim-markdown'
Plug 'Raimondi/delimitMate'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'tpope/vim-rhubarb'
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
colorscheme solarized8
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
au BufNewFile,BufRead *.js,*.json,*.jsx,*.html,*.css,*.scss,*.ts,*.tsx
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2

" Fix syntax highlighting for very long files
au BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
au BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

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
nnoremap <esc> :nohl<cr>
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

if has('nvim')
    set omnifunc=v:lua.vim.lsp.omnifunc
endif

" delimitMate settings
let g:delimitMate_expand_cr=1

" deoplete settings
let g:deoplete#enable_at_startup = 1

" fzf mappings
nnoremap \ :Rg<cr>
nnoremap <C-T> :GFiles<cr>
nnoremap <C-G> :Files<cr>
nnoremap <leader><enter> :Buffers<cr>
nnoremap <leader>gl :Commits<cr>

" vim-airline settings
let g:airline#extensions#branch#enabled=1
let g:airline#extensions#tabline#enabled=1

" vim-markdown settings
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_new_list_item_indent = 2

set cmdheight=2                 " allow more space for displaying messages
set shortmess+=c                " do not pass messages to |ins-completion-menu|
set updatetime=300              " decrease update delay from default of 4000ms

" Disable backups due to language server issues with backup files (#649).
set nobackup
set nowritebackup

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" -----------------------------------------------------------------------------
" Local configuration
" -----------------------------------------------------------------------------
if filereadable($HOME . "/.vimrc.local")
  source ~/.vimrc.local
endif
