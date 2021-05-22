" Plug 'itchyny/lightline.vim'

" lightline config
let g:lightline#bufferline#filename_modifier = ':t'
" let g:lightline#bufferline#filename_modifier = ':~:.'
let lightline#bufferline#enable_devicons = 1
let g:lightline#bufferline#modified = ' ●'

" Other lightline themes
" 'colorscheme': 'powerlineish',
" 'colorscheme': 'gruvbox_material',
" 'colorscheme': 'gruvbox',
" 'colorscheme': 'ayu_dark',
" 'colorscheme': 'simpleblack',
" 'colorscheme': 'spaceway', "this is my custom lightline colorscheme

let g:lightline = {
      \ 'colorscheme': 'spaceway',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'gitbranch', 'gitgutter', 'readonly', 'filename', 'modified' ] ],
      \   'right': [ [ 'lineinfo', 'syntastic' ],
      \              [ 'mytotallines' ],
      \              [ 'percent' ],
      \              [ 'charcode' ],
      \              [ 'filetype' ] ],
      \ },
      \ 'component': {
      \   'lineinfo': '%3l:%-2v%<',
      \ },
      \ 'tabline': {
      \   'left': [ ['buffers'] ],
      \   'right': [ [''] ]
      \ },
      \ 'component_expand': {
      \   'buffers': 'lightline#bufferline#buffers'
      \ },
      \ 'component_type': {
      \   'buffers': 'tabsel'
      \ },
      \ 'component_function': {
      \   'gitbranch': 'LightLineGitBranch',
      \   'gitgutter': 'LightLineGitGutter',
      \   'filename': 'FilenameForLightline',
      \   'mytotallines': 'MyTotalLines',
      \   'charcode': 'LightlineCharcode'
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '|', 'right': '|' }
      \ }

"" Arrow separator
" \ 'separator': { 'left': '', 'right': '' },
" \ 'subseparator': { 'left': '', 'right': '' }
"" Fire separator
" \ 'separator': { 'left': "\ue0c0", 'right': "\ue0c2" },
" \ 'subseparator': { 'left': "\ue0c1", 'right': "\ue0c3" }

" Show file path (or parent dir only %:h) in lightline
function! FilenameForLightline()
    " return expand('%')
    " return expand('%:~:h')
    " return winwidth(0) > 70 ? expand('%:~:h') : pathshorten(fnamemodify(expand('%'), ":."))
    return winwidth(0) > 100 ? expand('%') : pathshorten(fnamemodify(expand('%'), ":."))
    " return pathshorten(expand('%:~:h'))
endfunction

function! MyTotalLines()
  " return line('.') . '/' . line('$')
  return line('$') . "\ue0a1"
endfunction

function! LightLineGitBranch()
  if exists("*gitbranch#name")
    let branch = gitbranch#name()
    return branch !=# '' ? "\ue0a0 ".branch : ''
  endif
  return ''
endfunction

function! LightLineGitGutter() abort
  if exists('*GitGutterGetHunkSummary')
    let [ added, modified, removed ] = GitGutterGetHunkSummary()
    let summary = ""
    if added
      let summary = '✚'.added
    endif
    if modified
      let summary = summary.'●'.modified
    endif
    if removed
      let summary = summary.'✖'.removed
    endif
    return summary
  endif
  return ''
endfunction

function! LightlineCharcode() abort
  let line = getline('.')
  let col = col('.')
  " return col - 1 < len(line) ? printf('U+%04x', char2nr(matchstr(line[(col - 1):], '^.'))) : ''
  return col - 1 < len(line) ? printf('U+%04x', char2nr(matchstr(getline('.'), '\%' . col('.') . 'c.'))) : ''
endfunction

" " Show file path in lightline using vim fugitive
" function! LightlineFilename()
"   let root = fnamemodify(get(b:, 'git_dir'), ':h')
"   let path = expand('%:p')
"   if path[:len(root)-1] ==# root
"     return path[len(root)+1:]
"   endif
"   return expand('%')
" endfunction

