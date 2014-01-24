 " Pathogen
execute pathogen#infect()
call pathogen#helptags() " generate helptags for everything in 'runtimepath'
syntax on
filetype plugin indent on

" Plugins
nnoremap <C-p> :Unite file_rec/async<cr>
nnoremap <space>/ :Unite grep:.<cr>
autocmd FileType c,cpp set commentstring=//\ %s

" Tab to spaces
set shiftwidth=2
set tabstop=2
set softtabstop=2
set tabstop=2
set shiftwidth=2
set expandtab

" Make vim pretty
set background=dark
colorscheme 256-grayvim
colorscheme jellybeans 

map <F5> :make

" Save with ctrl +s (might have to modify bash)
:nmap <c-s> :w<CR>
:imap <c-s> <Esc>:w<CR>a
:imap <c-s> <Esc><c-s>

:set autoindent
:set cindent

" Show line number
:set nu

