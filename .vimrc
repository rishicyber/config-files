" #### BASIC EDITOR #### 
set nu
syntax on
set hlsearch
set relativenumber
set ignorecase
set smartcase
set tabstop=2
set expandtab " use spaces instead of tabs
set wildmenu
set incsearch
autocmd Vimenter * match Search /LOG_/




" #### PLUGINS CONFIGURE #### 

" to retain linenumbers && column number of cursor of that file while reopening
if has("autocmd")
	au BufReadPost *
	\ if line("'\'") > 1 && line("'\'") <= line("$") |
	\ 	exe "normal! g`\"" |
	\ endif
endif

set complete+=kspell
set completeopt+=menuone,longest


" Start NERDTree when Vim is opened without any file
autocmd vimenter * NERDTree | wincmd p

" If no file is opened, NERDTree remains as the only window
autocmd BufEnter * if winnr('$') == 1 && bufname() =~ 'NERD_tree_' | quit | endif


" Enable timeout for key sequences
set timeout
" Set the timeout length to 500 milliseconds (adjustable)
set ttimeoutlen=1000
" become god User
let mapleader = " "
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
" window movement by ctrl - motion
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" move current lines up or down in normal mode
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
" move visiually selected lines up or down in normal mode
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv
" force-save and run currently opened python file, exe needed to remove outside windows
nnoremap <leader>r :w!<CR>:!python.exe %<CR>


" #### COLORSCHEME #### 
set termguicolors

let g:tokyonight_style = 'night' " available: night, storm
let g:tokyonight_enable_italic = 1
let g:airline_theme = "tokyonight"
let g:lightline = {'colorscheme' : 'tokyonight'}

colorscheme tokyonight
" colorscheme	onedark



" #### PLUGINS MANAGER ####

call plug#begin()

" List your plugins here
Plug 'tpope/vim-sensible'
Plug 'ghifarit53/tokyonight-vim'
Plug 'sheerun/vim-polyglot'

call plug#end()


" ##############  SHOW LAST YANKED OR DELETED I.E. "0 VALUE IN LIGHTLINE ##############

function! LastYankDelete()
  " Get the current filename

  " Check if the register has content
  if !empty(@")
    let text = printf("BUFFER : %s", substitute(@", '\n', ' ', 'g'))
  elseif !empty(@0)
    let text = printf("BUFFER : %s", substitute(@0, '\n', ' ', 'g'))
  else
    let text = "No text"
  endif

  " Truncate the text to 60 characters
  return strpart(text, 0, 60)
endfunction



let g:lightline = {
  \ 'colorscheme': 'wombat',
  \ 'active': {
    \ 'left': [ ['mode', 'paste'], ['filename', 'modified', 'last_yank_delete'] ]
    \ },
  \ 'component_function': {
    \ 'last_yank_delete': 'LastYankDelete'
    \ },
  \ }
" #######################################################################################


