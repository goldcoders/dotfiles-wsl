"Vim Cheat Sheet: https://vim.rtorr.com/lang/en_us
let mapleader =" "

if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ~/.config/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
    autocmd VimEnter * :PlugInstall
endif

function! Cond(cond, ...)
  let opts = get(a:000, 0, {})
  return a:cond ? opts : extend(opts, { 'on': [], 'for': [] })
endfunction


call plug#begin('~/.config/nvim/plugged')
Plug 'tpope/vim-surround'
" use normal easymotion when in vim mode
Plug 'easymotion/vim-easymotion', Cond(!exists('g:vscode'))
" use vscode easymotion when in vscode mode
Plug 'asvetliakov/vim-easymotion', Cond(exists('g:vscode'), { 'as': 'vsc-easymotion' })
call plug#end()

" Allow Us to Use Windows 10 Clipboard
set clipboard+=unnamedplus

let g:clipboard = {
          \   'name': 'win32yank-wsl',
          \   'copy': {
          \      '+': 'win32yank.exe -i --crlf',
          \      '*': 'win32yank.exe -i --crlf',
          \    },
          \   'paste': {
          \      '+': 'win32yank.exe -o --lf',
          \      '*': 'win32yank.exe -o --lf',
          \   },
          \   'cache_enabled': 0,
          \ }

" yank till end of line
noremap Y y$<cr>

" Bind Space As Our Leader Key
let mapleader =" "

"-------------SEARCH--------------"
highlight Search cterm=underline
set showmatch                   " Do not show matching brackets by flickering
set incsearch                   " Shows the match while typing
set hlsearch                    " Highlight found searches
set ignorecase                  " Search case insensitive...
set smartcase                   " ... but not when search pattern contains upper case characters

nnoremap ,<leader> :set hlsearch!<CR>

" We Will use The Defaul Vim Keybindings of Easy Motions Listed Below For Reference in Future
let g:EasyMotion_do_mapping = 1

" <leader><leader>w                            start of words
" <leader><leader>b                            start of words backwards
" <leader><leader>bdw                          start of words everywhere. The bd stands for bidirectional
" <leader><leader>e                            end of words
" <leader><leader>ge                           end of words backwards
" <leader><leader>bdw                          end of words everywhere
" <leader><leader>j                            beginning of lines
" <leader><leader>k                            beginning of lines backwards
" <leader><leader>f{char}                      find char
" <leader><leader>F{char}                      find char backwards
" <leader><leader>t{char}                      until character
" <leader><leader>T{char}                      until character backwards
" <leader><leader>s{char}                      search character everywhere


" Add Here All VSCODE Config
if exists('g:vscode')

" https://github.com/asvetliakov/vscode-neovim#invoking-vscode-actions-from-neovim

" We can use VSCodeNotifyVisual(command,param)
" xnoremap <C-S-P> <Cmd>call VSCodeNotifyVisual('workbench.action.showCommands', 1)<CR>
" But All the Defaults of VSCODE Neovim just works fine so we will not use it


" Find Word Under Cursor
nnoremap  <silent>F <Cmd>call VSCodeNotify('actions.find', { 'query': expand('<cword>')})<CR>
" Rename Word Under Cursor
nnoremap <silent> R :<C-u>call VSCodeNotify('editor.action.rename')<CR>

" We Need This For Github Co-pilot
imap <tab> <Cmd>call VSCodeNotify('github.copilot.autocompleteAccepted')<CR>
" All Our Keybindings in VSCODE code at are
" $env:USERPROFILE\AppData\Roaming\Code\User\keybindings.json
else

"-------------CHECKHEALTH SETTINGS--------------"
" NVIM CONFIG checkhealth
let g:loaded_python_provider=0
" let g:python_host_prog="/usr/bin/python2"
" let g:python3_host_prog="/opt/homebrew/bin/python3"
" let g:ruby_host_prog="/usr/bin/ruby"
let g:loaded_perl_provider=0
" Use this if we wanna use PYENV
" let g:python_host_prog="/Users/uriah/.pyenv/shims/python"

let g:session_autosave = 'yes'
let g:session_autoload = 'yes'
let g:session_default_to_last = 1

"-------------MAIN SETTINGS--------------"
syntax on
nnoremap c "_c
set nocompatible
filetype plugin on
set ruler                       " Show the line and column numbers of the cursor.
set formatoptions+=o            " Continue comment marker in new lines.
set nowrap                      " don't wrap lines
set modeline                    " Enable modeline.
set linespace=0                 " Set line-spacing to minimum.
set relativenumber              " Set relative number as default
nmap L :let &number=1-&number<CR>  " Toggle Line Number
set nojoinspaces                " Prevents inserting two spaces after punctuation on a join (J)
set mouse=                      " Enable Mouse Options
set list
set hidden
set cmdheight=2                 " Give more space for displaying messages.
set timeout timeoutlen=1000 ttimeoutlen=10
set colorcolumn=80


if !&scrolloff
  set scrolloff=3               " Show next 3 lines while scrolling.
endif
if !&sidescrolloff
  set sidescrolloff=5           " Show next 5 columns while side-scrolling.
endif


set display+=lastline
set nostartofline               " Do not jump to first character with page commands.
set noerrorbells                " No beeps
set backspace=indent,eol,start  " Makes backspace key more powerful.
set showcmd                     " Show me what I'm typing
set showmode                    " Show current mode.
set encoding=utf-8              " Set default encoding to UTF-8
set autoread                    " Automatically reread changed files without asking me anything
set laststatus=2
set fileformats=unix,dos,mac    " Prefer Unix over Windows over OS 9 formats

set gdefault                    " Use 'g' flag by default with :s/foo/bar/.
set magic                       " Use 'magic' patterns (extended regular expressions).
set wildmode=longest,list,full  " Enable autocompletion:
set wildmenu


"-------------FILE HISTORY--------------"
set history=1000                " remember more commands and search history
set undolevels=1000             " use many muchos levels of undo
set autowrite                   " Automatically save before :next, :make etc.
set noswapfile                  " Don't use swapfile
set nobackup            	      " Don't create annoying backup files


"-------------TABS--------------"

set smarttab
set tabstop=4                   " a tab is four spaces "
set softtabstop=4               " when hitting <BS>, pretend like a tab is removed, even if spaces "
set expandtab                   " expand tabs by default (overloadable per file type later) "
set shiftwidth=4                " number of spaces to use for autoindenting "
set shiftround                  " use multiple of shiftwidth when indenting with '<' and '>' "

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300



endif