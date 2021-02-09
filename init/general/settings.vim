" Vim general settings

" turn on 'detection', 'plugin' and 'indent' at once
filetype plugin indent on

" syntax on                           " enable syntax highlighting
syntax enable                         " enable syntax highlighting
set number                            " sets absolute line numbers
" set relativenumber                  " sets relative line numbers
set termguicolors                     " uses highlight-guifg and highlight-guibg attributes in the terminal
set cursorline                        " highlight current line
set mouse=a                           " Enable your mouse
set wrap                              " Always wrap long lines
set linebreak                         " Always wrap long lines
set nolist                            " Always wrap long lines
set tabstop=2                         " number of spaces inserted when tab is pressed
set shiftwidth=2                      " number of space characters inserted for indentation
set expandtab                         " inserts spaces when tab key is pressed
set autoindent                        " Copy indent from current line when starting a new line
set smartindent                       " smart autoindenting when starting a new line.
set cindent                           "Like smartindent, but stricter and more customisable
set breakindent                       " Every wrapped line will continue visually indented
" set conceallevel=2                    " how text with the 'conceal' syntax attribute is shown
set clipboard=unnamed                 " Use system clipboard
set backspace=indent,eol,start        " Enable Backspace
set noshowmode                        " don't put a message on the last line
set laststatus=2                      " shows a status line always
" set showtabline=2                     " shows line with tab page labels
set ignorecase                        " the case of normal letters is ignored
set smartcase                         " ignore case when the pattern contains lowercase letters only
set nobackup                          " no backup files
set nowritebackup                     " no backup file
set noswapfile                        " no swap files
" set scrolloff=999                   " keep cursor centered vertically
set scrolloff=5                       " keep cursor centered vertically
" set showbreak=↪\                      " line break character for wrapped lines
" set showbreak=↳\                    " line break character for wrapped lines
set autowrite                         " saves buffer when changing files
set autoread                          " Always reload buffer when external changes detected
set nohlsearch                        " Turn off highlighting until next search
" set cmdheight=1                       " Set the cmdheight line to 1 only
set belloff=all                       " set bell off
let &t_Cs = "\e[4:3m"                 " udercurl for spelling checking
let &t_Ce = "\e[4:0m"                 " udercurl for spelling checking
