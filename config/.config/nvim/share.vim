syntax on
set hlsearch
set nowrapscan
set nonumber
set showmatch " emphasize brackets pair
set ignorecase
set smartcase
set wrap
set autoindent
set showcmd
set hidden
set noswapfile
set nobackup
set backspace=indent,eol,start
set ruler
set clipboard+=unnamedplus
set scrolloff=10
set cursorline
set tabstop=2 shiftwidth=2 expandtab
highlight CursorLine cterm=underline ctermbg=235
set cursorcolumn
highlight CursorColumn ctermbg=235

nmap     <C-c>        :q<CR>
nmap     <C-x>        :wq<CR>
nnoremap <C-f>        <Right>
inoremap <C-f>        <Right>
vnoremap <C-f>        <Right>
nnoremap <C-b>        <Left>
inoremap <C-b>        <Left>
vnoremap <C-b>        <Left>
inoremap <C-a>        <Home>
nnoremap <C-a>        <Home>
inoremap <C-e>        <End>
nnoremap <C-e>        <End>
inoremap <C-p>        <Up>
inoremap <C-n>        <Down>
inoremap <c-h>        <bs>
inoremap <c-d>        <del>
inoremap <c-k>        <c-o>D
inoremap <c-u>        <c-o>d^
inoremap <c-w>        <c-o>db