" pathogen plugin initialization
filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
filetype plugin indent on

" tab settings
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set number

" status
set ruler
set laststatus=2

" search
set incsearch 
set hlsearch

" keybindings
let mapleader = ","
imap jj <esc>
nmap ; :

" nerdtree
nmap <leader>n :NERDTreeToggle<CR>

" ctags
" the ; search for tags file from current directory till parent directory
" resursively until it finds a tags file
set tags=tags;
nmap <leader>t :TlistToggle<CR>
nmap <leader>f <C-]>
nmap <leader>g <C-T>

" command-t
nmap <Leader>d :CommandT<CR>

autocmd FileType html,htmldjango,jinjahtml,eruby,mako let b:closetag_html_style=1
autocmd FileType html,xhtml,xml,htmldjango,jinjahtml,eruby,mako source ~/.vim/bundle/closetag/plugin/closetag.vim

" highlight those characters that are over the length of 80 chars 
" http://stackoverflow.com/questions/235439/vim-80-column-layout-concerns 
highlight OverLength ctermbg=red ctermfg=white guibg=#592929 
match OverLength /\%81v.\+/ 
