call denite#custom#var('file_rec', 'command',
      \ ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])

call denite#custom#map('insert', '<C-j>',
      \ '<denite:move_to_next_line>', 'noremap')
call denite#custom#map('insert', '<C-k>',
      \ '<denite:move_to_previous_line>', 'noremap')
call denite#custom#map('insert', "'",
      \ '<denite:move_to_next_line>', 'noremap')
call denite#custom#map('normal', 'r',
      \ '<denite:do_action:quickfix>', 'noremap')

call denite#custom#alias('source', 'file_rec/git', 'file_rec')
call denite#custom#var('file_rec/git', 'command',
      \ ['git', 'ls-files', '-co', '--exclude-standard'])

call denite#custom#option('default', 'prompt', '>')
call denite#custom#option('default', 'short_source_names', v:true)

let s:menus = {}
let s:menus.vim = {
    \ 'description': 'Vim',
    \ }
let s:menus.vim.file_candidates = [
    \ ['    > Edit configuation file (init.vim)', '~/.config/nvim/init.vim']
    \ ]
call denite#custom#var('menu', 'menus', s:menus)

call denite#custom#filter('matcher_ignore_globs', 'ignore_globs',
      \ [ '.git/', '.ropeproject/', '__pycache__/',
      \   'venv/', 'images/', '*.min.*', 'img/', 'fonts/'])

nnoremap <silent> ;r
      \ :<C-u>Denite -buffer-name=register
      \ register neoyank<CR>
xnoremap <silent> ;r
      \ :<C-u>Denite -default-action=replace -buffer-name=register
      \ register neoyank<CR>
nnoremap <silent> [Window]<Space>
      \ :<C-u>Denite file_rec:~/.vim/rc<CR>
nnoremap <silent> / :<C-u>Denite -buffer-name=search
      \ line<CR>
nnoremap <silent> * :<C-u>DeniteCursorWord -buffer-name=search
      \ -mode=normal line<CR>
nnoremap <silent> [Window]s :<C-u>Denite file_point file_old
      \ `finddir('.git', ';') != '' ? 'file_rec/git' : 'file_rec'`<CR>
nnoremap <silent><expr> tt  &filetype == 'help' ?  "g\<C-]>" :
      \ ":\<C-u>DeniteCursorWord -buffer-name=tag -immediately
      \  unite:tag unite:tag/include\<CR>"
nnoremap <silent><expr> tp  &filetype == 'help' ?
      \ ":\<C-u>pop\<CR>" : ":\<C-u>Denite -mode=normal jump\<CR>"
nnoremap <silent> [Window]n :<C-u>Denite dein<CR>
nnoremap <silent> [Window]g :<C-u>Denite ghq<CR>
nnoremap <silent> ;g :<C-u>Denite -buffer-name=search
      \ -no-empty -mode=normal grep<CR>
nnoremap <silent> n :<C-u>Denite -buffer-name=search
      \ -resume -mode=normal -refresh<CR>
nnoremap <silent> ft :<C-u>Denite filetype<CR>
nnoremap <silent> <C-t> :<C-u>Denite
      \ -select=`tabpagenr()-1` -mode=normal deol<CR>
nnoremap <silent> <C-k> :<C-u>Denite -mode=normal change jump<CR>
nnoremap <silent> [Space]gs :<C-u>Denite gitstatus<CR>

