" Plug 'rrethy/vim-hexokinase'

if has('nvim')
  " let g:Hexokinase_highlighters = ['backgroundfull']
  " let g:Hexokinase_highlighters = ['sign_column']
  let g:Hexokinase_highlighters = ['virtual']
  " set signcolumn=yes:2
else
  let g:Hexokinase_highlighters = ['backgroundfull']
endif
