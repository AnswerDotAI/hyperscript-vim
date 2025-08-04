" File: syntax/_hyperscript.vim
" Author: <you>
" Description: Vim / Neovim syntax for _hyperscript
" License: MIT

if exists('b:current_syntax')
  finish
endif

syn cluster hyperscriptTop contains=hyperscriptComment,hyperscriptNumber,hyperscriptBoolean,hyperscriptNull,hyperscriptString,hyperscriptTemplate,hyperscriptTemplateExpr,hyperscriptKeyword,hyperscriptCommand,hyperscriptFeature,hyperscriptOperator,hyperscriptStorage,hyperscriptVariable,hyperscriptAttr,hyperscriptCssClass,hyperscriptCssID,hyperscriptJSRegion,hyperscriptPunctuation

" ---------- Literals --------------------------------------------------------
syn match   hyperscriptNumber         '\v\d+(\.\d+)?'
syn keyword hyperscriptBoolean        true false
syn keyword hyperscriptNull           null undefined

" ---------- Strings / Templates --------------------------------------------
syn region  hyperscriptString         start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=hyperscriptEscape,@Spell
syn region  hyperscriptString         start=+'+ skip=+\\\\\|\\'+ end=+'+ contains=hyperscriptEscape,@Spell

" Back‑tick strings with ${ } interpolation
syn region  hyperscriptTemplate       start='`'  skip='\\`'  end='`' contains=hyperscriptTemplateExpr,hyperscriptEscape,@Spell
syn region  hyperscriptTemplateExpr   start='${' end='}' contained contains=@hyperscriptTop

syn match   hyperscriptEscape         '\\.' contained

" ---------- Keywords, commands, operators ----------------------------------
syn keyword hyperscriptKeyword catch if else otherwise then end while until unless for finally repeat times index
syn keyword hyperscriptCommand add remove put async call get hide measure return send settle set show take throw toggle transition trigger wait fetch tell go increment decrement halt make log default continue breakpoint
syn keyword hyperscriptFeature on def worker eventsource socket init behavior install require
syn match   hyperscriptOperator "\v(\+|-|\/|\*|\\|->|<|>|<\=|>\=|\=\=|!\=|\=\||\.\.|\%|\||!|\$)"
syn keyword hyperscriptStorage local element module global
syn keyword hyperscriptVariable I me my you your yourself it its result event target detail document body

" ---------- CSS‑like selectors ---------------------------------------------
syn match   hyperscriptCssClass       '\v\.[A-Za-z0-9_-]+'
syn match   hyperscriptCssID          '\v#[A-Za-z0-9_-]+'

" ---------- Attribute references -------------------------------------------
syn match   hyperscriptAttr           '\v\@([A-Za-z_-]+)'
syn region  hyperscriptAttr           start='\[@\zs[A-Za-z_-]+' end=']' contains=hyperscriptString

" ---------- Embedded JS -----------------------------------------------------
" Matches:  js() ... end    OR   js ... end
syn region  hyperscriptJSRegion       start='\v<js(\s*\([^)]*\))?' end='\v<end>' contains=@javascript  keepend

" ---------- Punctuation -----------------------------------------------------
syn match   hyperscriptPunctuation    '[\[\]()]'
syn match   hyperscriptPunctuation    '[:,]'

" ---------- Comments --------------------------------------------------------
syn match   hyperscriptComment        '\v--.*$'
syn match   hyperscriptComment        '\v//.*$'
syn region  hyperscriptComment        start=/\/\*/  end=/\*\//

" ---------- Default links ---------------------------------------------------
hi def link hyperscriptComment        Comment
hi def link hyperscriptNumber         Number
hi def link hyperscriptBoolean        Boolean
hi def link hyperscriptNull           Constant
hi def link hyperscriptString         String
hi def link hyperscriptTemplate       String
hi def link hyperscriptTemplateExpr   Special
hi def link hyperscriptEscape         SpecialChar
hi def link hyperscriptKeyword        Conditional
hi def link hyperscriptCommand        Statement
hi def link hyperscriptFeature        Keyword
hi def link hyperscriptOperator       Operator
hi def link hyperscriptStorage        StorageClass
hi def link hyperscriptVariable       Identifier
hi def link hyperscriptCssClass       Type
hi def link hyperscriptCssID          Type
hi def link hyperscriptAttr           Identifier
hi def link hyperscriptJSRegion       PreProc
hi def link hyperscriptPunctuation    Delimiter

let b:current_syntax = '_hyperscript'
