let g:go_fmt_command = "goimports"
let g:go_textobj_include_function_doc = 0
let g:go_fmt_fail_silently = 1

" Struct, `json` + `tab` => generate for json.Msha1()

" default: snake_case
let g:go_addtags_transform = "camelcase"
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
" //go:generate
let g:go_highlight_generate_tags = 1

" => go lint
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
" lint when save
let g:go_metalinter_autosave = 1
let g:go_metalinter_autosave_enabled = ['vet', 'golint']
let g:go_metalinter_deadline = "5s"
