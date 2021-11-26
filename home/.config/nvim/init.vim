" ----------------------
" === Basic Settings ===
" ----------------------

let mapleader=","
set mouse+=a

" Appearence
set number
set cursorline
set title " Window’s title, reflecting the file currently being edited.

" if has('termguicolors')
"   set termguicolors
" endif
"set background=dark " [dark (default), light]

" Search - more settings are set by sensitive plugin
set ignorecase
set smartcase

set history=1000
set hidden " Hide files in the background instead of closing them.

" Edit
set smartindent
set tabstop=2
set expandtab
set shiftwidth=2

" -----------------
" === Key remap ===
" -----------------

" Reload config
nnoremap <Leader><Leader> :source $MYVIMRC<cr>
" Open config in a split
nnoremap <silent> <Leader>e :vsplit $MYVIMRC<cr>
" Write as sudo
noremap <Leader>W :w !sudo tee % > /dev/null
" Search - clear highlight
nnoremap <Leader>/ :noh<cr>
" Copy/paste to system clipboard (`"+` seems X11 specific, for MacOS use `"*`)
:vmap <C-c> "+y
:vmap <C-x> "+d
:inoremap <C-v> <C-o>"+p

" Move around panes
nnoremap <Leader>j <C-W>j
nnoremap <Leader>k <C-W>k
nnoremap <Leader>h <C-W>h
nnoremap <Leader>l <C-W>l
" Show NERDTree
nnoremap <C-n> :NERDTree<CR>
nnoremap <leader>n :NERDTreeFocus<CR>
" Comment (requires commentary plugin) C-slash comment: wtf? vim recognises `/` as `_`... ok!
nnoremap <C-_> :Commentary<cr>j
inoremap <C-_> <Esc>:Commentary<cr>ji

" -----------------------
" === Plugin settings ===
" -----------------------

" easy-align (https://github.com/junegunn/vim-easy-align)
" ‾‾‾‾‾‾‾‾‾‾
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" ----------------
" === vim-plug ===
" ----------------
"
" vim-plug Automatic installation :)
" See https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation
"
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.cache/vim-plug')

" Themes
" Plug 'artanikin/vim-synthwave84' " not sure it works, see its GitHub
" Plug 'sickill/vim-monokai'
Plug 'romainl/flattened'

Plug 'mhinz/vim-startify'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'                           " Git commands :G
Plug 'farmergreg/vim-lastplace'
" Plug 'bling/vim-airline'                            " status bar
Plug 'itchyny/lightline.vim'                        " status bar
Plug 'editorconfig/editorconfig-vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " check the last fzf binary is installed (fzf repo insructions)
Plug 'vim-syntastic/syntastic'                      " syntax checker
Plug 'airblade/vim-gitgutter'                       " Git gutter
Plug 'junegunn/vim-easy-align'                      " :EasyAlign to align text by column `ga<symbol>`

" Syntax highlight
Plug 'tridactyl/vim-tridactyl'

" Unmanaged plugin (manually installed and updated)
" Plug '~/my-prototype-plugin'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
"Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Plugin outside ~/.vim/plugged with post-update hook
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" Using a non-default branch
" Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
" Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
" Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Initialize plugin system
call plug#end()

" colorscheme synthwave84
" colorscheme monokai

