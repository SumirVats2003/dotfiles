
" Plugin Settings
call plug#begin()

Plug 'vwxyutarooo/nerdtree-devicons-syntax'
Plug 'luochen1990/rainbow'
Plug 'mhinz/vim-startify'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'liuchengxu/space-vim-dark'
Plug 'joshdick/onedark.vim'
Plug 'jiangmiao/auto-pairs'

call plug#end()

" Custom Functions
if &diffopt !~# 'internal'
  set diffexpr=MyDiff()
endif
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg1 = substitute(arg1, '!', '\!', 'g')
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg2 = substitute(arg2, '!', '\!', 'g')
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let arg3 = substitute(arg3, '!', '\!', 'g')
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  let cmd = substitute(cmd, '!', '\!', 'g')
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction

" Airline Settings
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='onedark'
let g:airline#extensions#branch#enabled = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" Startify Settings

let g:startify_custom_header = [
			\ '',
			\ ' ___      ___  __     ___      ___ ',
			\ '|"  \    /"  ||" \   |"  \    /"  |',
			\ ' \   \  //  / ||  |   \   \  //   |',
			\ '  \\  \/. ./  |:  |   /\\  \/.    |',
			\ '   \.    //   |.  |  |: \.        |',
			\ '    \\   /    /\  |\ |.  \    /:  |',
			\ '     \__/    (__\_|_)|___|\__/|___|',
			\ '',
			\ ]
                                   

let g:startify_fortune_use_unicode = 1
let g:startify_bookmarks = [
      \ {'v':'~/.vimrc'},
      \ ]

" Custom Settings
colors onedark
set termguicolors
set guifont="Code New Roman Nerd Font:h14"
set tabstop=2
set shiftwidth=2
set expandtab
set nu
set cursorline
set guioptions-=T
set renderoptions=type:directx
set encoding=utf-8
set nobackup       
set nowritebackup  
set swapfile
set dir=~/tmp
set noundofile
set autoindent
set noerrorbells
set ruler
set wildmenu
set clipboard=unnamed
set guicursor=n-v-c:blinkon0-block-cursor
set showcmd
set noshowmode
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" Keymap Tweeks
nnoremap <c-p> :PlugInstall<CR>
nnoremap <c-n> :NERDTreeToggle<CR>
nnoremap <c-s> :Startify<CR>
" Compile and run and Boilerplate code keybindings
augroup compileandrun
    autocmd!
    autocmd filetype python nnoremap <f5> :w <bar> :!python3 % <cr>
    autocmd filetype cpp nnoremap <c-z> :w <bar> exec '!g++ '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>
    autocmd filetype c nnoremap <f5> :w <bar> !make %:r && ./%:r <cr>
    autocmd filetype java nnoremap <f5> :w <bar> !javac % && java %:r <cr>
    autocmd filetype cpp nnoremap <c-b> i#include<bits/stdc++.h><cr>#define ll long long<cr>using namespace std;<cr><cr>int main() {<cr>int t;<cr>cin>>t;<cr>while(t--){<cr>}<cr>return 0;<cr>}<esc>kkO<esc>:w<cr>
augroup END

