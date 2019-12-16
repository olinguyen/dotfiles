set mouse=a

 " Pathogen
execute pathogen#infect()
call pathogen#helptags() " generate helptags for everything in 'runtimepath'
syntax on
filetype plugin indent on

" Plugins
" nnoremap <C-p> :Unite file_rec/async<cr>
nnoremap <space>/ :Unite grep:.<cr>
autocmd FileType c,cpp set commentstring=//\ %s

" Make , the personal leader key
let mapleader = ","
let maplocalleader = ","

" Make vim pretty
set background=dark
"color xcodedark
color dracula
"colorscheme 256-grayvim
"colorscheme jellybeans
set fillchars-=vert:\| | set fillchars+=vert:\ 

" Tab to spaces
set shiftwidth=2
set tabstop=2
set softtabstop=2
set tabstop=2
set shiftwidth=2
set expandtab

map <F5> :make

" Save with ctrl +s (might have to modify bash)
:nmap <c-s> :w<CR>
:imap <c-s> <Esc>:w<CR>a
:imap <c-s> <Esc><c-s>

:set autoindent
:set cindent

" Show line number
:set nu

" Replace selected in visual mode
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

" Paste in vim without autoindent
set pastetoggle=<F2>

"make < > shifts keep selection
vnoremap < <gv
vnoremap > >gv

" Shift-tab to insert a hard tab
imap <silent> <S-tab> <C-v><tab>

" where to put backup file
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
" directory is the directory for temp file
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set makeef=error.err " When using make, where should it dump the file"

" Sane searching
set hlsearch " Hilight search term
set showmatch " Show matching brackets
set incsearch " ... dynamically as they are typed"

" turn of hlsearch temporarily
nmap <silent> <leader>n :silent :nohlsearch<CR>

" Make ^e and ^y scroll 3 lines instead of 1
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" Automatically reread files that have been changed externally"
set autoread

" Make ';' an alias for ':'
nnoremap ; :
nnoremap <F3> :set hlsearch!<CR>

" Highlight trailing whitespace
highlight WhitespaceEOL ctermbg=DarkYellow guibg=DarkYellow
match WhitespaceEOL /\s\+$/

" ,W strips all trailing whitespace from current file
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" Tab mappings.
map <leader>tt :tabnew<cr>
map <leader>te :tabedit
map <leader>tc :tabclose<cr>
map <leader>to :tabonly<cr>
map <leader>tn :tabnext<cr>
map <leader>tp :tabprevious<cr>
map <leader>tf :tabfirst<cr>
map <leader>tl :tablast<cr>
map <leader>tm :tabmove

" Move around splits with <c-hjkl>
nnoremap <leader>j <c-w>j
nnoremap <leader>k <c-w>k
nnoremap <leader>h <c-w>h
nnoremap <leader>l <c-w>l

" Because of crappy ssh colors
set t_Co=8

" Resize splits
nnoremap <silent> + :vertical res +3<CR>
nnoremap <silent> - :vertical res -3<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RENAME CURRENT FILE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction
map <leader>n :call RenameFile()<cr>


let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['flake8']

" airline stuff
" let g:airline#extensions#tabline#left_sep = ' '
" let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#enabled = 1
" unicode symbols
let g:airline_symbols = {}
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'
set laststatus=2


set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'

let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
nnoremap <C-w>E :SyntasticCheck<CR> :SyntasticToggleMode<CR>

let g:UltiSnipsExpandTrigger="<c-j>"

call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Fzf
nnoremap <C-p>				  :Files<CR>
" nnoremap <leader>fi       :Files<CR>
" nnoremap <leader>C        :Colors<CR>
" nnoremap <leader><CR>     :Buffers<CR>
" nnoremap <leader>fl       :Lines<CR>
" nnoremap <leader>ag       :Ag! <C-R><C-W><CR>
" nnoremap <leader>m        :History<CR>
let g:UltiSnipsExpandTrigger="<C-b>"
let g:UltiSnipsJumpForwardTrigger="<C-l>"
let g:UltiSnipsJumpBackwardTrigger="<C-z>"

" bind K to grep word under cursor
"nnoremap L :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
nnoremap <silent> L :Ag <C-R><C-W><CR>
nnoremap \ :Ag<SPACE>
