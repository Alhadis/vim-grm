" Vim syntax file
" Language:            GRM (GOLD parser)
" License:             zlib (http://goldparser.org/about/license.htm)
" Maintainer:          John Gardner <gardnerjohng@gmail.com>
" Previous Maintainer: Abderraouf El Gasser <abderraouf@ifrance.com>
" Previous URL:        http://goldparser.org/builder/files/grm.vim
" Remark:              This is a reformatted and patched copy of http://goldparser.org/builder/files/grm.vim.
" URL:                 https://github.com/Alhadis/grm.vim
" Changes:
" - 2021-10-28: Refactored, repackaged, and reformatted
" - 2002-08-08: Last-known revision by original author

" Bail if a syntax file has already been loaded
if exists("b:current_syntax")
	finish
endif


" Syntax {{{1

" Base data (or terminal nodes)
syn match grmOr "|" nextgroup=grmDefinition contained
syn match grmString +"[^"]*"+ contains=grmParam
syn match grmString +'[^']*'+
syn match grmOperator     /[+*\/-]/
syn match grmSetNode      "{[^}]*}"    contained
syn match grmTerminalNode "[A-Z][^ ]*" contained
syn match grmRuleNode     "<[^>]*>"    contained
syn match grmEnumBlock    "\[[^\[]*\]"
syn match grmComment      "!.*$"

" Parameter statement (quoted keyword followed by equal symbol followed by user data), with special handling for "Start Symbol"
syn match  grmParam           +"[^"]*"+ nextgroup=grmSepEqualParam
syn match  grmSepEqualParam   "\s*=\s*" nextgroup=grmDefinitionParam contained
syn match  grmDefinitionParam /.*$/     contained contains=grmString,grmComment
syn region grmParamStart start=+"Start Symbol"+ skip=+\s*=\s*+ end=/$/

" Terminal and set statements
syn match grmSet      /{[A-Z][^}]*}/  nextgroup=grmSepEqual
syn match grmTerminal /[A-Z][^ ]*/    nextgroup=grmSepEqual
syn match grmSepEqual "\s*=\s*"       nextgroup=grmDefinition contained

" Rule statement
syn match grmRule     /<[^>$]*>/      nextgroup=grmSepInstr
syn match grmSepInstr "\s*::=\s*"     nextgroup=grmDefinition contained

" Partial definition
syn match grmPartDef /^\s*|/ contains=grmOr nextgroup=grmDefinition

" Definition for a rule, set, or terminal
syn match grmDefinition /.*$/ contained contains=grmEnumBlock,grmSetNode,grmTerminalNode,grmRuleNode,grmString,grmOr,grmOperator,grmComment,grmConst


" Highlighting {{{1

hi def link grmConst           Constant
hi def link grmRule            Statement
hi def link grmTerminal        Type
hi def link grmSet             Special 
hi def link grmSetNode         Special
hi def link grmParam           PreProc
hi def link grmParamStart      Statement
hi def link grmString          String
hi          grmOperator        ctermfg=1 guifg=red
hi def link grmComment         Comment
hi          grmOr              ctermfg=1 gui=bold guifg=red
hi def link grmRuleNode        Identifier
hi def link grmTerminalNode    Type
hi def link grmEnumBlock       Constant
hi          grmDefinitionParam gui=italic guifg=blue


" Syntax variable {{{1
let b:current_syntax = "grm"
