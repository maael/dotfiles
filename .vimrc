syntax on

set mouse=a
set expandtab
set tabstop=2
set shiftwidth=2
set autoread
set wildmenu
set number

let NERDTreeIgnore = ['\.patch[0-9]?$']
let test#javascript#mocha#options = '--reporter spec'
let g:gitgutter_sign_column_always = 1

call plug#begin('~/.vim/plugged')

Plug 'mhinz/vim-startify'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' } " tree sidebar
Plug 'trusktr/seti.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'elzr/vim-json'
Plug 'kien/rainbow_parentheses.vim'
Plug 'janko-m/vim-test'
Plug 'airblade/vim-gitgutter'
Plug 'mattn/emmet-vim'
Plug 'moll/vim-node'
Plug 'digitaltoad/vim-pug'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " fuzzy search tool
Plug 'kopischke/vim-fetch' " open file with line/row numbers
Plug 'tpope/vim-fugitive' " git commands

call plug#end()

colorscheme seti

function! StartUp() 
  if 0 == argc() 
    NERDTree 
  end 
endfunction
			
autocmd VimEnter * call StartUp()
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

autocmd VimEnter * RainbowParenthesesToggle
autocmd Syntax * RainbowParenthesesLoadRound
autocmd Syntax * RainbowParenthesesLoadSquare
autocmd Syntax * RainbowParenthesesLoadBraces
autocmd CursorHold * if exists("t:NerdTreeBufName") | call <SNR>15_refreshRoot() | endif

" don't add line to end of file on save for latex files
autocmd FileType tex setlocal noeol binary fileformat=dos
autocmd FileType bib setlocal noeol binary fileformat=dos

map <C-n> :NERDTreeToggle<CR>
map <C-f> :FZF<CR>
xnoremap p "_dP
