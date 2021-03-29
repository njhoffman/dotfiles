

" Vim syntax file
" Language: tcf
" Maintainer: Nick Hoffman
" Latest Revision: 01 August 2014

if exists("b:current_syntax")
	finish
endif

syn match tcfAttr '^\w\+:' contains=tcfAttrName nextgroup=tcfAttrValues
syn match tcfAttr '^\w\+-\w\+:' contains=tcfAttrName nextgroup=tcfAttrValues
syn match tcfAttrName '^\w\+' contained
syn match tcfAttrName '^\w\+-\w\+' contained
syn match tcfAttrValues '.*$' contains=tcfAttrValue,tcfAttrDiv contained
syn match tcfAttrValue '[^\|]\+' contained
syn match tcfAttrDiv '|' contained
syn match comment '\/\/.*$'

syn match tcfAttrRev '^rev\d\+/\w\+:' contains=tcfAttrRevName,tcfAttrRevNum nextgroup=tcfAttrRevValues
syn match tcfAttrRevNum '^rev\d\+' contained
syn match tcfAttrRevName '/\w\+' contained
syn match tcfAttrRevValues '.*$' contains=tcfAttrRevValue,tcfAttrRevDiv contained
syn match tcfAttrRevValue '[^\|]\+' contained
syn match tcfAttrRevDiv '|' contained

