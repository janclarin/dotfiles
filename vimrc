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
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
endif

Plug 'altercation/vim-colors-solarized'
Plug 'dense-analysis/ale'
Plug 'godlygeek/tabular'        " for plasticboy/vim-markdown
Plug 'herringtondarkholme/yats.vim'
Plug 'jparise/vim-graphql'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins' }
Plug 'pangloss/vim-javascript'
Plug 'plasticboy/vim-markdown'
Plug 'Raimondi/delimitMate'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'tomlion/vim-solidity'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'yuezk/vim-js'

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

" vim-fugitive mappings
nnoremap <leader>gb :Git blame<cr>
nnoremap <leader>gh :GBrowse<cr>
nnoremap <leader>gc :Git commit<cr>
nnoremap <leader>gd :Git diff<cr>
nnoremap <leader>gg :Ggrep<space>
nnoremap <leader>gm :GMove<cr>
nnoremap <leader>gs :Git<cr>
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
" CoC settings
" -----------------------------------------------------------------------------
let g:coc_global_extensions = [
\ 'coc-css',
\ 'coc-eslint',
\ 'coc-html',
\ 'coc-java',
\ 'coc-json',
\ 'coc-prettier',
\ 'coc-pyright',
\ 'coc-tsserver',
\]

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

" Apply code action to current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Auto-fix current line.
nmap <leader>qf  <Plug>(coc-fix-current)
" Rename current symbol.
nmap <leader>rn <Plug>(coc-rename)

" Navigate code.
nmap <silent>gd <Plug>(coc-definition)
nmap <silent>gy <Plug>(coc-type-definition)
nmap <silent>gi <Plug>(coc-implementation)
nmap <silent>gr <Plug>(coc-references)

" Move cursor to previous error.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
" Move cursor to next error.
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use <tab> to trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Make <cr> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible()
    \? coc#_select_confirm()
    \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
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
