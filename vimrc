" Zotax's vimrc - 19.02.2019
" numbering
set number
syntax enable
set background=dark
" custom colorshame https://github.com/altercation/vim-colors-solarized
colorscheme solarized
" workaroung to get background dark
hi Normal ctermbg=none
" tabs in edit and normal mode set to 4 spaces
set tabstop=4
set softtabstop=4
" cursor highlight
set cursorline
" automatically interpretes indents in files such as python
filetype indent on
" used for multiple files opening
set wildmenu
" show matching [{()}]
set showmatch
" search as charactes are entered
set incsearch
" highlight matches
set hlsearch
" mapped ,+space to disable already hightlighted search results
nnoremap ,<space> :nohlsearch<CR>
" path to python for vim powerline
let $PYTHONPATH="/usr/bin/python3"
" tells powerline which python should be used
let g:powerline_pycmd = 'py3'
" sets powerline to appear all the time
set laststatus=2
