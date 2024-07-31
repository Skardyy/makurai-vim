hi clear
if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "makurai"

let s:palette = {}
let s:palette.bg              = "#1e222a"
let s:palette.comment         = "#5C6773"
let s:palette.markup          = "#F07178"
let s:palette.constant        = "#D2A6FF"
let s:palette.operator        = "#f8f8f0"
let s:palette.tag             = "#f8f8f0"
let s:palette.regexp          = "#95E6CB"
let s:palette.string          = "#95FB79"
let s:palette.function        = "#FFEE99"
let s:palette.special         = "#82aaff"
let s:palette.keyword         = "#FF7733"

let s:palette.error           = "#FF3333"
let s:palette.accent          = "#F29718"
let s:palette.panel           = "#1e222a"
let s:palette.guide           = "#2D3640"
let s:palette.line            = "#25282e"
let s:palette.selection       = "#3d424d"
let s:palette.fg              = "#f8f8f0"
let s:palette.fg_idle         = "#39BAE6"
let s:palette.punctuation     = "#f8f8f0"

function! s:build_prim(hi_elem, field)
  let l:vname = "s:" . a:hi_elem . "_" . a:field
  let l:gui_assign = "gui".a:hi_elem."=".s:palette[a:field]
  exe "let " . l:vname . " = ' " . l:gui_assign . "'"
endfunction

let s:bg_none = ' guibg=NONE ctermbg=NONE'
let s:fg_none = ' guifg=NONE ctermfg=NONE'
for [key_name, d_value] in items(s:palette)
  call s:build_prim('bg', key_name)
  call s:build_prim('fg', key_name)
endfor

let s:none   = "NONE"
let s:t_none = "NONE"
let s:n      = "NONE"
let s:c      = ",undercurl"
let s:r      = ",reverse"
let s:s      = ",standout"
let s:b      = ",bold"
let s:u      = ",underline"
let s:i      = ",italic"

exe "let s:fmt_none = ' gui=NONE".          " cterm=NONE".          " term=NONE"        ."'"
exe "let s:fmt_bold = ' gui=NONE".s:b.      " cterm=NONE".s:b.      " term=NONE".s:b    ."'"
exe "let s:fmt_bldi = ' gui=NONE".s:b.      " cterm=NONE".s:b.      " term=NONE".s:b    ."'"
exe "let s:fmt_undr = ' gui=NONE".s:u.      " cterm=NONE".s:u.      " term=NONE".s:u    ."'"
exe "let s:fmt_undb = ' gui=NONE".s:u.s:b.  " cterm=NONE".s:u.s:b.  " term=NONE".s:u.s:b."'"
exe "let s:fmt_undi = ' gui=NONE".s:u.      " cterm=NONE".s:u.      " term=NONE".s:u    ."'"
exe "let s:fmt_curl = ' gui=NONE".s:c.      " cterm=NONE".s:c.      " term=NONE".s:c    ."'"
exe "let s:fmt_ital = ' gui=NONE".s:i.      " cterm=NONE".s:i.      " term=NONE".s:i    ."'"
exe "let s:fmt_stnd = ' gui=NONE".s:s.      " cterm=NONE".s:s.      " term=NONE".s:s    ."'"
exe "let s:fmt_revr = ' gui=NONE".s:r.      " cterm=NONE".s:r.      " term=NONE".s:r    ."'"
exe "let s:fmt_revb = ' gui=NONE".s:r.s:b.  " cterm=NONE".s:r.s:b.  " term=NONE".s:r.s:b."'"


exe "hi! Normal"        .s:fg_none        .s:bg_none        .s:fmt_none
exe "hi! ColorColumn"   .s:fg_none        .s:bg_line        .s:fmt_none
exe "hi! CursorColumn"  .s:fg_none        .s:bg_line        .s:fmt_none
exe "hi! CursorLine"    .s:fg_none        .s:bg_line        .s:fmt_none
exe "hi! CursorLineNr"  .s:fg_accent      .s:bg_none        .s:fmt_none
exe "hi! LineNr"        .s:fg_guide       .s:bg_none        .s:fmt_none
exe "hi! @punctuation"  .s:fg_punctuation .s:bg_none        .s:fmt_none
exe "hi! @tag.delimiter" .s:fg_comment    .s:bg_none        .s:fmt_none
exe "hi! @tag.attribute" .s:fg_function   .s:bg_none        .s:fmt_none

exe "hi! Directory"     .s:fg_fg_idle     .s:bg_none        .s:fmt_none
exe "hi! DiffAdd"       .s:fg_string      .s:bg_none        .s:fmt_none
exe "hi! DiffChange"    .s:fg_tag         .s:bg_none        .s:fmt_none
exe "hi! DiffText"      .s:fg_fg          .s:bg_none        .s:fmt_none
exe "hi! ErrorMsg"      .s:fg_fg          .s:bg_error       .s:fmt_stnd
exe "hi! VertSplit"     .s:fg_bg          .s:bg_none        .s:fmt_none
exe "hi! Folded"        .s:fg_none        .s:bg_none        .s:fmt_none
exe "hi! FoldColumn"    .s:fg_none        .s:bg_none        .s:fmt_none
exe "hi! SignColumn"    .s:fg_none        .s:bg_none        .s:fmt_none

exe "hi! MatchParen"    .s:fg_accent      .s:bg_none        .s:fmt_none
exe "hi! ModeMsg"       .s:fg_string      .s:bg_none        .s:fmt_none
exe "hi! MoreMsg"       .s:fg_string      .s:bg_none        .s:fmt_none
exe "hi! NonText"       .s:fg_guide       .s:bg_none        .s:fmt_none
exe "hi! Pmenu"         .s:fg_fg          .s:bg_none        .s:fmt_none
exe "hi! PmenuSel"      .s:fg_fg          .s:bg_none        .s:fmt_revr

exe "hi! Question"      .s:fg_string      .s:bg_none        .s:fmt_none
exe "hi! Search"        .s:fg_bg          .s:bg_constant    .s:fmt_none
exe "hi! SpecialKey"    .s:fg_selection   .s:bg_none        .s:fmt_none
exe "hi! SpellCap"      .s:fg_tag         .s:bg_none        .s:fmt_undr
exe "hi! SpellLocal"    .s:fg_keyword     .s:bg_none        .s:fmt_undr
exe "hi! SpellBad"      .s:fg_error       .s:bg_none        .s:fmt_undr
exe "hi! SpellRare"     .s:fg_regexp      .s:bg_none        .s:fmt_undr
exe "hi! StatusLine"    .s:fg_comment     .s:bg_bg          .s:fmt_none
exe "hi! StatusLineNC"  .s:fg_fg_idle     .s:bg_bg          .s:fmt_none
exe "hi! WildMenu"      .s:fg_bg          .s:bg_markup      .s:fmt_none
exe "hi! TabLine"       .s:fg_none        .s:bg_none        .s:fmt_revr
exe "hi WhichKeyFloat"  .s:fg_none        .s:bg_none        .s:fmt_none

exe "hi! Title"         .s:fg_keyword     .s:bg_none        .s:fmt_none
exe "hi! Visual"        .s:fg_none        .s:bg_selection   .s:fmt_none
exe "hi! WarningMsg"    .s:fg_error       .s:bg_none        .s:fmt_none

hi LongLineWarning  guifg=NONE        guibg=#371F1C     gui=underline ctermfg=NONE        ctermbg=NONE        cterm=underline

exe "hi! Comment"         .s:fg_comment   .s:bg_none        .s:fmt_none
exe "hi! Constant"        .s:fg_constant  .s:bg_none        .s:fmt_none
exe "hi! String"          .s:fg_string    .s:bg_none        .s:fmt_none

exe "hi! Identifier"      .s:fg_fg       .s:bg_none        .s:fmt_none
exe "hi! Function"        .s:fg_function .s:bg_none        .s:fmt_ital
exe "hi! Statement"       .s:fg_keyword  .s:bg_none        .s:fmt_ital
exe "hi! Operator"        .s:fg_operator  .s:bg_none        .s:fmt_none
exe "hi! PreProc"         .s:fg_special   .s:bg_none        .s:fmt_none

exe "hi! Type"            .s:fg_tag       .s:bg_none        .s:fmt_none
exe "hi! @lsp.type.namespace" .s:fg_tag   .s:bg_none        .s:fmt_none
exe "hi! @constant.builtin" .s:fg_constant .s:bg_none        .s:fmt_none
exe "hi! @type"           .s:fg_special   .s:bg_none        .s:fmt_none
exe "hi! @type.tsx"       .s:fg_tag       .s:bg_none        .s:fmt_none
exe "hi! @type.ts"        .s:fg_tag       .s:bg_none        .s:fmt_none
exe "hi! @type.builtin"     .s:fg_special   .s:bg_none        .s:fmt_none
exe "hi! @function"       .s:fg_function  .s:bg_none        .s:fmt_none
exe "hi! @function.builtin" .s:fg_function  .s:bg_none        .s:fmt_none
exe "hi! Structure"       .s:fg_special   .s:bg_none        .s:fmt_none

exe "hi! Special"         .s:fg_special   .s:bg_none        .s:fmt_none
exe "hi! Underlined"      .s:fg_tag       .s:bg_none        .s:fmt_undr
exe "hi! Ignore"          .s:fg_none      .s:bg_none        .s:fmt_none
exe "hi! Error"           .s:fg_fg        .s:bg_error       .s:fmt_none
exe "hi! Todo"            .s:fg_markup    .s:bg_none        .s:fmt_none

exe "hi! qfLineNr"        .s:fg_keyword   .s:bg_none        .s:fmt_none

exe "hi! Conceal"         .s:fg_guide     .s:bg_none        .s:fmt_none
exe "hi! CursorLineConceal" .s:fg_guide   .s:bg_line        .s:fmt_none

let s:style = 'normal'
if has("nvim")
  let g:terminal_color_0 =  s:palette.bg
  let g:terminal_color_1 =  s:palette.markup
  let g:terminal_color_2 =  s:palette.string
  let g:terminal_color_3 =  s:palette.accent
  let g:terminal_color_4 =  s:palette.tag
  let g:terminal_color_5 =  s:palette.constant
  let g:terminal_color_6 =  s:palette.regexp
  let g:terminal_color_7 =  "#FFFFFF"
  let g:terminal_color_8 =  s:palette.fg_idle
  let g:terminal_color_9 =  s:palette.error
  let g:terminal_color_10 = s:palette.string
  let g:terminal_color_11 = s:palette.accent
  let g:terminal_color_12 = s:palette.tag
  let g:terminal_color_13 = s:palette.constant
  let g:terminal_color_14 = s:palette.regexp
  let g:terminal_color_15 = s:palette.comment
  let g:terminal_color_background = g:terminal_color_0
  let g:terminal_color_foreground = s:palette.fg
else
  let g:terminal_ansi_colors =  [s:palette.bg,      s:palette.markup]
  let g:terminal_ansi_colors += [s:palette.string,  s:palette.accent]
  let g:terminal_ansi_colors += [s:palette.tag,     s:palette.constant]
  let g:terminal_ansi_colors += [s:palette.regexp,  "#FFFFFF"]
  let g:terminal_ansi_colors += [s:palette.fg_idle, s:palette.error]
  let g:terminal_ansi_colors += [s:palette.string,  s:palette.accent]
  let g:terminal_ansi_colors += [s:palette.tag,     s:palette.constant]
  let g:terminal_ansi_colors += [s:palette.regexp,  s:palette.comment]
endif


" NerdTree
" ---------
exe "hi! NERDTreeOpenable"          .s:fg_fg_idle     .s:bg_none        .s:fmt_none
exe "hi! NERDTreeClosable"          .s:fg_accent      .s:bg_none        .s:fmt_none
exe "hi! NERDTreeUp"                .s:fg_fg_idle    .s:bg_none        .s:fmt_none
exe "hi! NERDTreeDir"               .s:fg_function   .s:bg_none        .s:fmt_none
exe "hi! NERDTreeFile"              .s:fg_none       .s:bg_none        .s:fmt_none
exe "hi! NERDTreeDirSlash"          .s:fg_accent     .s:bg_none        .s:fmt_none


" GitGutter
" ---------
exe "hi! GitGutterAdd"          .s:fg_string     .s:bg_none        .s:fmt_none
exe "hi! GitGutterChange"       .s:fg_tag        .s:bg_none        .s:fmt_none
exe "hi! GitGutterDelete"       .s:fg_markup     .s:bg_none        .s:fmt_none
exe "hi! GitGutterChangeDelete" .s:fg_function   .s:bg_none        .s:fmt_none

" Diff Syntax Highlighting:"{{{
" ----------------------------------------------------------------------------
" Diff
"   diffOldFile
"   diffNewFile
"   diffFile
"   diffOnly
"   diffIdentical
"   diffDiffer
"   diffBDiffer
"   diffIsA
"   diffNoEOL
"   diffCommon
"   diffLine
"   diffSubname
"   diffComment
"   diffChanged
hi! link diffRemoved Constant
hi! link diffAdded String
