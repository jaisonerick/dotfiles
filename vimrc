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

" set Vim-specific sequences for RGB colors
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

set background=dark
let g:gruvbox_italic='1'
let g:gruvbox_contrast_dark='dark' " medium, dark
let g:gruvbox_invert_selection='0'
autocmd vimenter * ++nested colorscheme gruvbox

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
endif

" Make it obvious where 80 characters is
set textwidth=120
set colorcolumn=+1
set signcolumn=yes

" Numbers
set number
set relativenumber
set numberwidth=4

" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
set wildmode=list:longest,list:full

" Switch between the last two files
nnoremap <Leader><Leader> <C-^>

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

noremap [fzf-p]   <Nop>
nmap <C-p> [fzf-p]
xmap <C-p> [fzf-p]

" Map Ctrl + p to open fuzzy find (FZF)
nnoremap <silent> [fzf-p]        :<C-u>FzfPreviewProjectFilesRpc<CR>
nnoremap <silent> <Leader>gs             :<C-u>FzfPreviewGitStatusRpc<CR>
" nnoremap <silent> [fzf-p]g    :<C-u>FzfPreviewGitStatusRpc<CR>
" nnoremap <silent> [fzf-p]a    :<C-u>FzfPreviewGitActionsRpc<CR>
" nnoremap <silent> [fzf-p]o     :<C-u>FzfPreviewBuffersRpc<CR>
" nnoremap <silent> [fzf-p]/     :<C-u>FzfPreviewLinesRpc --add-fzf-arg=--no-sort --add-fzf-arg=--query="'"<CR>

let g:fzf_preview_default_fzf_options = {
    \ '--layout': 'default',
    \ '--preview-window': 'wrap',
    \ '--info': 'hidden'
    \ }

let g:fzf_preview_direct_window_option = 'horizontal belowright 20new'

" Set spellfile to location that is guaranteed to exist, can be symlinked to
" Dropbox or kept in Git and managed outside of thoughtbot/dotfiles using rcm.
set spellfile=$HOME/.vim-spell-en.utf-8.add

" Autocomplete with dictionary words when spell check is on
set complete+=kspell

" Always use vertical diffs
set diffopt+=vertical

" Local config
if filereadable($HOME . "/.vimrc.local")
source ~/.vimrc.local
endif

" ==== OWN CONFIGS ====

" Leave insert mode using jj
imap jj <Esc>

" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

" Expand %% to current file directory as abbr.
cabbr <expr> %% expand('%:p:h')

" Setup Folds
set nofoldenable
set foldnestmax=10
set foldmethod=indent

" Open NerdTree
map <C-n> :NERDTreeToggle<CR>

" Setup buffers as tabs

" This allows buffers to be hidden if you've modified a buffer.
" This is almost a must if you wish to use buffers in this way.
set hidden

" Open a local project vimrc if there's one
if filereadable(glob("./.git/vimrc.local"))
  source ./.git/vimrc.local
endif

" Ruby Settings =====
let g:rspec_command = "call VtrSendCommand('bin/rspec --profile -- {spec}')"

augroup filetypedetect
  au BufRead,BufNewFile *.inky set filetype=eruby.html
augroup END

" Javascript Settings =====
let g:jsx_ext_required = 0

let g:html_indent_inctags = 'p,li,dt,dd,container,columns,row,button,wrapper,callout'

" COC configurations
let g:coc_global_extensions = ['coc-fzf-preview', 'coc-json', 'coc-git', 'coc-emmet','coc-html', 'coc-yaml', 'coc-snippets']
let g:coc_global_extensions += ['coc-prettier']
let g:coc_global_extensions += ['coc-eslint']
let g:coc_global_extensions += ['coc-tsserver']


nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>c  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>
function! ShowDocumentation()
if CocAction('hasProvider', 'hover')
  call CocActionAsync('doHover')
else
  call feedkeys('K', 'in')
endif
endfunction

autocmd CursorHold * silent call CocActionAsync('highlight')

" Fix syntax highlight for Coc plugin floating errors
hi CocErrorFloat guifg=Magenta guibg=Magenta

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
    \ coc#pum#visible() ? coc#pum#next(1) :
    \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
    \ CheckBackspace() ? "\<Tab>" :
    \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                            \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"


function! CheckBackspace() abort
let col = col('.') - 1
return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Display TagBar
nmap <c-t> :TagbarToggle<CR>

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
" nnoremap <leader>k :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
nnoremap <leader>k :<C-u>FzfPreviewProjectGrepRp<Space>"\b<C-R><C-W>\b"<CR>

" Display syntax errors panels
nmap <leader>eo :<C-u>CocCommand fzf-preview.CocDiagnostics<CR>

" Move to the next buffer
nmap <leader>a :bnext<CR>

" Move to the previous buffer
nmap <leader>z :bprevious<CR>

" Close the current buffer and move to the previous one
nmap <leader>bq :bp <BAR> bd #<CR>

" Close all buffers but the current
nmap <leader>ba :BufOnly<CR>

" Show all open buffers and their status
nmap <leader>bl :<C-u>FzfPreviewAllBuffersRpc<CR>

" vim-test mappings
nnoremap <silent> <Leader>t :TestFile<CR>
nnoremap <silent> <Leader>s :TestNearest<CR>
nnoremap <silent> <Leader>l :TestLast<CR>
nnoremap <silent> <leader>gt :TestVisit<CR>

" Go Leaders
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

let g:netrw_browsex_viewer = "open"
