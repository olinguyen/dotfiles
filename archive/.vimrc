set mouse=a
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGINS """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'sainnhe/sonokai'
  Plug 'preservim/tagbar'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'preservim/nerdtree'
call plug#end()
" plugins end =================

if has('termguicolors')
  set termguicolors
endif

let g:sonokai_style = 'espresso'
" let g:sonokai_style = 'atlantis'
" let g:sonokai_style = 'andromeda'
let g:sonokai_better_performance = 1
let g:sonokai_disable_italic_comment = 1
let g:sonokai_transparent_background = 1
 "let g:sonokai_spell_foreground = 'colored'
" let g:sonokai_disable_terminal_colors = 1

colorscheme sonokai
set t_Co=256

" Make , the personal leader key
let mapleader = ","
let maplocalleader = ","

" set fillchars-=vert:\| | set fillchars+=vert:\
set fillchars=stl:^,stlnc:=,vert:\ ,fold:-,diff:-


" Tab to spaces
set shiftwidth=2
set tabstop=2
set softtabstop=2
set tabstop=2
set shiftwidth=2
set expandtab

map <F5> :make

:set autoindent
:set cindent

" Show line number
set nu
set relativenumber

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

map <leader>T :NERDTree<cr>

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


" airline stuff
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline_theme = 'sonokai'

let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
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

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" set laststatus=2
" set statusline+=%#warningmsg#
" set statusline+=%*

" Fzf
nnoremap <C-p>				  :Files<CR>
" nnoremap <leader>fi       :Files<CR>
" nnoremap <leader>C        :Colors<CR>
" nnoremap <leader><CR>     :Buffers<CR>
" nnoremap <leader>fl       :Lines<CR>
" nnoremap <leader>ag       :Ag! <C-R><C-W><CR>
" nnoremap <leader>m        :History<CR>

" bind K to grep word under cursor
"nnoremap L :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
nnoremap <silent> L :Ag <C-R><C-W><CR>
nnoremap \ :Ag<SPACE>