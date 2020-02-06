" vim: fdm=marker ts=4 sw=4 tw=0 et:

" >>> General {{{

" Disable vi-compatibility. This should always set first.
set nocompatible

" }}}

" >>> Indentation {{{

" Enable language-dependent indenting.
filetype plugin indent on

" Global indentation settings, overriden by ftplugin.
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab

" }}}

" >>> User Interfaces {{{

" Syntax & color scheme
syntax on

" Tell terminal your console support 256 colors. Set before colorscheme.
set t_Co=256
colorscheme default
set background=light


" status with required setttings for vim-powerline
" @see https://github.com/Lokaltog/vim-powerline
set ruler
set showcmd
set nocompatible   " Disable vi-compatibility
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show unicode glyphs
set number
set showmode
let g:Powerline_symbols = 'fancy'

" prevent cursor stuck at top or bottom
" @see https://news.ycombinator.com/item?id=9574469
set scrolloff=6

" ignore case when in ex (command) mode
" @see http://stackoverflow.com/a/10308100
" set ignorecase
" set smartcase

" search
set gdefault " /g search and replace globally by default
set incsearch 
set hlsearch
nmap <silent> ,/ :nohlsearch<CR>

" wild menu. more options shown in command mode
set wildmenu
set wildmode=list:longest,full

" fold settings
set nofoldenable
set foldmethod=indent
set foldlevel=1

" hides buffers and don't close them
set hidden


" set filename in Tmux tab
" @see http://stackoverflow.com/a/29693196/1935866
autocmd BufEnter * call system("tmux rename-window " . expand("%:t"))
autocmd VimLeave * call system("tmux rename-window bash")
autocmd BufEnter * let &titlestring = ' ' . expand("%:t")
set title

" copy and paste from mouse
" @see http://unix.stackexchange.com/a/140584
set mouse=r

" full screen when starting gvim
" @see http://vim.wikia.com/wiki/Maximize_or_set_initial_window_size
if has("gui_running")
    " GUI is running or is about to start.
    " Maximize gvim window (for an alternative on Windows, see simalt below).
    set lines=999 columns=999
else
    " This is console Vim.
    " if exists("+lines")
    "     set lines=50
    " endif
    " if exists("+columns")
    "     set columns=100
    " endif
endif

" font
if has("gui_running")
    set guifont=Monospace\ 12
endif

" >>> Global Key Bindings {{{

" leader key
let mapleader = ","
imap jj <esc>
nmap ; :
noremap ;; ;

" Key bindings which use <leader> key. In alphabetical order.
nmap        <leader>- <C-w>-            " decrease pane size
map         <leader>= <C-w>+            " increase pane size
nnoremap    <Leader>/ :nohlsearch<cr>   " clear current search

nmap        <Leader>e :CtrlP<cr>
nmap        <Leader>ee :MRU<cr>
nmap        <Leader>b :Ack<space>

nmap        <Leader>ga <Plug>GitGutterStageHunk
nmap        <leader>gj <Plug>GitGutterNextHunk
nmap        <leader>gk <Plug>GitGutterPrevHunk
nmap        <Leader>gr <Plug>GitGutterUndoHunk
nmap        <Leader>gv <Plug>GitGutterPreviewHunk

" nerdtree
" @see https://github.com/scrooloose/nerdtree
nmap <leader>n :NERDTreeToggle<CR>

" command-t
nmap <Leader>d :CommandT<CR>

" ctags
" $ apt-get install exuberant-ctags
"
" the ; search for tags file from current directory till parent directory
" resursively until it finds a tags file
set autochdir
set tags+=./tags;
nmap <leader>t :TlistToggle<CR>
nmap <leader>f <C-]>
nmap <leader>g <C-T>
nmap <leader>gt :!/usr/bin/ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" switch between paste and no paste mode fast and go into insert mode after
" that
" see http://vim.wikia.com/wiki/Toggle_auto-indenting_for_code_paste
nnoremap <leader>p :set invpaste paste?<CR>
set pastetoggle=<leader>p

" block the usage of arrow keys
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" List out all buffers
" @see http://of-vim-and-vigor.blogspot.com/p/vim-vigor-comic.html
nnoremap <leader>l :ls<CR>:b<space>

" Short to lauch several conque term tabs
nnoremap <leader>csb :ConqueTermTab bash<CR>
nnoremap <leader>csm :ConqueTermTab mysql -u root -p<CR>

" Prevent accidentally invoking Ex mode. You don't need it.
" @see http://www.bestofvim.com/tip/leave-ex-mode-good/
nnoremap Q :echoe "CAP LOCK is on!"<CR>

" Session management
map <F2> :mksession! ~/.vim/session <CR>
map <F3> :source ~/.vim/session <CR>

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
" }}}

" >>> Plugins {{{

" Automatic vim-plug installation
" @see https://github.com/junegunn/vim-plug/wiki/faq
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

" Begin plugins bootstrap
call plug#begin()

Plug 'airblade/vim-gitgutter'
Plug 'mileszs/ack.vim'
Plug 'wincent/command-t'
Plug 'tpope/vim-markdown'
Plug 'scrooloose/nerdtree'
Plug 'itchyny/lightline.vim'
Plug 'ervandew/supertab'
Plug 'vim-scripts/taglist.vim'
Plug 'jwalton512/vim-blade'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'posva/vim-vue'
Plug 'flazz/vim-colorschemes'
Plug 'terryma/vim-multiple-cursors'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'branch': 'release/1.x',
  \ 'for': [
    \ 'javascript',
    \ 'typescript',
    \ 'css',
    \ 'less',
    \ 'scss',
    \ 'json',
    \ 'graphql',
    \ 'markdown',
    \ 'vue',
    \ 'lua',
    \ 'php',
    \ 'python',
    \ 'ruby',
    \ 'html',
    \ 'swift' ] }
Plug 'junegunn/seoul256.vim'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-commentary'
Plug 'othree/yajs.vim'
Plug 'mxw/vim-jsx'
Plug 'dense-analysis/ale'

" Add plugins to &runtimepath
call plug#end()

" colorscheme default
" Color scheme https://github.com/junegunn/seoul256.vim
let g:seoul256_background = 235
colo seoul256
set background=dark " other option: light

" ale settings
let g:ale_fix_on_save = 1
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_linters = {
\   'python': ['flake8', 'pylint'],
\   'javascript': ['eslint'],
\   'vue': ['eslint']
\}
let g:ale_fixers = {
\   'javascript': ['prettier', 'eslint'],
\   'typescript': ['prettier', 'tslint'],
\   'vue': ['eslint'],
\   'scss': ['prettier'],
\   'html': ['prettier'],
\   'php': ['php_cs_fixer', 'trim_whitespace'],
\   'reason': ['refmt']
\}
let g:ale_fix_on_save = 1
nnoremap ]r :ALENextWrap<CR>     " move to the next ALE warning / error
nnoremap [r :ALEPreviousWrap<CR> " move to the previous ALE warning / error

" supertab settings
let g:SuperTabDefaultCompletionType = "<C-X><C-O>"
let g:SuperTabDefaultCompletionType = "context"

" code prettier
nmap <Leader>! <Plug>(Prettier)
let g:prettier#autoformat = 0

" Speed up auto-completion menu
" @see http://stackoverflow.com/a/2460593/1935866
set complete-=i

" }}}

" >>> Auto Commands {{{

" Auto-reload your .vimrc
" @see http://www.bestofvim.com/tip/auto-reload-your-vimrc/
augroup reload_vimrc
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END

" }}}


" highlight those characters that are over the length of 80 chars 
" http://stackoverflow.com/questions/235439/vim-80-column-layout-concerns 
highlight OverLength ctermbg=red ctermfg=white guibg=#592929 
match OverLength /\%81v.\+/ 

" sudo write
ca w!! w !sudo tee >/dev/null "%"

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
