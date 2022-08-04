" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

autocmd vimenter * NERDTree
set term=screen-256color
set mouse=a
set ttymouse=xterm2
set noshowmode
set tabstop=4
set shiftwidth=0
set expandtab
set autoindent
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <C-n> :NERDTreeToggle<CR>
autocmd BufWinEnter * silent! NERDTreeMirror
set encoding=utf-8
let g:user_emmet_leader_key=','
let mapleader = ","
let NERDTreeDirArrowExpandable = ">"
let NERDTreeDirArrowCollapsible = "V"
set number
set linebreak
autocmd VimEnter * wincmd p
autocmd VimEnter * if @% == '' | wincmd p | endif
map <MiddleMouse> <LeftMouse> t
noremap <silent> <C-S> :w<CR>
vnoremap <silent> <C-S> <Esc>:w<CR>
inoremap <silent> <C-S> <Esc>:w<CR>
nmap <C-@> :Emmet
imap <C-@> <Esc> :Emmet
highlight ALEErrorSign ctermbg=1 ctermfg=1
highlight ALEWarningSign ctermbg=1 ctermfg=11
let g:ale_fix_on_save = 1

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }

call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Any valid git URL is allowed
Plug 'itchyny/lightline.vim'
Plug 'https://github.com/scrooloose/nerdtree'
Plug 'mattn/emmet-vim'
Plug 'w0rp/ale'
"Plug 'ajh17/VimCompletesMe'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'github/copilot.vim'

" Initialize plugin system
call plug#end()

" Trigger configuration. You need to change this to something other than <tab>
" if you use one of the following:
" - https://github.com/Valloric/YouCompleteMe
" - https://github.com/nvim-lua/completion-nvim
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

"set path+=/usr/lib/avr/include/
