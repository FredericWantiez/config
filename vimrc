set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

Plugin 'prettier/vim-prettier', { 'do': 'npm install' }
Plugin 'MaxMEllon/vim-jsx-pretty'
Plugin 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
Plugin 'voldikss/vim-floaterm'

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'jeetsukumaran/vim-buffergator'

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)
Plugin 'morhetz/gruvbox'
Plugin 'chriskempson/base16-vim'
"Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'itchyny/lightline.vim'
Bundle 'altercation/vim-colors-solarized'
Plugin 'Raimondi/delimitMate'
" Ctags
Plugin 'dracula/vim'
Plugin 'ctrlpvim/ctrlp.vim'
" Indentation 
Plugin 'Yggdroot/indentLine'
Plugin 'lervag/vimtex'
Plugin 'nvie/vim-flake8'

" Git things
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rhubarb'
Plugin 'airblade/vim-gitgutter'

" Golang
Plugin 'fatih/vim-go'

" Orgmode
Plugin 'jceb/vim-orgmode'
Plugin 'tpope/vim-speeddating'

Plugin 'JuliaEditorSupport/julia-vim'
Plugin 'leanprover/lean.vim'

" Completion
Plugin 'neoclide/coc.nvim', {'branch': 'release'}
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set encoding=utf-8
set laststatus=2
set number

"let python_highlight_all=1
syntax on
"let g:syntastic_python_checkers = ['flake8']

"set rnu
set nu
syntax enable

"colorscheme base16-brewer
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

set background=dark

"autocmd StdinReadPre * let s:std_in=1

" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let mapleader=","

" Change buffers more easily
nnoremap <leader>b :buffers<CR>:buffer<Space>

" Quick .vimrc edit on a vertical split
nnoremap <leader>ev :vsp $MYVIMRC<cr>

" Quote a word
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel

" Put a word into parenthesis
inoremap <leader>( viw<esc>a(<esc>bi)<esc>lel

" Change <esc> 
inoremap jk <esc>

" Quick save
nnoremap <leader>w :w<cr>

" Quick quit insert mode and save
inoremap <leader>s <esc>:w<cr>

" Delete text inside parenthesis 
onoremap p i(
onoremap b i[

" Open and close Syntastic error pannel
nnoremap <leader>e :Errors<cr>
nnoremap <leader>q :lclose<cr>

" Enable tags
set tags=tags;/

" Open tagbar
"nnoremap <leader>t :TagbarToggle<cr>

" Status line git info
"set statusline+=%{fugitive#statusline()}

" Change working directory at buffer enter
" autocmd BufEnter * silent! lcd %:p:h

" Press Space to turn off highlighting and clear any message already displayed.
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" Set highlighting when searching
set hlsearch
set incsearch


" Indent mode
let g:indentLine_char = '¦'
let g:indentLine_enabled = 1

" Open a vertical split and show CtrlP
nnoremap <leader>P :vsp<CR><C-W><C-L>:CtrlP<CR>

" PEP8 things
let g:flake8_show_in_gutter=1
let g:flake8_show_in_file=0


" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
endif

nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" Add pretty json mapping
nnoremap <leader>J :%!python -m json.tool<CR>

" Search things
vnoremap // y/\V<C-R>"<CR>
vnoremap <leader>g :grep -r "\b<C-R><C-W>\b" **/*.py<CR><CR>:copen<CR>


" Auto tabs for filetypes
set tabstop=2
set shiftwidth=2
autocmd FileType org setlocal shiftwidth=2 tabstop=2
autocmd FileType tex setlocal shiftwidth=2 tabstop=2
autocmd FileType py setlocal shiftwidth=4 tabstop=4

set pastetoggle=<F3>

" ## added by OPAM user-setup for vim / base ## 93ee63e278bdfc07d1139a748ed3fff2 ## you can edit, but keep this line
let s:opam_share_dir = system("opam config var share")
let s:opam_share_dir = substitute(s:opam_share_dir, '[\r\n]*$', '', '')

let s:opam_configuration = {}

function! OpamConfOcpIndent()
  execute "set rtp^=" . s:opam_share_dir . "/ocp-indent/vim"
endfunction
let s:opam_configuration['ocp-indent'] = function('OpamConfOcpIndent')

function! OpamConfOcpIndex()
  execute "set rtp+=" . s:opam_share_dir . "/ocp-index/vim"
endfunction
let s:opam_configuration['ocp-index'] = function('OpamConfOcpIndex')

function! OpamConfMerlin()
  let l:dir = s:opam_share_dir . "/merlin/vim"
  execute "set rtp+=" . l:dir
endfunction
let s:opam_configuration['merlin'] = function('OpamConfMerlin')

let s:opam_packages = ["ocp-indent", "ocp-index", "merlin"]
let s:opam_check_cmdline = ["opam list --installed --short --safe --color=never"] + s:opam_packages
let s:opam_available_tools = split(system(join(s:opam_check_cmdline)))
for tool in s:opam_packages
  " Respect package order (merlin should be after ocp-index)
  if count(s:opam_available_tools, tool) > 0
    call s:opam_configuration[tool]()
  endif
endfor
" ## end of OPAM user-setup addition for vim / base ## keep this line
" ## added by OPAM user-setup for vim / ocp-indent ## 63b470605f3381299f01cfa86ec02905 ## you can edit, but keep this line
if count(s:opam_available_tools,"ocp-indent") == 0
  source "/home/frederic/.opam/4.06.1/share/ocp-indent/vim/indent/ocaml.vim"
endif
" ## end of OPAM user-setup addition for vim / ocp-indent ## keep this line
"
let g:python3_host_prog="/home/frederic/anaconda3/bin/python"

" Floatterm stuff
noremap <leader>t :FloatermToggle<CR>
noremap! <leader>t  <Esc>:FloatermToggle<CR>
tnoremap <leader>t  <C-\><C-n>:FloatermToggle<CR>
