"Vim Cheat Sheet: https://vim.rtorr.com/lang/en_us
let mapleader =" "

if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ~/.config/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
    autocmd VimEnter * :PlugInstall
endif


call plug#begin('~/.config/nvim/plugged')
if exists('g:vscode')
    " VSCode extension
Plug 'asvetliakov/vim-easymotion', { 'as': 'vsc-easymotion' }
else
    " ordinary neovim
Plug 'tpope/vim-surround'
Plug 'neoclide/coc.nvim'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/goyo.vim'
Plug 'vimwiki/vimwiki'
Plug 'bling/vim-airline'
Plug 'tpope/vim-commentary'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'preservim/nerdcommenter'
Plug 'dart-lang/dart-vim-plugin'
Plug 'thosakwe/vim-flutter'
Plug 'natebosch/vim-lsc'
Plug 'natebosch/vim-lsc-dart'
Plug 'junegunn/fzf.vim'
Plug 'evanleck/vim-svelte', {'branch': 'main'}
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'Neevash/awesome-flutter-snippets'
Plug 'easymotion/vim-easymotion'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'natebosch/dartlang-snippets'
Plug 'jiangmiao/auto-pairs'
endif
call plug#end()

"-------------FILE HISTORY--------------"
set history=1000                " remember more commands and search history
set undolevels=1000             " use many muchos levels of undo

" Use Q for formatting the current paragraph (or selection)
vmap Q gq
nmap Q gqap

"-------------Tab Management--------------"

nmap <leader>1 1gt<cr>
inoremap <leader>1 <Esc>1gt<CR>

nmap <leader>2 2gt<cr>
inoremap <leader>2 <Esc>2gt<CR>

nmap <leader>3 3gt<cr>
inoremap <leader>3 <Esc>3gt<CR>

nmap <leader>4 4gt<cr>
inoremap <leader>4 <Esc>4gt<CR>

nmap <leader>5 5gt<cr>
inoremap <leader>5 <Esc>5gt<CR>

nmap <leader>6 6gt<cr>
inoremap <leader>6 <Esc>6gt<CR>

nmap <leader>7 7gt<cr>
inoremap <leader>7 <Esc>7gt<CR>

nmap <leader>8 8gt<cr>
inoremap <leader>8 <Esc>8gt<CR>

nmap <leader>9 9gt<cr>
inoremap <leader>9 <Esc>9gt<CR>


nmap <leader>t :tabnew<cr>
inoremap <leader>t <Esc>:tabnew<CR>

nmap <leader>w :tabonly<cr>
inoremap <leader>w <Esc>:tabonly<CR>

" Buffer Management
nmap <silent> bp :bp<CR>
nmap <silent> bn :bn<CR>
nmap <silent> bl :ls<CR>


set autowrite  "Save on buffer switch "

noremap <silent> <C-S>          :update<CR>
vnoremap <silent> <C-S>         <C-C>:update<CR>
inoremap <silent> <C-S>         <C-O>:update<CR>


"-------------GENERAL SETTINGS--------------"
set showmode                    " always show what mode we're currently editing in "
set nowrap                      " don't wrap lines "
set backspace=indent,eol,start  " allow backspacing over everything in insert mode "
set visualbell                  " don't beep "
set noerrorbells                " don't beep "
set mouse=a                     " Allows Your To Use Mouse "
set timeout timeoutlen=1000 ttimeoutlen=10
set bg=dark
set go=a

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

noremap Y y$<cr>

" Set Mappings to move lines  using Shift then Arrow Keys

nnoremap <S-Down> :m .+1<CR>==
nnoremap <S-Up> :m .-2<CR>==
inoremap <S-Down> <Esc>:m .+1<CR>==gi
inoremap <S-Up> <Esc>:m .-2<CR>==gi
vnoremap <S-Down> :m '>+1<CR>gv=gv
vnoremap <S-Up> :m '<-2<CR>gv=gv

"
"/
"/ NERD TREE
"/
nmap ` :NERDTreeToggle<cr>
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let NERDTreeHijackNetrw = 0
let g:NERDTreeGitStatusWithFlags = 1


"/
"/ NERD TREE SYNTAX HIGHLIGHT
"/
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
let g:NERDTreeHighlightFolders = 1
let g:NERDTreeHighlightFoldersFullName = 1
"/
"/ NerdTree Git
"/

let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

"/
"/ Vim Vinegar
"/

" press [dash] to view NetrW "
" press Ctrl [6] to go back "

"/
"/ CtrlP
"/
"nmap <C-P> :FZF<CR>
map <C-p> :CtrlP<cr>
"nmap <C-t> :CtrlPBufTag<cr>
"nmap <C-e> :CtrlPMRUFiles<cr>
"let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|tags\|bootstrap\|tests\|vendor\|storage\|laradock\|docker\|npm-debug|build|dist'
"let g:ctrlp_match_window = 'top,order:ttb,min:1,max:30,results:30'

" I don't want to pull up these folders/files when calling CtrlP "
"set wildignore+=*/vendor/**
"set wildignore+=*/node_modules/**
"set wildignore+=*/tags/**
"set wildignore+=*/build/**


"Once CtrlP is open:

"Press <F5> to purge the cache for the current directory to get new files, remove deleted files and apply new ignore options.
"Press <c-f> and <c-b> to cycle between modes.
"Press <c-d> to switch to filename only search instead of full path.
"Press <c-r> to switch to regexp mode.
"Use <c-j>, <c-k> or the arrow keys to navigate the result list.
"Use <c-t> or <c-v>, <c-x> to open the selected entry in a new tab or in a new split.
"Use <c-n>, <c-p> to select the next/previous string in the prompt's history.
"Use <c-y> to create a new file and its parent directories.
"Use <c-z> to mark/unmark multiple files and <c-o> to open them.
"Run :help ctrlp-mappings or submit ? in CtrlP for more mapping help.


"Pasting large amounts of text into Vim "
set pastetoggle=<F2>

" Undo Redo Remap
nnoremap <C-Z> u
nnoremap <C-Y> <C-R>

" Sudo Save "
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!


"-------------SEARCH--------------"
highlight Search cterm=underline
set ignorecase                              " ignore case when searching "
set smartcase                               " ignore case if search pattern is all lowercase "
set hlsearch                                " Highlight all matched terms. "
set incsearch                               " Incrementally highlight, as we type. "

nnoremap ,<leader> :set hlsearch!<CR>

"-------------INDENTION--------------"
set autoindent                  " always set autoindenting on "
set copyindent                  " copy the previous indentation on autoindenting "


"-------------TABS--------------"
set smarttab
set tabstop=4                   " a tab is four spaces "
set softtabstop=4               " when hitting <BS>, pretend like a tab is removed, even if spaces "
set expandtab                   " expand tabs by default (overloadable per file type later) "
set shiftwidth=4                " number of spaces to use for autoindenting "
set shiftround                  " use multiple of shiftwidth when indenting with '<' and '>' "

" Some basics:
	nnoremap c "_c
	set nocompatible
	filetype plugin on
	syntax on
	set encoding=utf-8
	set number relativenumber

" Enable autocompletion:
	set wildmode=longest,list,full
" Disables automatic commenting on newline:
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Goyo plugin makes text more readable when writing prose:
	map <leader>wp :Goyo \| set bg=light \| set linebreak<CR>

" Splits open at the bottom and right, which is non-retarded, unlike vim defaults.
	set splitbelow splitright

" Nerd tree
	autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"-------------Split Management--------------"
" https://thoughtbot.com/blog/vim-splits-move-faster-and-more-naturally
" Split Default Layout"
    set splitbelow
    set splitright
    set fillchars+=stl:\ ,stlnc:\ "
    hi VertSplit cterm=none ctermfg=red ctermbg=none

"Resizing Split"
    nmap == :vertical resize +5<cr>
    nmap -- :vertical resize -5<cr>
    nmap =25 :vertical resize 40<cr>
    nmap =50 <c-w>=
    nmap =75 :vertical resize 120<cr>
"Resizing Split Horizotal
    nmap -5 :res -5<cr>
    nmap __ :res -5<cr>
    nmap =5 :res +5<cr>
    nmap ++ :res +5<cr>

" Opening splits "
    nmap vsp :vsplit<cr>
    nmap sp :split<cr>

" Shortcutting split navigation, saving a keypress:
	map <C-h> <C-w>h
	map <C-j> <C-w>j
	map <C-k> <C-w>k
	map <C-l> <C-w>l

" Check file in shellcheck:
	map <leader>sc :!clear && shellcheck %<CR>

    " Replace all is aliased to S.
	nnoremap S :%s//g<Left><Left>

" Compile document, be it groff/LaTeX/markdown/etc.
	map <leader>c :w! \| !compiler <c-r>%<CR>

" Open corresponding .pdf/.html or preview
	map <leader><leader>p :!opout <c-r>%<CR><CR>

" Runs a script that cleans out tex build files whenever I close out of a .tex file.
	autocmd VimLeave *.tex !texclear %

" Automatically deletes all trailing whitespace and newlines at end of file on save.
	autocmd BufWritePre * %s/\s\+$//e
	autocmd BufWritepre * %s/\n\+\%$//e

" When shortcut files are updated, renew bash and ranger configs with new material:
	autocmd BufWritePost files,directories !shortcuts

" Run xrdb whenever Xdefaults or Xresources are updated.
	autocmd BufWritePost *Xresources,*Xdefaults !xrdb %

" Run DartFmt whenever We edit .dart files
    autocmd BufWritePost FileType dart  *.dart :DartFmt

    let g:dart_format_on_save = 1


"" dwmblocks
    autocmd BufWritePost */dwmblocks/config.h !sudo make install && { killall -q dwmblocks;setsid dwmblocks }

" Add Commenter
let g:NERDToggleCheckAllLines = 1
nmap <a-/>   <Plug>NERDCommenterToggle
vmap <a-/>   <Plug>NERDCommenterToggle<CR>gv

" COC NVIM START
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
"inoremap <silent><expr> <TAB>
      "\ pumvisible() ? "\<C-n>" :
      "\ <SID>check_back_space() ? "\<TAB>" :
      "\ coc#refresh()
"inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

"function! s:check_back_space() abort
  "let col = col('.') - 1
  "return !col || getline('.')[col - 1]  =~# '\s'
"endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <m-.> coc#refresh()
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> gp <Plug>(coc-diagnostic-prev)
nmap <silent> gn <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gD <Plug>(coc-type-definition)
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

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap keys for applying codeAction to the current line.
nmap <m-.> <Plug>(coc-codeaction)



" Apply AutoFix to problem on the current line.
nmap <m-f> <Plug>(coc-fix-current)

" Applying codeAction to the selected region.
" this will work only after pressing jk
" allow us to wrap widget and other actions when we select a widget
""nmap <silent> <addnew> <Plug>(coc-codeaction-selected)


" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
"nmap <silent> <C-s> <Plug>(coc-range-select)
"xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
"command! -nargs=? Fold :call     CocAction('fold', <f-args>)


" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
"nnoremap <silent><leader>o  :OR<cr>
nnoremap <m-F> :OR<CR>




" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent><nowait> <space>d  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space><space>  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
"nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
"nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
"nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" COC NVIM END


" Dart
" Format Code by FileType
"autocmd FileType dart nnoremap <buffer><Leader>f :DartFmt<cr>
"autocmd FileType rs nnoremap <buffer><Leader>f :RustFmt<cr>


" VIM LSC
let g:lsc_server_commands = {'dart': 'dart_language_server'}
let g:lsc_enable_autocomplete = v:false
"let g:lsc_auto_map = {
    "\ 'GoToDefinition': '<leader>gg',
    "\ 'GoToDefinitionSplit': ['<leader>sp', '<leader>vsp'],
    "\ 'FindReferences': '<leader>ff',
    "\ 'NextReference': '<leader>n',
    "\ 'PreviousReference': '<leader>p',
    "\ 'FindImplementations': '<leader>ii',
    "\ 'FindCodeActions': '<leader>ca',
    "\ 'Rename': '<leader>rn',
    "\ 'ShowHover': v:true,
    "\ 'DocumentSymbol': '<leader>ds',
    "\ 'WorkspaceSymbol': '<leader>s',
    "\ 'SignatureHelp': '<leader>sh',
    "\ 'Completion': 'completefunc',
    "\}
" Vim Fugitive
nmap <leader>gj :diffget //3<CR>
nmap <leader>gf :diffget //2<CR>
nmap <leader>gs :G<CR>

autocmd CursorHold * silent call CocActionAsync('highlight')
" bind replace color code
nnoremap <m-c> :call CocAction('pickColor')<CR>
nnoremap <m-C> :call CocAction('colorPresentation')<CR>
nnoremap <m-g> :GitGutterToggle<CR>

" Flutter Commands
autocmd FileType dart nnoremap <buffer><Leader>fr :FlutterRun --enable-software-rendering<cr>
autocmd FileType dart nnoremap <buffer><Leader>r :FlutterHotReload<cr>
nnoremap <leader>fd :below new output:///flutter-dev <CR>
autocmd FileType dart nnoremap <buffer><Leader>fD :FlutterDevices<cr>
"autocmd FileType dart nnoremap <buffer><Leader>fe :FlutterEmulators<cr>
nnoremap <leader>fe :CocCommand flutter.emulators <CR>
autocmd FileType dart nnoremap <buffer><Leader>R :FlutterHotRestart<cr>
autocmd FileType dart nnoremap <buffer><Leader>fq :FlutterQuit<cr>
autocmd FileType dart nnoremap <buffer><Leader>vd :FlutterVisualDebug<cr>
"autocmd FileType dart nnoremap <buffer><Leader>ts :DartToggleFormatOnSave<cr>
"autocmd FileType dart nnoremap <buffer><Leader>rN :CocCommand document.renameCurrentWord<cr>

" folding code tuts
" to select code inside a block {} use `viB` if you want to include the other vaB
" then to fold the code use `zf`

let g:EasyMotion_do_mapping = 0 " Disable default mappings
let g:EasyMotion_smartcase = 1
" single character
nmap f <Plug>(easymotion-overwin-f)

" two character
"nmap `` <Plug>(easymotion-overwin-f2)
" jump on any word
"nmap <silent><nowait> <space>w  <Plug>(easymotion-w)
" JK motions: Line motions
"nmap <silent><nowait> <space>j  <Plug>(easymotion-j)
"nmap <silent><nowait> <space>k  <Plug>(easymotion-k)

" source vim
nnoremap  <leader>sv :source $MYVIMRC <cr>

let g:loaded_python_provider=0
let g:ruby_host_prog='/home/uriah/.gem/ruby/2.7.0/bin/neovim-ruby-host'
"let g:python_host_prog= '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python3'

inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

"coc config
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-flutter',
  \  'coc-yaml'
  \ ]

imap <tab> <Plug>(coc-snippets-expand)
let g:UltiSnipsExpandTrigger = '<Nop>'
let g:coc_snippet_next = '<TAB>'
let g:coc_snippet_prev = '<S-TAB>'
" Svelte
let g:svelte_indent_script = 0
let g:svelte_indent_style = 0
let g:svelte_preprocessors = ['typescript']
