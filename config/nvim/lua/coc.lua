-- COC configurations
vim.g.coc_global_extensions = {
  'coc-json', 'coc-git', 'coc-emmet','coc-html', 'coc-yaml', 'coc-snippets',
  'coc-prettier', 'coc-eslint', 'coc-tsserver', 'coc-deno', 'coc-ltex', 
  'coc-elixir'
}

nmap('gd', '<Plug>(coc-definition)')
nmap('gy', '<Plug>(coc-type-definition)')
nmap('gi', '<Plug>(coc-implementation)')
nmap('gr', '<Plug>(coc-references)')

-- Remap keys for applying codeAction to the current buffer.
nmap('<leader>c',  '<Plug>(coc-codeaction)')
-- Apply AutoFix to problem on the current line.
nmap('<leader>qf',  '<Plug>(coc-fix-current)')

nmap('[g', '<Plug>(coc-diagnostic-prev)')
nmap(']g', '<Plug>(coc-diagnostic-next)')

-- Symbol renaming.
nmap('<leader>rn', '<Plug>(coc-rename)')

-- Formatting selected code.
map('x', '<leader>f',  '<Plug>(coc-format-selected)')
nmap('<leader>f', '<Plug>(coc-format-selected)')

-- Use K to show documentation in preview window.

vim.cmd("autocmd CursorHold * silent call CocActionAsync('highlight')")

-- Fix syntax highlight for Coc plugin floating errors
vim.cmd("hi CocErrorFloat guifg=Magenta guibg=Magenta")

-- Use tab for trigger completion with characters ahead and navigate.
-- NOTE: There's always complete item selected by default, you may want to enable
-- no select by `"suggest.noselect": true` in your configuration file.
-- NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
-- other plugin before putting this into your config.
vim.cmd([[
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
inoremap <silent><expr> <TAB>
    \ coc#pum#visible() ? coc#pum#next(1) :
    \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
    \ CheckBackspace() ? "\<Tab>" :
    \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                            \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
]])

-- Use <C-j> for jump to next placeholder, it's default of coc.nvim
vim.g.coc_snippet_next = '<c-j>'

-- Use <C-k> for jump to previous placeholder, it's default of coc.nvim
vim.g.coc_snippet_prev = '<c-k>'
