" Author: Benjamin Bannier <bbannier@gmail.com>
" Description: Support for checking HILTI files with spicyc via https://github.com/w0rp/ale

if !exists(':ALELint')
    finish
endif

call ale#Set('hilti_spicyc_executable', 'spicyc')

function! HandleErrors(buffer, lines) abort
    " Handle '[error] {file}:{line}:{col}-{line}:{col}: {message}' format.
    " Handle '[warning] {file}:{line}:{col}-{line}:{col}: {message}' format.
    let l:pattern = '\[\(error\|warning\)\] \v.*:(\d+):(\d+)-(\d+):(\d+):\s(.*)$'

    return map(ale#util#GetMatches(a:lines, l:pattern), "{
    \   'lnum': str2nr(v:val[2]),
    \   'col': str2nr(v:val[3]),
    \   'text': v:val[6],
    \   'type': (v:val[1] is# 'error') ? 'E' : 'W',
    \}")
endfunction

call ale#linter#Define('hlt', {
\   'name': 'spicyc',
\   'executable': {b -> ale#Var(b, 'hilti_spicyc_executable')},
\   'output_stream': 'stderr',
\   'command': {-> '%e -p %s -o ' . g:ale#util#nul_file},
\   'callback': 'HandleErrors',
\   'lint_file': 1,
\})
