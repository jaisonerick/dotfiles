let g:go_fmt_command = "goimports"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

let g:ginkgo_command = "call VtrSendCommand('GOLANG_ENV=test godotenv ginkgo {spec}')"

set nolist
" Hide tab extra char
setlocal listchars=tab:\ \ ,trail:·,nbsp:·
setlocal noexpandtab

nmap <leader>i <Plug>(go-info)
nmap <leader>gv <Plug>(go-doc-vertical)
nmap <leader>dv <Plug>(go-def-vertical)
nmap <leader>c <Plug>(go-coverage)
nmap <leader>ds <Plug>(go-implements)

compiler go
