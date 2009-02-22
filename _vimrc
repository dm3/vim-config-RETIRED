" Filename:      .vimrc
" Description:   Vim configuration file (GUI specific)
" Last Modified: Last Modified: Ñá 2009-02-21 22:26:34 (FLE Standard Time)

set nocompatible
source $VIMRUNTIME/mswin.vim
behave mswin

" English, please
set langmenu=en_gb.utf-8
language en

" Use english for spellchecking, but don't spellcheck by default
if version >= 700
   set spl=en spell
   set nospell
endif

set backspace=2

" This shows what you are typing as a command.
set showcmd

" Needed for Syntax Highlighting and stuff
filetype plugin indent on
syntax enable
set grepprg=grep\ -nH\ $*

" Line Numbers PWN!
set number

" When I close a tab, remove the buffer
set nohidden

" Set off the other paren
highlight MatchParen ctermbg=4

" Remap jj and kk to switch to escape mode
inoremap jj <Esc>
inoremap kk <Esc>

"{{{Files, Backup

"Lookup ctags "tags" file up the directory, until one is found:
set tags=tags;/

" Keep backups in one place
set backup
set backupdir=$VIMRUNTIME/.vim/backup
set directory=$VIMRUNTIME/.vim/tmp

"}}}
"{{{Auto Commands

augroup scala-project
  au!
  autocmd BufNewFile,BufRead    */development/projects/*       compiler scala
augroup END

" Highlight all occurences of word under cursor
highlight flicker guibg=LightCyan
 au CursorMoved <buffer> exe 'match flicker /\V\<'.escape(expand('<cword>'), '/').'\>/'

" Automatically cd into the directory that the file is in
autocmd BufEnter * execute "chdir ".escape(expand("%:p:h"), ' ')

" Remove any trailing whitespace that is in the file
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif

augroup misc
    autocmd!
    autocmd BufReadPost * call JumpToLastPosition()
    autocmd FileChangedShell * call WarningMsg("File changed outside of vim")
augroup end

" Restore cursor position to where it was before
augroup JumpCursorOnEdit
   au!
   autocmd BufReadPost *
            \ if expand("<afile>:p:h") !=? $TEMP |
            \   if line("'\"") > 1 && line("'\"") <= line("$") |
            \     let JumpCursorOnEdit_foo = line("'\"") |
            \     let b:doopenfold = 1 |
            \     if (foldlevel(JumpCursorOnEdit_foo) > foldlevel(JumpCursorOnEdit_foo - 1)) |
            \        let JumpCursorOnEdit_foo = JumpCursorOnEdit_foo - 1 |
            \        let b:doopenfold = 2 |
            \     endif |
            \     exe JumpCursorOnEdit_foo |
            \   endif |
            \ endif
   " Need to postpone using "zv" until after reading the modelines.
   autocmd BufWinEnter *
            \ if exists("b:doopenfold") |
            \   exe "normal zv" |
            \   if(b:doopenfold > 1) |
            \       exe  "+".1 |
            \   endif |
            \   unlet b:doopenfold |
            \ endif
augroup END

"}}}
"{{{Text-Formatting, Identing, Tabbing

" Folding Stuffs
set foldmethod=marker
"set foldmethod=syntax      " fold based on syntax
set foldclose=all          " auto-close fold when cursor leaves fold
set foldcolumn=2

" Who doesn't like autoindent?
set autoindent

" Spaces are better than a tab character
set expandtab
set smarttab

" Who wants an 8 character tab?  Not me!
set shiftwidth=4
set softtabstop=4

" Use better looking listchars if they are supported
if has("multi_byte")
    set listchars=tab:»\ ,extends:›,precedes:‹,trail:·,nbsp:?,eol:$
else
    set listchars=tab:>\ ,extends:>,precedes:<,trail:-,nbsp:%,eol:$
endif

"}}}
"{{{Searching, Substituting

set incsearch   " Show search matches as you type
set ignorecase  " Ignore case when searching
set smartcase   " Override 'ignorecase' when needed
set hlsearch    " Highlight search results
set showmatch   " Show matching bracket

"}}}
"{{{Windows, Tabs

set mouse=a           " Enable the mouse for all modes
set mousehide         " Hide mouse while typing
set mousemodel=popup  " Use popup menu for right mouse button

set splitright  " When splitting vertically, split to the right
set splitbelow  " When splitting horizontally, split below

set scrolloff=2      " Lines visible above/below cursor when scrolling
set sidescrolloff=5  " Lines visible to the left/right of cursor when scrolling

set tabpagemax=128  "Maximum number of tabs open

"}}}
" Plugin Settings ---------------------------------------------------------{{{1

let timestamp_format = '%a %Y-%m-%d %H:%M:%S (%z)'

let g:EnhCommentifyBindInInsert = 'No'
let g:EnhCommentifyPretty = 'Yes'
let g:EnhCommentifyAlignRight = 'Yes'
let g:EnhCommentifyUserMode = 'Yes'
let g:EnhCommentifyRespectIndent = 'Yes'
let g:EnhCommentifyUseBlockIndent = 'Yes'
let g:EnhCommentifyFirstLineMode = "yes"
let g:EnhCommentifyUserBindings = "yes"

let NERDSpaceDelims = 1
let NERDShutUp = 1
let NERDMapleader = '<leader>c'

let Tlist_Enable_Fold_Column = 0
let Tlist_Exit_OnlyWindow = 1
let Tlist_File_Fold_Auto_Close = 1
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Inc_Winwidth = 0
let Tlist_Show_One_File = 1
let Tlist_Auto_Highlight_Tag = 1
let Tlist_Auto_Update = 1
let Tlist_Highlight_Tag_On_BufEnter = 1

"}}}
" Abbreviations -----------------------------------------------------------{{{1

iab xstamp <c-r>=strftime(timestamp_format)<cr>
iab lastmod Last Modified: <c-r>=strftime(timestamp_format)<cr>

"}}}
"{{{Look and Feel

" Favorite Color Scheme
if has("gui_running")
   "colorscheme inkpot
   " Remove Toolbar
   set guioptions-=T
   "Terminus is AWESOME
   set guifont=Terminus\ 9
else
   colorscheme metacosm
endif

"Status line gnarliness
set laststatus=2
set statusline=%F%m%r%h%w\ (%{&ff}){%Y}\ [%l,%v][%p%%]

" }}}
" Menus, Completion -------------------------------------------------------{{{1

set completeopt=longest,menu,menuone
"               |       |    |
"               |       |    +-- Show popup even with one match
"               |       +------- Use popup menu with completions
"               +--------------- Insert longest completion match

set wildmenu  " Enable wildmenu for completion
set wildmode=longest:full,list:full
"            |            |
"            |            +-- List matches, complete first match
"            +--------------- Complete longest prefix, use wildmenu
"}}}
"{{{ Functions

" Make sure paste mode is on before pasting
function! SmartPaste()
    set paste
    normal! p=`]
    set nopaste
endfunction

" Find other occurrences of a word under the cursor
function! ChooseOccurrences()
    normal! [I
    let nr=input("Which one: ")
    if len(nr) == 0
        return
    endif
    execute "normal! ".nr."[\t"
endfunction

" Edit vim config files (if they exist)
function! EditConfig()
    for config in ['$MYGVIMRC', '$MYVIMRC']
        if exists(config)
            execute 'tabedit '.config
        endif
    endfor
endfunction

" Display a warning message
function! WarningMsg(message)
    echohl WarningMsg
    echo a:message
    echohl None
endfunction

" Display an error message
function! ErrorMsg(message)
    echohl ErrorMsg
    echo a:message
    echohl None
endfunction

" Places the cursor at the last position for a file
function! JumpToLastPosition()
    if line("'\"") > 0 && line("'\"") <= line("$")
        normal! g`"
    endif
endfunction

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

" Toggles the fold state under the cursor
function! ToggleFold()
    try
        if foldclosed(line('.')) < 0
            normal! zc
        else
            normal! zo
        endif
    catch
    endtry
endfunction

" Grep file under the current working directory
function! GrepUnder(query)
    execute "vimgrep ".expand(a:query)."j **"
    echo Title
    cwindow
endfunction
"}}}
"{{{ Mappings

let mapleader = '\'
let maplocalleader = '\'

nnoremap <silent> <leader>sp  :call SmartPaste()<cr>
nnoremap <silent> <leader>TT  :tabnew<cr>
nnoremap <silent> <leader>v   :call EditConfig()<cr>
nnoremap <silent> <leader>dcf :cd%:h<cr>
nnoremap <silent> <leader>fch :call ChooseOccurrences()<cr>
nnoremap <silent> <leader>fe  :Explore<cr>
nnoremap <silent> <leader>fn  :next<cr>
nnoremap <silent> <leader>fp  :prev<cr>
nnoremap <silent> <leader>fs  :Sexplore<cr>
nnoremap <silent> <leader>fv  :Vexplore<cr>
nnoremap <silent> <leader>mw  <c-w>_<c-w><bar>
nnoremap <silent> <leader>nh  :nohlsearch<cr>
nnoremap <silent> <leader>tcc :set cursorcolumn! cursorcolumn?<cr>
nnoremap <silent> <leader>tcl :set cursorline! cursorline?<cr>
nnoremap <silent> <leader>tlc :set list! list?<cr>
nnoremap <silent> <leader>tln :set number! number?<cr>
nnoremap <silent> <leader>tlw :set wrap! wrap?<cr>
nnoremap <silent> <leader>tnt :NERDTreeToggle<cr>
nnoremap <silent> <leader>ttl :TlistToggle<cr>
nnoremap <silent> <space>     :silent call ToggleFold()<cr>

" Help shortcut
nnoremap <leader>h :help<space>

" Start search with word under cursor
nnoremap <leader>z :s/\<<c-r>=expand("<cword>")<cr>\>/
vnoremap <leader>z :<c-u>s/\<<c-r>*\>/

" Start grep with word under cursor
nnoremap <leader>G :GrepUnder /<c-r>=expand("<cword>")<cr>/g
vnoremap <leader>G :<c-u>GrepUnder /<c-r>*/g

" Standard tab navigation
nnoremap <c-l> gt
nnoremap <c-h> gT

" Yank to end of line
nnoremap Y y$

" Paragraph formatting
nnoremap Q gqap
vnoremap Q gq
nmap <silent> <Leader>cc <Plug>Comment
nmap <silent> <Leader>uc <Plug>DeComment
nmap <silent> <Leader>eht <Plug>Traditional
nmap <silent> <Leader>ehf <Plug>FirstLine
vmap <silent> <Leader>cc <Plug>VisualComment
vmap <silent> <Leader>uc <Plug>VisualDeComment
vmap <silent> <Leader>eht <Plug>VisualTraditional
vmap <silent> <Leader>ehf <Plug>VisualFirstLine

"}}}
