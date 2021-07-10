set nocompatible              " be iMproved, required
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe', { 'do': './install.py --java-completer --rust-completer --ts-completer' }
Plugin 'udalov/kotlin-vim'
Plugin 'Townk/vim-autoclose'
Plugin 'vim-airline/vim-airline'
Plugin 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
"Plugin 'vifm/vifm'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

""let g:ycm_show_diagnostics_ui = 0

set wrap
set linebreak

" use indents of 4 spaces, and have them copied down lines:
set softtabstop=4
set shiftwidth=4
set tabstop=4
set expandtab
set smarttab
set autoindent
set cindent
filetype indent off

" enable filetype detection:
filetype on

" for C-like programming, have automatic indentation:
autocmd FileType c,cpp,slang set cindent
" * Keystrokes -- Insert Mode

" autocomplete
nnoremap <F5> :!bash test.sh <ESC>
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

nnoremap <F10> :w<bar>:!/home/junikim/scripts/coderunner/coderunner/coderunner.pl %:p <ESC>

autocmd BufNewFile,BufRead *.ms :set filetype=groff
autocmd Filetype groff nnoremap <F12> :w <bar> :!groff -ms %:r\.ms -T pdf >> %:r\.pdf <ESC>
autocmd Filetype sh nnoremap <F12> :w <bar> :!shellcheck %:p <ESC>

func! Latexshortcuts()
    inoremap \[ \[\]<Esc>hi
    inoremap $ $$<Esc>i
    "nnoremap <F12> :w <bar> :!pdflatex %:p <bar> :!rm -rf *.aux *.log <ESC>
    nnoremap <F12> :w <bar> :!pdflatex %:p && rm -rf *.aux *.log <ESC>
endfu

func PerlSemiColon()
    :%s/[^\;^\{]$/$;/g
endfu

autocmd Filetype tex :call Latexshortcuts()

syntax on
set mouse=a

lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ignore_install = { "javascript" }, -- List of parsers to ignore installing
  highlight = {
    enable = true,              -- false will disable the whole extension
  },
}
EOF
