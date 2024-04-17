set nocompatible              " be iMproved, required
set termguicolors     " enable true colors support
filetype off                  " required
let mapleader = " " 
set encoding=UTF-8
set cursorline
if version >= 703
    set undodir=~/.vim/backup
    set undofile
    set undoreload=10000
endif
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'undleVim/Vundle.vim'
Plugin 'dylanaraps/wal.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'lilydjwg/colorizer'
Plugin 'Exafunction/codeium.vim'
Plugin 'ycm-core/YouCompleteMe'
Plugin 'tpope/vim-surround' " Surrounding ysw)
Plugin 'preservim/nerdtree' " NerdTree
Plugin 'tpope/vim-commentary' " For Commenting gcc & gc
Plugin 'ap/vim-css-color' " CSS Color Preview
" Plugin 'rafi/awesome-vim-colorschemes' " Retro Scheme
" Plugin 'neoclide/coc.nvim'  " Auto Completion
Plugin 'ryanoasis/vim-devicons' " Developer Icons
Plugin 'tc50cal/vim-terminal' " Vim Terminal
Plugin 'preservim/tagbar' " Tagbar for code navigation
Plugin 'terryma/vim-multiple-cursors' " CTRL + N for multiple cursors
Plugin 'Yggdroot/indentLine'
Plugin 'ayu-theme/ayu-vim'
Plugin 'bluz71/vim-nightfly-colors', { 'as': 'nightfly' }
call vundle#end()
"au BufNewFile,BufRead *.lua, *.json, *.jsonc
"  \imap <C-f> <C-o>$,
let g:indentLine_char = '▏'
let g:indentLine_enabled = 1
set clipboard=unnamed

nmap <leader>k <plug>(YCMHover)
nnoremap Y y$
nnoremap n nzz
nnoremap N Nzz
nnoremap <silent><Leader>e :NERDTreeToggle<CR>
" nnoremap <C-l> :call CocActionAsync('jumpDefinition')<CR>
nnoremap <Leader>r :%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>
set completeopt-=preview " For No Previews

let g:NERDTreeDirArrowExpandable=""
let g:NERDTreeDirArrowCollapsible=""

inoremap <silent><C-f> <C-o>$
inoremap <Silent>( ()<Esc>i
inoremap <silent>{ {}<Esc>i
inoremap <silent>[ []<Esc>i
inoremap <silent>< <><Esc>i
inoremap <silent>" ""<Esc>i
inoremap <silent>' ''<Esc>i
nnoremap <silent>sf :Ex<Return>
nnoremap <C-j> :call CocActionAsync('jumpDefinition')<CR>
let g:ycm_warning_symbol = '▏'
imap <silent><C-k> <Plug>(YCMToggleSignatureHelp)

" nnoremap <silent><A-k> V:m '<-2<CR>gv=gv<Esc>
" nnoremap <silent><A-j> V:m  >+1<CR>gv=gv<Esc>
vnoremap <silent>K :m '<-2<CR>gv=gv
vnoremap <silent>J :m '>+1<CR>gv=gv
inoremap <silent><C-/>  <Esc>gcci
highlight YcmErrorLine guibg=#3f0000



/* colorscheme solarized8 " my favorite colorschemes: space-vim-dark, sonokai, solarized8, ayu wal */
" let ayucolor="light"  " for light version of theme
" let ayucolor="mirage" " for mirage version of theme
" let ayucolor="dark"   " for dark version of theme
" colorscheme ayu
colorscheme nightfly
" let g:airline_theme='simple'
let g:airline#extensions#tabline#enabled = 1
vmap <silent><Leader>y !wl-copy<Return>u
nmap <silent><Leader>yy <S-v>!wl-copy<Return>u
nmap <silent>te :tabedit<Return>
nmap <silent><Tab> :tabNext<Return>
nmap <silent><S-Tab> :tabprev<Return>
nmap <silent>te :tabedit<Return>
" Description: Keymaps

" Delete without yank
nnoremap x "_x
" nnoremap y "*y
" Increment/decrement
nnoremap + <C-a>
nnoremap - <C-x>

" Delete a word backwards
nnoremap dw vb"_d

" Select all
nmap <C-a> gg<S-v>G

" Search for selected text, forwards or backwards.
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>

"-----------------------------
" Tabs
" Open current directory

"------------------------------
" Windows

" Split window
nmap <silent>ss :split<Return><C-w>w
nmap <silent>sv :vsplit<Return><C-w>w
" Move window
nmap <Space> <C-w>w
map <silent><Esc> :nohlsearch<Return>
map s<left> <C-w>h
map s<up> <C-w>k
map s<down> <C-w>j
map s<right> <C-w>l
map sh <C-w>h
map sk <C-w>k
map sj <C-w>j
map sl <C-w>l
" Resize window
nmap <C-left> <C-w><
nmap <C-right> <C-w>>
nmap <C-up> <C-w>+
nmap <C-down> <C-w>-

" set clipboard=unnamedplus
set nocompatible
set incsearch
set ignorecase
set hlsearch
set number
syntax enable
set fileencodings=utf-8,sjis,euc-jp,latin
set encoding=utf-8
set title
set autoindent
set background=dark
set nobackup
set hlsearch
set showcmd
set cmdheight=1
set laststatus=2
set scrolloff=10
set expandtab
"let loaded_matchparen = 1
set history=10000
set shell=fish
set backupskip=/tmp/*
set nosc noru nosm
" Don't redraw while executing macros (good performance config)
set lazyredraw
"set showmatch
" How many tenths of a second to blink when matching brackets
"set mat=2
" Ignore case when searching
set ignorecase
" Be smart when using tabs ;)
set smarttab
" indents
filetype plugin indent on
set shiftwidth=2
set tabstop=2

let g:airline_left_sep =''
let g:airline_left_alt_sep=''
let g:airline_right_sep=''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch=''
let g:airline_symbols.readonly=''
let g:airline_symbols.linenr='  '
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep =''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''
augroup MyYCMCustom
  autocmd!
  autocmd FileType py let b:ycm_hover = {
    \ 'command': 'GetDoc',
    \ 'syntax': &filetype
    \ 'popup_params': {
    \     'maxwidth': 80,
    \     'border': [],
    \     'borderchars': ['─', '│', '─', '│', '┌', '┐', '┘', '└'],
    \   },
    \ }
augroup END
" Misterioso kitty theme
