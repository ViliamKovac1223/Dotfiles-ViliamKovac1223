" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" split screen more normally
set splitbelow splitright

" for copying from terminal
vnoremap <C-c> "*y :let @+=@*<CR>
map <C-Y> "+P

set tabstop=4 " set tab spaces to 4
set ic " set searching to case non-sensitive
set hls " set searching to highlight all matched
set number relativenumber
set encoding=utf-8 " set encoding
set background=dark

" enable autocompletion
set wildmode=longest,list,full

" spell-check 
map <F7> :setlocal spell! spelllang=en_US<CR>
map <F6> :setlocal spell! spelllang=sk<CR>
