if executable('rg')
  call denite#custom#var('file/rec', 'command',
        \ ['rg', '--files', '--glob', '!.git', '--color', 'never'])
  call denite#custom#var('grep', {
        \ 'command': ['rg', '--threads', '1'],
        \ 'recursive_opts': [],
        \ 'final_opts': [],
        \ 'separator': ['--'],
        \ 'default_opts': ['-i', '--vimgrep', '--no-heading'],
        \ })
else
  call denite#custom#var('file/rec', 'command',
        \ ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])
endif

call denite#custom#source('file/old', 'matchers', [
      \ 'matcher/fruzzy', 'matcher/project_files', 'matcher/ignore_globs',
      \ ])
call denite#custom#source('tag', 'matchers', ['matcher/substring'])
call denite#custom#source('file/rec', 'matchers',
      \ ['matcher/fruzzy'])
call denite#custom#source('file/old,ghq', 'converters',
      \ ['converter/relative_word', 'converter/relative_abbr'])

call denite#custom#alias('source', 'file/git', 'file/rec')
call denite#custom#var('file/git', 'command',
      \ ['git', 'ls-files', '-co', '--exclude-standard'])

call denite#custom#alias('source', 'file/dirty', 'file/rec')
call denite#custom#var('file/dirty', 'command',
      \ ['git', 'ls-files', '-mo',
      \  '--directory', '--no-empty-directory', '--exclude-standard'])

" call denite#custom#option('default', 'prompt', '>')
" call denite#custom#option('default', 'short_source_names', v:true)
if has('nvim')
  call denite#custom#option('default', {
        \ 'highlight_filter_background': 'CursorLine',
        \ 'source_names': 'short',
        \ 'split': 'floating',
        \ 'filter_split_direction': 'floating',
        \ 'vertical_preview': v:true,
        \ 'floating_preview': v:true,
        \ })
else
  call denite#custom#option('default', {
        \ 'highlight_filter_background': 'CursorLine',
        \ 'source_names': 'short',
        \ 'vertical_preview': v:true,
        \ })
endif
call denite#custom#option('search', {
      \ 'highlight_filter_background': 'CursorLine',
      \ 'source_names': 'short',
      \ 'filter_split_direction': 'floating',
      \ })

let s:menus = {}
let s:menus.vim = {
    \ 'description': 'Vim',
    \ }
let s:menus.vim.file_candidates = [
    \ ['    > Edit configuation file (init.vim)', '~/.config/nvim/init.vim']
    \ ]
call denite#custom#var('menu', 'menus', s:menus)

call denite#custom#filter('matcher/ignore_globs', 'ignore_globs',
      \ [ '.git/', '.ropeproject/', '__pycache__/',
      \   'venv/', 'images/', '*.min.*', 'img/', 'fonts/'])

let s:denite_win_width_percent = 0.85
let s:denite_win_height_percent = 0.7

" Change denite default options
call denite#custom#option('default', {
    \ 'split': 'floating',
    \ 'winwidth': float2nr(&columns * s:denite_win_width_percent),
    \ 'wincol': float2nr((&columns - (&columns * s:denite_win_width_percent)) / 2),
    \ 'winheight': float2nr(&lines * s:denite_win_height_percent),
    \ 'winrow': float2nr((&lines - (&lines * s:denite_win_height_percent)) / 2),
    \ })
nnoremap <silent> [Window]<Space>
    \ :<C-u>Denite file/rec:~/.vim/rc<CR>
nnoremap <silent><expr> / wordcount().chars > 30000 ?
    \ ":\<C-u>Denite -buffer-name=search -start-filter
    \  -search line/external\<CR>" :
    \ ":\<C-u>Denite -buffer-name=search -start-filter -search line\<CR>"
nnoremap <silent><expr> * wordcount().chars > 30000 ?
    \ ":\<C-u>DeniteCursorWord -buffer-name=search -search line/external\<CR>" :
    \ ":\<C-u>DeniteCursorWord -buffer-name=search -search line\<CR>"
xnoremap <silent> *
    \ "qy:Denite -input=`@q` -buffer-name=search -search line<CR>
nnoremap <silent><expr> [Window]s finddir('.git', ';') != '' ?
    \ ":\<C-u>Denite -sorters=sorter/rank -unique
    \  file/point file/old file/dirty file/git file file:new\<CR>" :
    \ ":\<C-u>Denite -sorters=sorter/rank -unique
    \  file/point file/old file file:new\<CR>"
nnoremap <silent> n
    \ :<C-u>Denite -buffer-name=search -resume<CR>


augroup my_denite
   autocmd!
   autocmd FileType denite call s:denite_my_settings()
   autocmd FileType denite-filter call s:denite_filter_my_settings()
augroup END

function! s:denite_my_settings()
    nnoremap <silent><buffer><expr> <CR>
        \ denite#do_map('do_action')
    nnoremap <silent><buffer><expr> d
        \ denite#do_map('do_action', 'delete')
    nnoremap <silent><buffer><expr> p
        \ denite#do_map('do_action', 'preview')
    nnoremap <silent><buffer><expr> q
        \ denite#do_map('quit')
    nnoremap <silent><buffer><expr> i
        \ denite#do_map('open_filter_buffer')
    nnoremap <silent><buffer><expr> <Space>
        \ denite#do_map('toggle_select').'j'
    nnoremap <silent><buffer><expr> <C-Space>
        \ denite#do_map('toggle_select').'j'
    nnoremap <silent><buffer><expr><nowait> t
        \ denite#do_map('do_action', 'tabswitch')
    nnoremap <silent><buffer><expr> a
        \ denite#do_map('choose_action')
    nnoremap <silent><buffer><expr> <C-g>
        \ denite#do_map('echo')
endfunction

function! s:denite_filter_my_settings() abort
    augroup ftplugin-my-denite
        autocmd! * <buffer>
        autocmd InsertEnter <buffer> imap <silent><buffer> <CR> <ESC><CR><CR>
        autocmd InsertEnter <buffer> inoremap <silent><buffer> <Esc> <Esc><C-w><C-q>:<C-u>call denite#move_to_parent()<CR>
    augroup END

    imap <silent><buffer> <Esc> <Esc>:call denite#move_to_parent()<CR>
    imap <silent><buffer> <C-[> <C-[>:call denite#move_to_parent()<CR>
    inoremap <silent><buffer> <CR> <Esc>
        \:call denite#move_to_parent()<CR>
        \<CR>
    inoremap <silent><buffer> <C-CR> <Esc>
        \:call denite#move_to_parent()<CR>
        \<CR>
    inoremap <silent><buffer> <C-m> <Esc>
        \:call denite#move_to_parent()<CR>
        \<CR>
endfunction

