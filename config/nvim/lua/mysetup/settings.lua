
vim.opt.mouse = ''
-- vim.opt.clipboard = 'unnamedplus'

-- basic settings
vim.opt.encoding = "utf-8"
vim.opt.backspace = "indent,eol,start" -- backspace works on every char in insert mode
vim.opt.backup = false -- Don't write backup on conflicts
vim.opt.writebackup = false -- Don't write backup on conflicts
vim.opt.swapfile = false -- Don't create swapfile
vim.opt.completeopt = 'menuone,noselect' -- Always show menu for completion, never select
vim.opt.history = 1000
vim.opt.startofline = true -- Move cursor to the first non-blank of the line
vim.opt.autowrite = true -- Write contents when buffer is changed
vim.opt.guicursor = ''

-- Mapping waiting time
vim.opt.updatetime = 250
vim.opt.timeout = true -- Time out on key codes
vim.opt.ttimeout = true -- Timeout on key codes
vim.opt.ttimeoutlen = 100 -- Wait for 100ms for a key code

-- Display
vim.opt.laststatus = 2 -- always show status line
vim.opt.foldenable = false -- All folds open
vim.opt.foldlevel = 4 -- limit folding to 4 levels
vim.opt.foldmethod = 'syntax' -- use language syntax to generate folds

vim.opt.ruler = true -- Show cursor location on status bar
vim.opt.wrap = false --do not wrap lines even if very long
vim.opt.eol = false -- show if there's no eol char
vim.opt.showbreak= '↪' -- character to show when line is broken

vim.opt.textwidth = 120
vim.opt.colorcolumn = '+1'

vim.opt.splitbelow = true -- Split below current one
vim.opt.splitright = true -- Split tom the right of current one

vim.cmd('autocmd VimResized * :wincmd =')

-- Sidebar
vim.opt.number = true -- line number on the left
vim.opt.numberwidth = 4 -- always reserve 3 spaces for line number
vim.opt.relativenumber = true -- Show relative numbers on the left
vim.opt.signcolumn = 'yes' -- keep 1 column for coc.vim  check
vim.opt.modelines = 0 -- Disable mode lines
vim.opt.modeline = false -- Disable mode lines
vim.opt.showcmd = true -- display command in bottom bar


-- Search
vim.opt.incsearch = true -- starts searching as soon as typing, without enter needed
vim.opt.ignorecase = true -- ignore letter case when searching
vim.opt.smartcase = true -- case insentive unless capitals used in search
vim.opt.hlsearch = false -- Don't highlight search

vim.opt.matchtime = 2 -- delay before showing matching paren
vim.opt.matchpairs = vim.o.matchpairs .. ",<:>"

vim.cmd("cabbr <expr> %% expand('%:p:h')")


-- White characters
vim.opt.autoindent = true -- Copy indent from current line when starting a new line
vim.opt.smartindent = true -- Syntax based indentation
vim.opt.tabstop = 2 -- 1 tab = 2 spaces
vim.opt.shiftwidth = 2 -- indentation rule
vim.opt.shiftround = true -- Round indent to multiple of shiftwidth
vim.opt.formatoptions = 'qnj1' -- q  - comment formatting; n - numbered lists; j - remove comment when joining lines; 1 - don't break after one-letter word
vim.opt.expandtab = true -- expand tab to spaces
vim.opt.list = true
vim.opt.listchars = 'tab:»·,trail:·,nbsp:·'
vim.opt.joinspaces = false -- Insert one space after '.', '?' and '!' with join

-- Commands mode
vim.opt.wildmenu = true -- on TAB, complete options for system command
vim.opt.wildignore = 'deps,.svn,CVS,.git,.hg,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,.DS_Store,*.aux,*.out,*.toc' -- Ignore these when expanding wildcards
vim.opt.wildmode = 'list:longest,list:full'

vim.fn.sign_define("DiagnosticSignError", {text = "✘", texthl = "DiagnosticSignError"})
vim.fn.sign_define("DiagnosticSignWarn", {text = "▲", texthl = "DiagnosticSignWarn"})
vim.fn.sign_define("DiagnosticSignInfo", {text = "»", texthl = "DiagnosticSignInfo"})
vim.fn.sign_define("DiagnosticSignHint", {text = "⚑", texthl = "DiagnosticSignHint"})
