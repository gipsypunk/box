"-- General ---------------------------------

syntax on 
set t_Co=256
set number
set cursorline 

set mousehide 
set mouse=a
set ttymouse=sgr
set termencoding=utf-8
set backspace=indent,eol,start whichwrap+=<,>,[,]
set guifont=Droid\ Sans\ Mono\ Font:45
set autoindent
set tabstop=4 
set shiftwidth=4
set smarttab
set expandtab
set softtabstop=4
set showtabline=1


set wrap
set linebreak

set nobackup
set noswapfile
set encoding=utf-8
set fileencodings=utf8,cp1251


set hidden


"-- Сlipboard & Maping  ---------------------------------

set clipboard+=unnamedplus
set ruler
map <C-c> "+y
map <C-v> "+gP
map <C-x> "+x



vnoremap <silent> <C-k> :s#^#\##<cr>:noh<cr>
vnoremap <silent> <C-u> :s#^\###<cr>:noh<cr>
" highlight Comment cterm=italic gui=italic
highlight Comment font=FiraCode:h14e

map <C-n> :NERDTreeToggle<CR>
map <C-m> :TagbarToggle<CR>
map <Leader> <Plug>(easymotion-prefix)




"-- Plugins ---------------------------------

call plug#begin('~/.vim/plugged')

Plug 'ycm-core/YouCompleteMe'
Plug 'preservim/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'majutsushi/tagbar'

Plug 'tpope/vim-fugitive'
Plug 'easymotion/vim-easymotion'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'preservim/nerdcommenter'
Plug 'sirver/ultisnips'
Plug 'ap/vim-css-color'


" Python plugs
Plug 'davidhalter/jedi-vim'
Plug 'vim-python/python-syntax'
Plug 'google/yapf'
Plug 'vim-syntastic/syntastic'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'sheerun/vim-polyglot'


" Theme & lightline
Plug 'liuchengxu/vista.vim'
Plug 'itchyny/lightline.vim'
Plug 'ryanoasis/vim-devicons'
"Plug '~/.vim/colors/onedark.vim'
Plug 'joshdick/onedark.vim'



call plug#end()

"-- Themes ---------------------------------

colorscheme onedark
"set termguicolors
set bg=dark

" Important!
"if has('termguicolors')
"    set termguicolors
"endif  
"let g:sonokai_style = 'default'
let g:sonokai_enable_italic = 1
let g:sonokai_disable_italic_comment = 1

"-- Vista ---------------------------------


let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista#renderer#enable_icon = 1
let g:vista#renderer#icons = {
\   "function": "\uf794",
\   "variable": "\uf71b",
\  }


"-- Lightline ---------------------------------

function! LightLineFugitive()       
    let branch = FugitiveHead()
    return branch !=# '' ? ' '.branch : ''
endfunction

let g:lightline = {
            \ 'colorscheme': 'default',
            \ 'active': {
            \   'left': [ [ 'mode', 'paste' ],
            \             [ 'gitbranch', 'cocstatus', 'readonly', 'filename', 'modified' ] ]
            \ },
            \ 'component_function': {
            \   'cocstatus': 'coc#status',
            \   'gitbranch': 'LightLineFugitive'
            \ },
            \ 'component': {
            \   'giticon': '',
            \   'filename': '%f',
            \ }
        \ }



set laststatus=2
set statusline=%F

"-- Ultisnips ---------------------------------

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"



"-- Nerdcommenter ---------------------------------

let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDAltDelims_java = 1
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDToggleCheckAllLines = 1

"-- Ctrlp.vim ---------------------------------

let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_root_markers = ['pom.xml', '.p4ignore']
let g:ctrlp_switch_buffer = 'et'
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']





