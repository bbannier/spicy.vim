" Vim syntax file
" Language:	C
" Maintainer:	Benjamin Bannier <bbannier@gmail.com>
" License:      VIM LICENSE

if exists('b:current_syntax')
	finish
endif

let b:current_syntax = 'hlt'

" Inherit C syntax
runtime! syntax/cpp.vim
" unlet b:current_syntax

syntax keyword hltStorage declare type
syntax keyword hltAccess public global local
syntax keyword hltKeyword hook function module return
syntax keyword hltStructure struct
syntax keyword hltImport import

syntax region hltComment start='#' end='$'

syntax match hltScope "\w\+::"

syntax keyword hltConditional if else while

syntax keyword hltType void int uint string auto bool
syntax keyword hltKeyword True False
syntax match hltInteger "\<\d\+"
syntax match hltFloat "\<\d\*.\d\+"
syntax region hltString start='"' end='"'

highlight default link hltImport Include
highlight default link hltScope Identifier
highlight default link hltString String
highlight default link hltInteger Number
highlight default link hltFloat Float
highlight default link hltConditional Conditional
highlight default link hltStructure Structure
highlight default link hltStorage Keyword
highlight default link hltAccess Statement
highlight default link hltKeyword Keyword
highlight default link hltType Type
highlight default link hltComment Comment

" let b:current_syntax = 'hlt'
