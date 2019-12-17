" Vim syntax file
" Hacked by Keith, from the x86 asm syntax, which was from the 68000 asm syntax....
"  x Language:	8051 Assembler (IAR flavor)
"  x Maintainer:
" Last change:	2006 Sep 22
 
" Adapted from asm8051 file which was apparently derived
" from the 68000 asm syntax

" Directives and such are probably IAR specific.  Feel free to expand for Keil
" and/or SDCC assemblers


syn case ignore

" Preprocessor
syn match   asm8051PreProc contained "^\s*#\s*\(\(if\(n\=\(def\)\)\=\)\|\(end\(if\)\=\)\|\(define\)\|\(error\)\|\(else\)\)\>"
syn match   asm8051PreProc contained "^\s*#\s*include\>\s*["<]" contains=asmx86Included
syn match   asm8051PreProc contained "$\S*"
syn match   asm8051Included contained "["<][^"]*[>"]"

" Comments
syn region  asm8051Comment contained start=";" end="$"
syn region  asm8051Commentcpp contained start="\s*#\s*if\s\+0\+\>" end="\s*#\s*endif\>" contains=asmx86Todo
syn region  asm8051Commentcxx contained start="//" end="$" contains=asmx86Todo
syn region  asm8051Commentc contained start="/\*" end="\*/" contains=asmx86Todo
syn keyword asm8051Todo contained TODO ToDo XXX FIX FIXME CHANGED

" Valid labels
syn match   asm8051Label contained "^\s*[a-z_?.][a-z0-9_?.$]*[:]"

" Various number formats
syn match hexNumber contained "0x[0-9a-fA-F]\+\>"
syn match hexNumber contained "\<[0-9][0-9a-fA-F]*H\>"
" syn match octNumber		"@[0-7]\+\>"
syn match octNumber contained "\<[0-7]\+[QO]\>"
" syn match binNumber		"%[01]\+\>"
syn match binNumber contained "\<[01]\+B\>"
syn match decNumber contained "\<[0-9]\+D\=\>"

" -- Registers --
" Register set(s)
syn match   asm8051Reg		"[Rr][0-7]"

" Ports
syn match   asm8051Port		"[Pp][0-3]\(_[0-7]\)\?"

" SFRs
syn keyword asm8051Reg		a b psw dps dptr dpl dph dpl1 dph1 

" -- 8051 opcodes --
" Arithmetic Operations
syn match   asm8051Opcode contained	"\<add[c]*\>"
syn match   asm8051Opcode contained	"\<subb\>"
syn match   asm8051Opcode contained	"\<inc\>"
syn match   asm8051Opcode contained	"\<dec\>"
syn match   asm8051Opcode contained	"\<mul\>"
syn match   asm8051Opcode contained	"\<div\>"
syn match   asm8051Opcode contained	"\<da\>"

" Logic Operations
syn match   asm8051Opcode contained	"\<anl\>"
syn match   asm8051Opcode contained	"\<orl\>"
syn match   asm8051Opcode contained	"\<xrl\>"
syn match   asm8051Opcode contained	"\<clr\>"
syn match   asm8051Opcode contained	"\<cpl\>"
syn match   asm8051Opcode contained	"\<r[rl][c]*\>"
syn match   asm8051Opcode contained	"\<swap\>"

" Data Transfer Operations
syn match   asm8051Opcode contained 	"\<mov[cx]*\>"
syn match   asm8051Opcode contained	"\<push\>"
syn match   asm8051Opcode contained	"\<pop\>"
syn match   asm8051Opcode contained	"\<xch{d]*\>"

" Program Branch Operations
syn match   asm8051Opcode contained	"\<[al]\?call\>"
syn match   asm8051Opcode contained	"\<ret[i]*\>"
syn match   asm8051Opcode contained	"\<[als]*jmp\>"
syn match   asm8051Opcode contained	"\<j[n]*[zcb]\>"
syn match   asm8051Opcode contained	"\<jbc\>"
syn match   asm8051Opcode contained	"\<cjne\>"
syn match   asm8051Opcode contained	"\<djnz\>"
syn match   asm8051Opcode contained	"\<nop\>"

" Boolean Operations
syn match   asm8051Opcode contained "\<setb\>"
" all other boolean operations are coverd in other sections
" op codes are the same, just arguments are different


" -- Operators --
syn match   asm8051Operator contained	"\<SIZEOF\>"
syn match   asm8051Operator contained	"<<"		" shifts
syn match   asm8051Operator contained	">>"
syn match   asm8051Operator contained	"\<SH[RL]\>"
syn match   asm8051Operator contained	"&"		" and
syn match   asm8051Operator contained	"&&"
syn match   asm8051Operator contained	"\<BITAND\>"
syn match   asm8051Operator contained	"\<AND\>"
syn match   asm8051Operator contained	"|"		" or
syn match   asm8051Operator contained	"||"
syn match   asm8051Operator contained	"\<BITOR\>"
syn match   asm8051Operator contained	"\<OR\>"
syn match   asm8051Operator contained	"\^"		" xor
syn match   asm8051Operator contained	"\<BITXOR\>"
syn match   asm8051Operator contained	"\<XOR\>"
syn match   asm8051Operator contained	"\~"		" not
syn match   asm8051Operator contained	"!"
syn match   asm8051Operator contained	"\<BITNOT\>"
syn match   asm8051Operator contained	"\<NOT\>"
syn match   asm8051Operator contained	"<>"		" inequality
syn match   asm8051Operator contained	"!="
syn match   asm8051Operator contained	"\<NE\>"
syn match   asm8051Operator contained	">"
syn match   asm8051Operator contained	"<"
syn match   asm8051Operator contained	">="
syn match   asm8051Operator contained	"<="
syn match   asm8051Operator contained	"\<GT\>"
syn match   asm8051Operator contained	"\<LT\>"
syn match   asm8051Operator contained	"\<GE\>"
syn match   asm8051Operator contained	"\<LE\>"
syn match   asm8051Operator contained	"\<UGT\>"
syn match   asm8051Operator contained	"\<ULT\>"
syn match   asm8051Operator contained	"="             " equality
syn match   asm8051Operator contained	"=="
syn match   asm8051Operator contained	"\<EQU\>"
syn match   asm8051Operator contained	"+"
syn match   asm8051Operator contained	"-"
syn match   asm8051Operator contained	"\*"
syn match   asm8051Operator contained	"/[^*/]"
syn match   asm8051Operator contained	"%"
syn match   asm8051Operator contained	"\<MOD\>"
syn match   asm8051Operator contained	"\<LOW\>"
syn match   asm8051Operator contained	"\<HIGH\>"
syn match   asm8051Operator contained	"\<BYTE[234]\>"
syn match   asm8051Operator contained	"\<[LH]WRD\>"
syn match   asm8051Operator contained	"\<DATE\>"
syn match   asm8051Operator contained	"\<LOC\>"
syn match   asm8051Operator contained	"\<PRM\>"
syn match   asm8051Operator contained	"\<SF[BE]\>"

" -- Directives --
" Module Control
syn match   asm8051Directive contained	"\<NAME\s"
syn match   asm8051Directive contained	"\<MODULE\>"
syn match   asm8051Directive contained	"\<END\(MOD\)*\>"
syn match   asm8051Directive contained	"\<LIBRARY\>"
syn match   asm8051Directive contained	"\<PROGRAM\>"
syn match   asm8051Directive contained	"\<RTMODEL\>"
syn match   asm8051Directive contained	"\<INCLUDE\>"

" Symbol Control
syn match   asm8051Directive contained	"\<EXTE*RN\>"
syn match   asm8051Directive contained	"\<IMPORT\>"
syn match   asm8051Directive contained	"\<PUBLIC\>"
syn match   asm8051Directive contained	"\<EXPORT\>"
syn match   asm8051Directive contained	"\<PUBWEAK\>"
syn match   asm8051Directive contained	"\<REQUIRE\>"

" Segment Control
syn match   asm8051Directive contained	"\<ALIGN\(RAM\)*\s"
syn match   asm8051Directive contained	"\<[AR]SEG[N]*\s"
syn match   asm8051Directive contained	"\<COMMON\s"
syn match   asm8051Directive contained	"\<EVEN\>"
syn match   asm8051Directive contained	"\<ODD\>"
syn match   asm8051Directive contained	"\<ORG\s"
syn match   asm8051Directive contained	"\<STACK\s"

" Value Assignment
syn match   asm8051Directive contained	"="
syn match   asm8051Directive contained	"\<bit\s"
syn match   asm8051Directive contained	"\<equ\s"
syn match   asm8051Directive contained	"\<code\s"
syn match   asm8051Directive contained	"\<i\?data\s"
syn match   asm8051Directive contained	"\<db\s"
syn match   asm8051Directive contained	"\<dw\s"
syn match   asm8051Directive contained	"\<EQU\s"
syn match   asm8051Directive contained	"\<ALIAS\s"
syn match   asm8051Directive contained	"\<ASSIGN\s"
syn match   asm8051Directive contained	"\<DEFINE\s"
syn match   asm8051Directive contained	"\<LIMIT\s"
syn match   asm8051Directive contained	"\<SET\s"
syn match   asm8051Directive contained	"\<SFR\(TYPE\)*\s"

" Conditional Assembly
syn match   asm8051Cond contained		"\<IF\>"
syn match   asm8051Cond contained		"\<ELSE\>"
syn match   asm8051Cond contained		"\<ELSEIF\>"
syn match   asm8051Cond contained		"\<ENDIF\>"

" Macro Processing
syn match   asm8051Macro contained	"\<MACRO\>"
syn match   asm8051Macro contained	"\<LOCAL\s"
syn match   asm8051Macro contained	"\<EXITM\>"
syn match   asm8051Macro contained	"\<ENDM\(AC\)*\>"
syn match   asm8051Macro contained	"\<REPT[IC]*\>"
syn match   asm8051Macro contained	"\<ENDR\>"
syn match   asm8051MacroParam contained	"\\[0-9]"

" Structured Assembly
syn match   asm8051Directive contained	"\<BREAK\>"
syn match   asm8051Directive contained	"\<CASE\>"
syn match   asm8051Directive contained	"\<CONTINUE\>"
syn match   asm8051Directive contained	"\<DEFAULT\>"
syn match   asm8051Directive contained	"\<ELSE\(IF\)*S\>"
syn match   asm8051Directive contained	"\<END[SW]\>"
syn match   asm8051Directive contained	"\<FOR\s"
syn match   asm8051Directive contained	"\<IFS\s"
syn match   asm8051Directive contained	"\<REPEAT\>"
syn match   asm8051Directive contained	"\<SWITCH\>"
syn match   asm8051Directive contained	"\<UNTIL\s"
syn match   asm8051Directive contained	"\<WHILE\s"

" Data Definition/Allocation
syn match   asm8051Directive contained	"\<D[BDSTW]\s"
syn match   asm8051Directive contained	"\<D[CS]\(\(8\)\|\(16\)\|\(24\)\|\(32\)\)\s"

" label after instruction
"\<[als]*jmp\>
syn region  asm8051Label contained matchgroup=asm8051Opcode start="\<[als]*jmp\s\+" end="\s\|$"
syn region  asm8051Label contained matchgroup=asm8051Opcode start="\<[al]*call\s\+" end="\s\|$"
syn match   asm8051Label contained "^\s*\d\d\d\d\d\$[:]"
syn match   asm8051Label contained "\d\d\d\d\d\$\(\s\|$\)" 

" Inline assemler
syn region inlineAssembler start="__asm" end="__endasm" contains=asm8051.*,...Number 

syn case match

" This is for compatibility with C syntax file in Vim distribution.
syn cluster	cParenGroup	add=asm8051.*
syn cluster	cParenGroup	remove=asm8051Reg,asm8051Port
"syn cluster	cParenGroup	remove=asm8051Operator

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_asm8051_syntax_inits")
  if version < 508
    let did_asm8051_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  " The default methods for highlighting.  Can be overridden later
  " Comment Constant Error Identifier PreProc Special Statement Todo Type
  "
  " Constant		Boolean Character Number String
  " Identifier		Function
  " PreProc		Define Include Macro PreCondit
  " Special		Debug Delimiter SpecialChar SpecialComment Tag
  " Statement		Conditional Exception Keyword Label Operator Repeat
  " Type		StorageClass Structure Typedef

  HiLink asm8051Comment		Comment
  HiLink asm8051Commentcpp	Comment
  HiLink asm8051Commentc	Comment
  HiLink asm8051Commentcxx	Comment
  HiLink asm8051Todo		Todo

  HiLink hexNumber		Number		" Constant
  HiLink octNumber		Number		" Constant
  HiLink binNumber		Number		" Constant
  HiLink decNumber		Number		" Constant

  HiLink asm8051Label		Type
  HiLink asm8051Reg		Identifier
  HiLink asm8051Port		Identifier
  HiLink asm8051Operator	Identifier

  HiLink asm8051Macro		Macro		" PreProc
  HiLink asm8051MacroParam	Keyword		" Statement
  HiLink asm8051PreProc		PreProc		" PreProc
  HiLink asm8051Included	String		" PreProc

  HiLink asm8051Directive	Special
  HiLink asm8051Opcode		Keyword
  HiLink asm8051Cond		Conditional	" Statement
  HiLink inlineAssembler	Special
  HiLink sdccCode	Special

  delcommand HiLink
endif


" vim: ts=8 sw=2
