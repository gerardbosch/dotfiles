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
nnoremap \r :source $MYVIMRC<cr>
" Open config in a split
nnoremap <silent> \e :vsplit $MYVIMRC<cr>
" Write as sudo (there is an open issue with nvim that prevents this to work)
noremap <Leader>W :w !sudo tee % > /dev/null
" Search - clear highlight
nnoremap <Leader>/ :noh<cr>
"
" Copy/paste to system clipboard (`"+` seems X11 specific, for MacOS use `"*`)
:vmap <C-c> "+y
:vmap <C-x> "+d
:inoremap <C-v> <C-o>"+p
:nnoremap <C-a> gg0vG$

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

" suda.vim (https://github.com/lambdalisue/suda.vim)
" ‾‾‾‾‾‾‾‾
let g:suda_smart_edit = 1  " automatically write file name to save as... when not writable

" easy-align (https://github.com/junegunn/vim-easy-align)
" ‾‾‾‾‾‾‾‾‾‾
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)


" CoC (nvim completion engine - https://github.com/neoclide/coc.nvim)
" ‾‾‾
" VSCode-like tab completion

" May need for Vim (not Neovim) since coc.nvim calculates byte offset by count
" utf-8 byte sequence
set encoding=utf-8
" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
" delays and poor user experience
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" coc-yank (https://github.com/neoclide/coc-yank)
" ‾‾‾‾‾‾‾‾
nnoremap <silent> <space>y  :<C-u>CocList -A --normal yank<cr>


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
" Plug 'romainl/flattened'

" Plugins
Plug 'mhinz/vim-startify'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'                           " Git commands :G
"Plug 'tpope/vim-surround'                               " Commands: ys, cs, ds, S
Plug 'farmergreg/vim-lastplace'
Plug 'lambdalisue/suda.vim'
" Plug 'bling/vim-airline'                            " status bar
Plug 'itchyny/lightline.vim'                        " status bar
Plug 'editorconfig/editorconfig-vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " check the last fzf binary is installed (fzf repo insructions)
Plug 'vim-syntastic/syntastic'                      " syntax checker
Plug 'airblade/vim-gitgutter'                       " Git gutter
Plug 'junegunn/vim-easy-align'                      " :EasyAlign to align text by column `ga<symbol>`
Plug 'neoclide/coc.nvim', {'branch': 'release'}     " Completion engine
Plug 'jiangmiao/auto-pairs'
Plug 'kmonad/kmonad-vim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " Used for Kotlin (lua config below)

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

" Tree-Sitter config (used for Kotlin)
lua require('treesitter')

" colorscheme synthwave84
" colorscheme monokai

