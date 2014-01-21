" Pathogen
execute pathogen#infect()
call pathogen#helptags() " generate helptags for everything in 'runtimepath'
syntax on
filetype plugin indent on
set shiftwidth=2
set tabstop=2
set background=dark
map <F5> :make
:nmap <c-s> :w<CR>
:imap <c-s> <Esc>:w<CR>a
:imap <c-s> <Esc><c-s>
:set autoindent
:set cindent
:set nu
set softtabstop=2
set tabstop=2
set shiftwidth=2
set expandtab
colorscheme jellybeans 
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
