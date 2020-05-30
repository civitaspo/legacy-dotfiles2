if !&compatible
  set nocompatible
endif

" reset augroup
augroup MyAutoCmd
  autocmd!
augroup END

" dein settings {{{
let s:cache_home = empty($XDG_CACHE_HOME) ? expand('~/.cache') : $XDG_CACHE_HOME
let s:dein_dir = s:cache_home . '/dein'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
if !isdirectory(s:dein_repo_dir)
  call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
endif
let &runtimepath = s:dein_repo_dir .",". &runtimepath
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  let g:rc_dir    = expand('~/.config/nvim')
  let s:toml      = g:rc_dir . '/dein.toml'
  let s:lazy_toml = g:rc_dir . '/deinlazy.toml'
  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

if has('vim_starting') && dein#check_install()
  call dein#install()
endif
" }}}

" TODO: Set correct path
let g:python3_host_prog = expand('/usr/local/.pyenv/versions/neovim/bin/python')

syntax on
set hlsearch
set nowrapscan
set nonumber
set showmatch " emphasize brackets pair
set wrap
set autoindent
set showcmd
set hidden
set noswapfile
set nobackup
set backspace=indent,eol,start
set ruler
set clipboard+=unnamedplus
set cursorline
set tabstop=2 shiftwidth=2 expandtab
highlight CursorLine cterm=underline ctermbg=235
set cursorcolumn
highlight CursorColumn ctermbg=235

filetype on
filetype indent on
filetype plugin on

au BufNewFile,BufRead *.sql       set tabstop=2 shiftwidth=2
au BufNewFile,BufRead *.js        set tabstop=2 shiftwidth=2 expandtab
au BufNewFile,BufRead *.json      set tabstop=2 shiftwidth=2 expandtab
au BufNewFile,BufRead *.coffee    set tabstop=2 shiftwidth=2 expandtab
au BufNewFile,BufRead *.scss      set tabstop=2 shiftwidth=2 expandtab
au BufNewFile,BufRead Gemfile     set tabstop=2 shiftwidth=2 expandtab filetype=ruby
au BufNewFile,BufRead Groupfile.* set tabstop=2 shiftwidth=2 expandtab filetype=ruby
au BufNewFile,BufRead IAMfile.*   set tabstop=2 shiftwidth=2 expandtab filetype=ruby
au BufNewFile,BufRead Alarmfile.* set tabstop=2 shiftwidth=2 expandtab filetype=ruby
au BufNewFile,BufRead Rulefile.*  set tabstop=2 shiftwidth=2 expandtab filetype=ruby
au BufNewFile,BufRead Routefile.* set tabstop=2 shiftwidth=2 expandtab filetype=ruby
au BufNewFile,BufRead *.watchr    set tabstop=2 shiftwidth=2 expandtab
au BufNewFile,BufRead *.rb        set tabstop=2 shiftwidth=2 expandtab
au BufNewFile,BufRead *.rake      set tabstop=2 shiftwidth=2 expandtab
au BufNewFile,BufRead *.yaml      set tabstop=2 shiftwidth=2 expandtab
au BufNewFile,BufRead *.yml       set tabstop=2 shiftwidth=2 expandtab
au BufNewFile,BufRead *.yml.erb   set tabstop=2 shiftwidth=2 expandtab filetype=yaml
au BufNewFile,BufRead *.erb       set tabstop=2 shiftwidth=2 expandtab
au BufNewFile,BufRead *.dig       set tabstop=2 shiftwidth=2 expandtab filetype=yaml
au BufNewFile,BufRead *.pl        set tabstop=4 shiftwidth=4 expandtab
au BufNewFile,BufRead *.pm        set tabstop=4 shiftwidth=4 expandtab
au BufNewFile,BufRead *.t         set tabstop=4 shiftwidth=4 expandtab
au BufNewFile,BufRead *.go        set tabstop=4 shiftwidth=4 expandtab
au BufNewFile,BufRead *.psgi      set tabstop=4 shiftwidth=4 expandtab
au BufNewFile,BufRead *.sh        set tabstop=4 shiftwidth=4 expandtab
au BufNewFile,BufRead Dockerfile  set tabstop=4 shiftwidth=4 expandtab

nmap <C-c> :q<CR>
nmap <C-x> :wq<CR>
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
