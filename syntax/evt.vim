" Vim syntax file
" Language:	C
" Maintainer:	Benjamin Bannier <bbannier@gmail.com>
" License:      VIM LICENSE

if exists('b:current_syntax')
	finish
endif

let b:current_syntax = 'evt'

syntax keyword evtKeyword over originator responder with on if event parse with port ports replaces mime-type
syntax match evtAnalyzer /\(protocol\|packet\|file\)\s\+analyzer/
syntax keyword evtTransport TCP UDP
syntax keyword evtImport import from
syntax match evtComment /#.*$/
syntax match evtNumber display "\v<\d%(_?\d)*%(\.\.@!)?%(\d%(_?\d)*)?%([eE][+-]?\d%(_?\d)*)?"
syntax match evtMagic /$\w\+/
syntax match evtProperty /%[^= ;"(]\+/
syntax match evtPort ~\d\+/\(tcp\|udp\|imcp\)~

highlight default link evtKeyword Keyword
highlight default link evtImport Include
highlight default link evtTransport Identifier
highlight default link evtAnalyzer Typedef
highlight default link evtComment Comment
highlight default link evtNumber Number
highlight default link evtPort Number
highlight default link evtMagic Special
highlight default link evtProperty Label
