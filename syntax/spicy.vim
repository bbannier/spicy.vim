" Vim syntax file
" Language:	C
" Maintainer:	Benjamin Bannier <bbannier@gmail.com>
" License:      VIM LICENSE

let b:current_syntax = 'spicy'

syntax region spicyString start=/"/ end =/"/ skip=+\\"+
syntax keyword spicyBoolean True False

syntax keyword spicyKeyword public self module function global local return on break stop throw const
syntax keyword spicyImport import from
syntax keyword spicyStatement print assert cast result error
syntax keyword spicyConditional if else switch while
syntax keyword spicyCase case default
syntax keyword spicyException try catch throw
syntax match spicyLabel /%[^=]\+/

syntax keyword spicyStructure type

syntax match spicyFunction /\(\)\i\+(/he=e-1
syntax match spicyIdentifier /\i\+/
syntax match spicyAttribute /&\(\w\|\d\|-\)\+/
syntax match spicyNumber "\d"

syntax keyword spicyType addr bitfield bool bytes iterator interval interval_ns enum port int8 int16 int32 int64 uint8 uint16 uint32 uint64 real regexp sink stream view string tuple unit vector void optional

syntax match spicyRegexp ~/.*/~

syntax keyword spicyOperator in + - * / += -= *= /= ++ -- . .? ?.
syntax match spicyComment /#.*$/
syntax keyword spicyRepeat for while in

highlight default link spicyString String
highlight default link spicyNumber Number
highlight default link spicyType Type
highlight default link spicyRegexp Special
highlight default link spicyBoolean Boolean

highlight default link spicyConditional Conditional
highlight default link spicyCase Label
highlight default link spicyException Exception
highlight default link spicyKeyword Keyword
highlight default link spicyImport Include
highlight default link spicyLabel Label
highlight default link spicyAttribute Special
highlight default link spicyStructure Structure
highlight default link spicyFunction Function
highlight default link spicyIdentifier Identifier
highlight default link spicyStatement Function
highlight default link spicyComment Comment
highlight default link spicyOperator Operator
highlight default link spicyRepeat Repeat
