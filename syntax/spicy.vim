" Vim syntax file
" Language:	C
" Maintainer:	Benjamin Bannier <bbannier@gmail.com>
" License:      VIM LICENSE

if exists('b:current_syntax')
	finish
endif

" For highlighting payloads to `@TEST-EXEC*`.
syntax include @spicySh syntax/sh.vim

let b:current_syntax = 'spicy'

syntax region spicyString start=/"/ skip=/\\"/ end =/"/ contains=spicyEscapeChar
syn match spicyEscapeChar /\\./ contained

syntax keyword spicyBoolean True False

syntax match spicyPreproc /@\w\+/

syntax keyword spicyKeyword public self module function global local return on break stop throw const skip in inout
syntax match spicyDollarDollar /\$\$/
syntax keyword spicyNull Null
syntax keyword spicyImport import from
syntax keyword spicyStatement print assert cast result error
syntax keyword spicyConditional if else switch while
syntax keyword spicyCase case default
syntax keyword spicyException try catch throw
syntax match spicyProperty /%[^= ;"(]\+/
syntax match spicyCapture /\$[1-9][0-9]*/

syntax keyword spicyStructure type struct enum unit

syntax match spicyFunction /\(\)\i\+(/he=e-1
syntax match spicyIdentifier /\i\+/
syntax match spicyAttribute /&\(\w\|\d\|-\)\+/
syntax match spicyNumber "\d"

syntax keyword spicyType addr bitfield bool bytes iterator interval interval_ns port int8 int16 int32 int64 uint8 uint16 uint32 uint64 real regexp sink stream view string tuple vector void optional

syntax match spicyRegexp ~/.*/~

syntax keyword spicyOperator + - * / += -= *= /= ++ -- . .? ?.
syn match spicyOperator display "&&\|&\|||\||"

syntax keyword spicyRepeat for while in

syntax match spicyBTest /\v\@TEST(-\w+)+:?.*/ containedin=spicyComment containedin=ALL " This group only resets syntax.
syntax region spicyBTestExec start=/@TEST-\(EXEC\|REQUIRES\).\{-}\s/ end=/$/ containedin=spicyBTest contains=@spicySh
syntax match spicyBTestOther /@TEST\(.*-\(EXEC\|REQUIRES\)\)\@!.\{-}\s/ containedin=spicyBTest
syntax match spicyBTestKeyword /@TEST-.\{-}\s/ containedin=spicyBTestExec containedin=spicyBTestOther
" Extra case for keywords which do not take args or no shell commands.
syntax match spicyBTestKeyword /@TEST-\(DOC\|END-FILE\|GROUP\|IGNORE\|KNOWN-FAILURE\|MEASURE-TIME\|PORT\|START-FILE\|START-NEXT\)/ containedin=spicyBTest
syntax match spicyComment /#.*$/

highlight default link spicyBTestKeyword SpecialComment
highlight default link spicyBTestOther SpecialComment

highlight default link spicyString String
highlight default link spicyEscapeChar SpecialChar
highlight default link spicyNumber Number
highlight default link spicyType Type
highlight default link spicyRegexp Special
highlight default link spicyBoolean Boolean

highlight default link spicyConditional Conditional
highlight default link spicyCase Label
highlight default link spicyException Exception
highlight default link spicyKeyword Keyword
highlight default link spicyDollarDollar Keyword
highlight default link spicyNull Keyword
highlight default link spicyImport Include
highlight default link spicyProperty Label
highlight default link spicyCapture Label
highlight default link spicyAttribute Special
highlight default link spicyStructure Structure
highlight default link spicyFunction Function
highlight default link spicyIdentifier Identifier
highlight default link spicyStatement Function
highlight default link spicyComment Comment
highlight default link spicyOperator Operator
highlight default link spicyRepeat Repeat
highlight default link spicyPreproc PreProc
