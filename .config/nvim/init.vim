set nocompatible              " be iMproved, required
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
"Plugin 'Valloric/YouCompleteMe', { 'do': './install.py --java-completer --rust-completer --ts-completer --go-completer' }
Plugin 'neoclide/coc.nvim', {'branch': 'release'}
Plugin 'lervag/vimtex'

Plugin 'udalov/kotlin-vim'
Plugin 'Townk/vim-autoclose'
Plugin 'elkowar/yuck.vim'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
"Plugin 'powerline/powerline'
Plugin 'tpope/vim-fugitive'
Plugin 'akinsho/toggleterm.nvim'

"
Plugin 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plugin 'digitaltoad/vim-pug'
Plugin 'dylanaraps/fff.vim'
Plugin 'mattn/emmet-vim'
Plugin 'LnL7/vim-nix'
Plugin 'nikvdp/ejs-syntax'
Plugin 'Yggdroot/indentLine'

"For nvim tree stuff
Plugin 'kyazdani42/nvim-web-devicons' " for file icons
Plugin 'kyazdani42/nvim-tree.lua'
"Plugin 'vifm/vifm'

Plugin 'romgrk/barbar.nvim'

Plugin 'simrat39/symbols-outline.nvim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

source ~/.config/nvim/coc.vim

""let g:ycm_show_diagnostics_ui = 0

set wrap
set linebreak

" use indents of 4 spaces, and have them copied down lines:
set shiftwidth=2
set tabstop=2
set softtabstop=2
set expandtab
set smarttab
set autoindent
set textwidth=80
filetype indent off

" enable filetype detection:
filetype on

autocmd FileType markdown,tex,text set nosmarttab noautoindent
" for C-like programming, have automatic indentation:
autocmd FileType c,cpp,slang set cindent
" * Keystrokes -- Insert Mode
autocmd Filetype python set shiftwidth=4 tabstop=4 softtabstop=4

" autocomplete
nnoremap <F5> :w <bar> :!bash test.sh <ESC>
nnoremap <F11> :!yacoh run
set number
"set relativenumber

func! WordProcessor()
  " movement changes
  map j gj
  map k gk
  " formatting text
  setlocal formatoptions=1
  setlocal noexpandtab
  " spelling and thesaurus
  setlocal spell spelllang=en_us
  set thesaurus+=/home/test/.vim/thesaurus/mthesaur.txt
  " complete+=s makes autocompletion search the thesaurus
  set complete+=s
endfu
nnoremap <F6> :call WordProcessor() <ESC>


map j gj
map k gk

let g:airline_theme='base16_chalk'

nnoremap <F10> :w<bar>:!/home/junikim/scripts/coderunner/coderunner/coderunner.pl %:p <ESC>

autocmd BufNewFile,BufRead *.ms :set filetype=groff
autocmd Filetype groff nnoremap <F12> :w <bar> :!groff -ms %:r\.ms -T pdf >> %:r\.pdf <ESC>
autocmd Filetype sh nnoremap <F12> :w <bar> :!shellcheck %:p <ESC>

func! Latexshortcuts()
    inoremap \[ \[\]<Esc>hi
    inoremap $ $$<Esc>i
    "nnoremap <F12> :w <bar> :!pdflatex %:p <bar> :!rm -rf *.aux *.log <ESC>
    nnoremap <F12> :w <bar> :!if test -f Makefile; then; make clean all; else; pdflatex %:p && rm -rf *.aux *.log; fi <ESC>
endfu

autocmd Filetype tex :call Latexshortcuts()
autocmd Filetype markdown nnoremap <F12> :w <bar> :!if test -f Makefile; then; make clean all; fi;<ESC>

nnoremap f :F<CR>
syntax on
set mouse+=a

lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ignore_install = { "javascript" }, -- List of parsers to ignore installing
  highlight = {
    enable = true,              -- false will disable the whole extension
  },
}
EOF

nnoremap S :SymbolsOutline<ESC>

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

set conceallevel=0
let g:vim_json_syntax_conceal = 0
let g:indentLine_setConceal = 0
let g:tex_flavor = 'latex'
let g:airline_powerline_fonts = 1

"source ~/.config/nvim/config/devicons.vim
"source ~/.config/nvim/config/outline.vim
"source ~/.config/nvim/config/nvimtree.vim
"source ~/.config/nvim/config/barbar.vim
"source ~/.config/nvim/config/filetypes.vim
"source ~/.config/nvim/config/toggleterm.vim

for f in split(glob('~/.config/nvim/config/*.vim'), '\n')
    exe 'source' f
endfor
