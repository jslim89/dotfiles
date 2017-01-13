" pathogen plugin initialization
call pathogen#infect()
syntax on
filetype plugin indent on

" tab settings 
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set number

" status with required setttings for vim-powerline
" @see https://github.com/Lokaltog/vim-powerline
set ruler
set showcmd
set nocompatible   " Disable vi-compatibility
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show unicode glyphs
let g:Powerline_symbols = 'fancy'

" install the ubuntu mono font for vim-powerline
" @see https://github.com/scotu/ubuntu-mono-powerline
" set guifont=Ubuntu\ Mono\ 12

" status with required setttings for vim-jsx
" @see https://github.com/mxw/vim-jsx
" If you would like JSX in .js files, set it to 0
let g:jsx_ext_required = 1
" If you wish to restrict JSX to files with the pre-v0.12 @jsx React.DOM pragma, set to 1
let g:jsx_pragma_required = 0

" search
set incsearch 
set hlsearch

" keybindings
let mapleader = ","
imap jj <esc>
nmap ; :

" nerdtree
" @see https://github.com/scrooloose/nerdtree
nmap <leader>n :NERDTreeToggle<CR>

" ctags
" $ apt-get install exuberant-ctags
"
" the ; search for tags file from current directory till parent directory
" resursively until it finds a tags file
set tags=tags;
nmap <leader>t :TlistToggle<CR>
nmap <leader>f <C-]>
nmap <leader>g <C-T>
nmap <leader>gt :!/usr/bin/ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" tagbar
let g:tagbar_usearrows = 1
nnoremap <leader>b :TagbarToggle<CR>


" command-t
nmap <Leader>d :CommandT<CR>

" Map .less to .css, lessc is required.
nnoremap ,m :w <BAR> !lessc % > %:t:r.css<CR><space>

" HTML or XML or etc. opening tag and closing tag matching
autocmd FileType html,htmldjango,jinjahtml,eruby,mako let b:closetag_html_style=1
autocmd FileType html,xhtml,xml,htmldjango,jinjahtml,eruby,mako source ~/.vim/bundle/closetag.vim/plugin/closetag.vim

" highlight those characters that are over the length of 80 chars 
" http://stackoverflow.com/questions/235439/vim-80-column-layout-concerns 
highlight OverLength ctermbg=red ctermfg=white guibg=#592929 
match OverLength /\%81v.\+/ 

" block the usage of arrow keys
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" sudo write
ca w!! w !sudo tee >/dev/null "%"

" switch between paste and no paste mode fast and go into insert mode after
" that
" see http://vim.wikia.com/wiki/Toggle_auto-indenting_for_code_paste
nnoremap <leader>p :set invpaste paste?<CR>
set pastetoggle=<leader>p
set showmode

" color scheme
colorscheme default

" wild menu. more options shown in command mode
set wildmenu
set wildmode=list:longest,full

" Last file position
" @see http://vim.wikia.com/wiki/Restore_cursor_to_file_position_in_previous_editing_session
"
" Tell vim to remember certain things when we exit
"  '10  :  marks will be remembered for up to 10 previously edited files
"  "100 :  will save up to 100 lines for each register
"  :99  :  up to 99 lines of command-line history will be remembered
"  %    :  saves and restores the buffer list
"  n... :  where to save the viminfo files
set viminfo='10,\"100,:99,%,n~/.viminfo

function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction

augroup resCur
  autocmd!
  autocmd BufWinEnter * call ResCur()
augroup END

" List out all buffers
" @see http://of-vim-and-vigor.blogspot.com/p/vim-vigor-comic.html
nnoremap <leader>l :ls<CR>:b<space>

" Auto reload ~/.vimrc file upon saving
" @see http://vim.wikia.com/wiki/Change_vimrc_with_auto_reload
autocmd BufWritePost .vimrc source %

" Short to lauch several conque term tabs
nnoremap <leader>csb :ConqueTermTab bash<CR>
nnoremap <leader>csm :ConqueTermTab mysql -u root -p<CR>
