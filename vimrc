scriptencoding utf-8
set encoding=utf-8

" Leader
let &t_Co=256
let mapleader = ","

set backspace=2   " Backspace deletes like most programs in insert mode
set nobackup
set nowritebackup
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set history=50
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set laststatus=2  " Always display the status line
set autowrite     " Automatically :write before running commands
set modelines=0   " Disable modelines as a security precaution
set nomodeline

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

set background=dark
colorscheme solarized

" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

filetype plugin indent on

augroup vimrcEx
  autocmd!

  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  " Set syntax highlighting for specific file types
  autocmd BufRead,BufNewFile *.md set filetype=markdown
  autocmd BufRead,BufNewFile .{jscs,jshint,eslint}rc set filetype=json
  autocmd BufRead,BufNewFile
    \ aliases.local,
    \zshenv.local,zlogin.local,zlogout.local,zshrc.local,zprofile.local,
    \*/zsh/configs/*
    \ set filetype=sh
  autocmd BufRead,BufNewFile gitconfig.local set filetype=gitconfig
  autocmd BufRead,BufNewFile tmux.conf.local set filetype=tmux
  autocmd BufRead,BufNewFile vimrc.local set filetype=vim
augroup END

" ALE linting events
augroup ale
  autocmd!

  if g:has_async
    autocmd VimEnter *
      \ set updatetime=1000 |
      \ let g:ale_lint_on_text_changed = 0
    autocmd CursorHold * call ale#Queue(0)
    autocmd CursorHoldI * call ale#Queue(0)
    autocmd InsertEnter * call ale#Queue(0)
    autocmd InsertLeave * call ale#Queue(0)
  else
    echoerr "The thoughtbot dotfiles require NeoVim or Vim 8"
  endif
augroup END

" When the type of shell script is /bin/sh, assume a POSIX-compatible
" shell for syntax highlighting purposes.
let g:is_posix = 1

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" Use one space, not two, after punctuation.
set nojoinspaces

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in fzf for listing files. Lightning fast and respects .gitignore
  let $FZF_DEFAULT_COMMAND = 'ag --literal --files-with-matches --nocolor --hidden -g ""'

  if !exists(":Ag")
    command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
    nnoremap \ :Ag<SPACE>
  endif
endif

let g:CommandTMaxHeight = 10
let g:CommandTMatchWindowReverse = 1

" Make it obvious where 80 characters is
set textwidth=80
set colorcolumn=+1

" Numbers
set number
set relativenumber
set numberwidth=4

" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
set wildmode=list:longest,list:full
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<Tab>"
    else
        return "\<C-p>"
    endif
endfunction
inoremap <Tab> <C-r>=InsertTabWrapper()<CR>
inoremap <S-Tab> <C-n>

" Switch between the last two files
nnoremap <Leader><Leader> <C-^>

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" Set tags for vim-fugitive
set tags^=.git/tags

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Move between linting errors
nnoremap ]r :ALENextWrap<CR>
nnoremap [r :ALEPreviousWrap<CR>

" Map Ctrl + p to open fuzzy find (FZF)
nnoremap <c-p> :Files<cr>

" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =


" configure syntastic syntax checking to check on open as well as save
let g:syntastic_check_on_open=1
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]

" Aggregate errors from all checkers
let g:syntastic_aggregate_errors = 1

" Doesnt check when quiting
let g:syntastic_check_on_wq = 0

" Auto open the errors list when they are detected
" let g:syntastic_auto_loc_list = 1

" Always stick any detected errors in the location-list
let g:syntastic_always_populate_loc_list = 1

" Set spellfile to location that is guaranteed to exist, can be symlinked to

" Dropbox or kept in Git and managed outside of thoughtbot/dotfiles using rcm.
set spellfile=$HOME/.vim-spell-en.utf-8.add

" Autocomplete with dictionary words when spell check is on
set complete=.,w,b,t,i

" Always use vertical diffs
set diffopt+=vertical

" Leave insert mode using jj
imap jj <Esc>

" Expand %% to current file directory as abbr.
cabbr <expr> %% expand('%:p:h')

" Setup UltiSnips triggers
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" Setup Folds
set nofoldenable
set foldnestmax=10
set foldmethod=indent

" Open NerdTree
map <C-n> :NERDTreeToggle<CR>

" Setup Poerline
" Enable the list of buffers
set showtabline=2

set laststatus=2

" Setup buffers as tabs

" This allows buffers to be hidden if you've modified a buffer.
" This is almost a must if you wish to use buffers in this way.
set hidden

" Open a local project vimrc if there's one
if filereadable(glob("./.git/vimrc.local"))
  source ./.git/vimrc.local
endif


" PHP Settings ======

" Setup Php namespaces
" inoremap ,u <C-O>:call PhpInsertUse()<CR>
" noremap <leader>u :call PhpInsertUse()<CR>
"
" inoremap ,e <C-O>:call PhpExpandClass()<CR>
" noremap <leader>e :call PhpExpandClass()<CR>

" Set checkers for PHP
" let g:syntastic_php_checkers = [ 'php', 'phpcs', 'phpmd' ]
" let g:syntastic_php_phpcs_args = "--standard=PSR2"
" let g:syntastic_php_phpmd_args = "cleancode,codesize,controversial,design,naming,unusedcode"


" Style for PHP
" au FileType php set tabstop=4
" au FileType php set shiftwidth=4
" au FileType php set textwidth=120
" au FileType php set foldenable
" au FileType php set foldlevel=1

" Test current file on PHPUnit
" function! RunPHPUnitCurrentFile()
"   let s:phpunit_default_command = "phpunit %"
"   let s:phpunit_command = "!clear && echo " . s:phpunit_default_command . " && " . s:phpunit_default_command
"   execute s:phpunit_command
" endfunction
"
" au FileType php nnoremap <leader>t :call RunPHPUnitCurrentFile()<CR>
" au FileType php set omnifunc=phpcomplete#CompletePHP

"  Setup PHP Documentator to run on <leader>d
" let g:pdv_template_dir = $HOME ."/.vim/bundle/pdv/templates_snip"
" au FileType php nnoremap <buffer> <leader>d :call pdv#DocumentWithSnip()<CR>

" Ruby Settings =====
let g:rspec_command = "call VtrSendCommand('rspec --profile -- {spec}')"

" Javascript Settings =====
let g:syntastic_javascript_checkers = [ 'eslint' ]

" HTML Settings =====
let g:syntastic_html_tidy_exec = 'tidy5'

let g:syntastic_html_tidy_ignore_errors = [
  \ ' proprietary attribute "ng-',
  \ ' proprietary attribute "item',
  \ ' proprietary attribute "property',
  \ ' proprietary attribute "ui-',
  \ '<ng-include> is not recognized',
  \ 'discarding unexpected <ng',
  \ 'discarding unexpected </ng'
  \ ]

" Go Settings ==========
au FileType go set noexpandtab

" Hide tab extra char
au FileType go set listchars+=tab:  

" Automatically insert import paths
let g:go_fmt_command = "goimports"

" Leader ====================
" ===========================

" Map CommandT to CtrlP
map <c-p> :CommandT<CR>

nnoremap <leader>r :RunInInteractiveShell<space>

" Switch between the last two files
nnoremap <leader><leader> <c-^>

" Open NERDTree on current file
nmap <leader>n :NERDTreeFind<CR>

" Zoom in/out vim pane
nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>= :wincmd =<cr>

" VTR mappings
nnoremap <leader>va :VtrAttachToPane<cr>
nnoremap <leader>or :VtrOpenRunner<cr>
nnoremap <leader>fr :VtrFocusRunner<cr>

" Search the word under cursor on current project
nnoremap <leader>k :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" Search the word under cursor as file name using Ctrl+P
nmap <leader>lw :CommandT<CR><C-\>w

" Display syntax errors panels
nmap <leader>eo :Errors<CR>
nmap <leader>ec :lclose<CR>

" Move to the next buffer
nmap <leader>a :bnext<CR>

" Move to the previous buffer
nmap <leader>z :bprevious<CR>

" Close the current buffer and move to the previous one
nmap <leader>bq :bp <BAR> bd #<CR>

" Close all buffers but the current
nmap <leader>ba :BufOnly<CR>

" Show all open buffers and their status
nmap <leader>bl :ls<CR>

" Ruby RSpec
au FileType ruby nnoremap <leader>t :call RunCurrentSpecFile()<CR>
au FileType ruby nnoremap <leader>s :call RunNearestSpec()<CR>
au FileType ruby nnoremap <leader>l :call RunLastSpec()<CR>

" Go Leaders
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>i <Plug>(go-info)
au FileType go nmap <leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <leader>dv <Plug>(go-def-vertical)

let g:syntastic_ruby_checkers = ['rubocop']

function! ListLeaders()
     silent! redir @a
     silent! nmap <LEADER>
     silent! redir END
     silent! new
     silent! put! a
     silent! g/^s*$/d
     silent! %s/^.*,//
     silent! normal ggVg
     silent! sort
     silent! let lines = getline(1,"$")
endfunction

" Local config
if filereadable($HOME . "/.vimrc.local")
  source ~/.vimrc.local
endif
