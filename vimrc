" Leader
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

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

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
  autocmd BufRead,BufNewFile Appraisals set filetype=ruby
  autocmd BufRead,BufNewFile *.md set filetype=markdown

  " Enable spellchecking for Markdown
  autocmd FileType markdown setlocal spell

  " Automatically wrap at 80 characters for Markdown
  autocmd BufRead,BufNewFile *.md setlocal textwidth=80

  " Automatically wrap at 72 characters and spell check git commit messages
  autocmd FileType gitcommit setlocal textwidth=72
  autocmd FileType gitcommit setlocal spell

  " Allow stylesheets to autocomplete hyphenated words
  autocmd FileType css,scss,sass setlocal iskeyword+=-
augroup END

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

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
set wildmenu wildmode=list:full

" Exclude Javascript files in :Rtags via rails.vim due to warnings when parsing
let g:Tlist_Ctags_Cmd="ctags --exclude='*.js'"

" Index ctags from any project, including those outside Rails
set tags+=.git/tags,.git/vendor-tags


" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

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

" Setup Airline
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" Add airline powerfonts symbols
let g:airline_powerline_fonts = 1

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
let g:rspec_command = "call VtrSendCommand('bundle exec rspec {spec}')"

" Javascript Settings =====
let g:syntastic_javascript_checkers = [ 'jshint' ]

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

" Leader ====================
" ===========================

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
nnoremap <leader>sc :VtrSendCommandToRunner<cr>
nnoremap <leader>sl :VtrSendLinesToRunner<cr>
vnoremap <leader>sl :VtrSendLinesToRunner<cr>
nnoremap <leader>or :VtrOpenRunner<cr>
nnoremap <leader>kr :VtrKillRunner<cr>
nnoremap <leader>fr :VtrFocusRunner<cr>
nnoremap <leader>cr :VtrClearRunner<cr>
nnoremap <leader>sf :VtrSendFile<cr>

" Search the word under cursor on current project
nnoremap <leader>k :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" Search the word under cursor as file name using Ctrl+P
nmap <leader>lw :CtrlP<CR><C-\>w

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

" Local config
if filereadable($HOME . "/.vimrc.local")
  source ~/.vimrc.local
endif
