" Author: Benjamin Bannier <bbannier@gmail.com>
" Description: Support for checking Spicy files with spicyc via https://github.com/w0rp/ale

if !exists(':ALELint')
    finish
endif

call ale#Set('spicy_spicyc_executable', 'spicyc')

function! HandleErrors(buffer, lines) abort
    " Handle '[error] {file}:{line}:{col}-{line}:{col}: {message}' format.
    let l:pattern = '\[error\] \v.*:(\d+):(\d+)-(\d+):(\d+):\s(.*)$'

    return map(ale#util#GetMatches(a:lines, l:pattern), "{
    \   'lnum': str2nr(v:val[1]),
    \   'col': str2nr(v:val[2]),
    \   'text': v:val[5],
    \}")
endfunction

call ale#linter#Define('spicy', {
\   'name': 'spicyc',
\   'executable': {b -> ale#Var(b, 'spicy_spicyc_executable')},
\   'output_stream': 'stderr',
\   'command': {-> '%e -p %s -o ' . g:ale#util#nul_file},
\   'callback': 'HandleErrors',
\   'lint_file': 1,
\})
