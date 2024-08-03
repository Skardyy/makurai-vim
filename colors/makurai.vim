" Clear existing syntax
hi clear
if exists("syntax_on")
    syntax reset
endif

let g:colors_name = "makurai"

"------------------------------------
" Color Palette
"------------------------------------
let s:palette = {
    \ 'bg':              "#1e222a",
    \ 'comment':         "#5C6773",
    \ 'markup':          "#F07178",
    \ 'constant':        "#D2A6FF",
    \ 'operator':        "#f8f8f0",
    \ 'tag':             "#f8f8f0",
    \ 'regexp':          "#95E6CB",
    \ 'string':          "#95FB79",
    \ 'function':        "#FFEE99",
    \ 'special':         "#82aaff",
    \ 'keyword':         "#FF7733",
    \ 'error':           "#FF3333",
    \ 'accent':          "#F29718",
    \ 'panel':           "#1e222a",
    \ 'guide':           "#2D3640",
    \ 'line':            "#25282e",
    \ 'selection':       "#3d424d",
    \ 'fg':              "#f8f8f0",
    \ 'fg_idle':         "#39BAE6",
    \ 'punctuation':     "#f8f8f0"
\ }

"------------------------------------
" Helper Functions
"------------------------------------
function! s:build_prim(hi_elem, field)
    let l:vname = "s:" . a:hi_elem . "_" . a:field
    let l:gui_assign = "gui".a:hi_elem."=".s:palette[a:field]
    exe "let " . l:vname . " = ' " . l:gui_assign . "'"
endfunction

" Build Color Primitives
let s:bg_none = ' guibg=NONE ctermbg=NONE'
let s:fg_none = ' guifg=NONE ctermfg=NONE'
for [key_name, d_value] in items(s:palette)
    call s:build_prim('bg', key_name)
    call s:build_prim('fg', key_name)
endfor

"------------------------------------
" Formatting Options
"------------------------------------
let s:none   = "NONE"
let s:t_none = "NONE"
let s:n      = "NONE"
let s:c      = ",undercurl"
let s:r      = ",reverse"
let s:s      = ",standout"
let s:b      = ",bold"
let s:u      = ",underline"
let s:i      = ",italic"

" Formatting Definitions
let s:fmt_none = ' gui=NONE'                 . ' cterm=NONE'                 . ' term=NONE'
let s:fmt_bold = ' gui=NONE'.s:b             . ' cterm=NONE'.s:b             . ' term=NONE'.s:b
let s:fmt_bldi = ' gui=NONE'.s:b             . ' cterm=NONE'.s:b             . ' term=NONE'.s:b
let s:fmt_undr = ' gui=NONE'.s:u             . ' cterm=NONE'.s:u             . ' term=NONE'.s:u
let s:fmt_undb = ' gui=NONE'.s:u.s:b         . ' cterm=NONE'.s:u.s:b         . ' term=NONE'.s:u.s:b
let s:fmt_undi = ' gui=NONE'.s:u             . ' cterm=NONE'.s:u             . ' term=NONE'.s:u
let s:fmt_curl = ' gui=NONE'.s:c             . ' cterm=NONE'.s:c             . ' term=NONE'.s:c
let s:fmt_ital = ' gui=NONE'.s:i             . ' cterm=NONE'.s:i             . ' term=NONE'.s:i
let s:fmt_stnd = ' gui=NONE'.s:s             . ' cterm=NONE'.s:s             . ' term=NONE'.s:s
let s:fmt_revr = ' gui=NONE'.s:r             . ' cterm=NONE'.s:r             . ' term=NONE'.s:r
let s:fmt_revb = ' gui=NONE'.s:r.s:b         . ' cterm=NONE'.s:r.s:b         . ' term=NONE'.s:r.s:b

" Highlight Function
function! s:hi(group, fg, bg, fmt)
    exe "hi! " . a:group . a:fg . a:bg . a:fmt
endfunction

"------------------------------------
" General UI
"------------------------------------
call s:hi("Normal",        s:fg_none,        s:bg_none,        s:fmt_none)
call s:hi("ColorColumn",   s:fg_none,        s:bg_line,        s:fmt_none)
call s:hi("CursorColumn",  s:fg_none,        s:bg_line,        s:fmt_none)
call s:hi("CursorLine",    s:fg_none,        s:bg_line,        s:fmt_none)
call s:hi("CursorLineNr",  s:fg_accent,      s:bg_none,        s:fmt_none)
call s:hi("LineNr",        s:fg_guide,       s:bg_none,        s:fmt_none)
call s:hi("Directory",     s:fg_fg_idle,     s:bg_none,        s:fmt_none)
call s:hi("VertSplit",     s:fg_bg,          s:bg_none,        s:fmt_none)
call s:hi("Folded",        s:fg_none,        s:bg_none,        s:fmt_none)
call s:hi("FoldColumn",    s:fg_none,        s:bg_none,        s:fmt_none)
call s:hi("SignColumn",    s:fg_none,        s:bg_none,        s:fmt_none)

"------------------------------------
" Syntax Highlighting
"------------------------------------
call s:hi("Comment",         s:fg_comment,   s:bg_none,        s:fmt_none)
call s:hi("Constant",        s:fg_constant,  s:bg_none,        s:fmt_none)
call s:hi("String",          s:fg_string,    s:bg_none,        s:fmt_none)
call s:hi("Identifier",      s:fg_fg,        s:bg_none,        s:fmt_none)
call s:hi("Function",        s:fg_function,  s:bg_none,        s:fmt_none)
call s:hi("Statement",       s:fg_keyword,   s:bg_none,        s:fmt_none)
call s:hi("Operator",        s:fg_operator,  s:bg_none,        s:fmt_none)
call s:hi("PreProc",         s:fg_special,   s:bg_none,        s:fmt_none)
call s:hi("Type",            s:fg_special,   s:bg_none,        s:fmt_none)
call s:hi("Special",         s:fg_special,   s:bg_none,        s:fmt_none)

"------------------------------------
" Language-Specific
"------------------------------------
call s:hi("@punctuation",           s:fg_punctuation, s:bg_none,        s:fmt_none)
call s:hi("@punctuation.special",   s:fg_punctuation, s:bg_none,        s:fmt_none)
call s:hi("@tag.delimiter",         s:fg_comment,     s:bg_none,        s:fmt_none)
call s:hi("@tag.attribute",         s:fg_function,    s:bg_none,        s:fmt_none)
call s:hi("@lsp.type.namespace",    s:fg_tag,         s:bg_none,        s:fmt_none)
call s:hi("@constant.builtin",      s:fg_constant,    s:bg_none,        s:fmt_none)
call s:hi("@type",                  s:fg_special,     s:bg_none,        s:fmt_none)
call s:hi("@type.builtin",          s:fg_special,     s:bg_none,        s:fmt_none)
call s:hi("@function",              s:fg_function,    s:bg_none,        s:fmt_none)
call s:hi("@function.builtin",      s:fg_function,    s:bg_none,        s:fmt_none)

"------------------------------------
" Diff Syntax Highlighting
"------------------------------------
call s:hi("DiffAdd",       s:fg_string,      s:bg_none,        s:fmt_none)
call s:hi("DiffChange",    s:fg_tag,         s:bg_none,        s:fmt_none)
call s:hi("DiffText",      s:fg_fg,          s:bg_none,        s:fmt_none)

"------------------------------------
" Messages
"------------------------------------
call s:hi("ErrorMsg",      s:fg_fg,          s:bg_error,       s:fmt_stnd)
call s:hi("WarningMsg",    s:fg_error,       s:bg_none,        s:fmt_none)
call s:hi("MoreMsg",       s:fg_string,      s:bg_none,        s:fmt_none)
call s:hi("ModeMsg",       s:fg_string,      s:bg_none,        s:fmt_none)

"------------------------------------
" Search and Selection
"------------------------------------
call s:hi("MatchParen",    s:fg_accent,      s:bg_none,        s:fmt_none)
call s:hi("Search",        s:fg_bg,          s:bg_constant,    s:fmt_none)
call s:hi("Visual",        s:fg_none,        s:bg_selection,   s:fmt_none)

"------------------------------------
" Spelling
"------------------------------------
call s:hi("SpellCap",      s:fg_tag,         s:bg_none,        s:fmt_undr)
call s:hi("SpellLocal",    s:fg_keyword,     s:bg_none,        s:fmt_undr)
call s:hi("SpellBad",      s:fg_error,       s:bg_none,        s:fmt_undr)
call s:hi("SpellRare",     s:fg_regexp,      s:bg_none,        s:fmt_undr)

"------------------------------------
" Popups and Status
"------------------------------------
call s:hi("Pmenu",         s:fg_fg,          s:bg_none,        s:fmt_none)
call s:hi("PmenuSel",      s:fg_fg,          s:bg_none,        s:fmt_revr)
call s:hi("StatusLine",    s:fg_comment,     s:bg_none,        s:fmt_none)
call s:hi("StatusLineNC",  s:fg_fg_idle,     s:bg_none,        s:fmt_none)
call s:hi("WildMenu",      s:fg_bg,          s:bg_markup,      s:fmt_none)
call s:hi("TabLine",       s:fg_none,        s:bg_none,        s:fmt_revr)
call s:hi("WhichKeyFloat", s:fg_none,        s:bg_none,        s:fmt_none)

"------------------------------------
" Misc
"------------------------------------
call s:hi("Title",         s:fg_keyword,     s:bg_none,        s:fmt_none)
call s:hi("NonText",       s:fg_guide,       s:bg_none,        s:fmt_none)
call s:hi("SpecialKey",    s:fg_selection,   s:bg_none,        s:fmt_none)
call s:hi("Conceal",       s:fg_guide,       s:bg_none,        s:fmt_none)
call s:hi("CursorLineConceal", s:fg_guide,   s:bg_line,        s:fmt_none)

"------------------------------------
" Plugin-Specific
"------------------------------------
" NERDTree
call s:hi("NERDTreeOpenable",  s:fg_fg_idle,     s:bg_none,        s:fmt_none)
call s:hi("NERDTreeClosable",  s:fg_accent,      s:bg_none,        s:fmt_none)
call s:hi("NERDTreeUp",        s:fg_fg_idle,     s:bg_none,        s:fmt_none)
call s:hi("NERDTreeDir",       s:fg_function,    s:bg_none,        s:fmt_none)
call s:hi("NERDTreeFile",      s:fg_none,        s:bg_none,        s:fmt_none)
call s:hi("NERDTreeDirSlash",  s:fg_accent,      s:bg_none,        s:fmt_none)

" GitGutter
call s:hi("GitGutterAdd",          s:fg_string,     s:bg_none,        s:fmt_none)
call s:hi("GitGutterChange",       s:fg_tag,        s:bg_none,        s:fmt_none)
call s:hi("GitGutterDelete",       s:fg_markup,     s:bg_none,        s:fmt_none)
call s:hi("GitGutterChangeDelete", s:fg_function,   s:bg_none,        s:fmt_none)

" WhichKey
call s:hi("WhichKey",              s:fg_function,  s:bg_none,        s:fmt_none)
call s:hi("WhichKeyBorder",        s:fg_comment,   s:bg_none,        s:fmt_none)
call s:hi("WhichKeyDesc",          s:fg_fg,        s:bg_none,        s:fmt_none)
call s:hi("WhichKeyGroup",         s:fg_keyword,   s:bg_none,        s:fmt_bold)
call s:hi("WhichKeyIcon",          s:fg_markup,    s:bg_none,        s:fmt_none)
call s:hi("WhichKeyIconAzure",     s:fg_function,  s:bg_none,        s:fmt_none)
call s:hi("WhichKeyIconBlue",      s:fg_fg_idle,   s:bg_none,        s:fmt_none)
call s:hi("WhichKeyIconCyan",      s:fg_regexp,    s:bg_none,        s:fmt_none)
call s:hi("WhichKeyIconGreen",     s:fg_string,    s:bg_none,        s:fmt_none)
call s:hi("WhichKeyIconGrey",      s:fg_comment,   s:bg_none,        s:fmt_none)
call s:hi("WhichKeyIconOrange",    s:fg_accent,    s:bg_none,        s:fmt_none)
call s:hi("WhichKeyIconPurple",    s:fg_constant,  s:bg_none,        s:fmt_none)
call s:hi("WhichKeyIconRed",       s:fg_error,     s:bg_none,        s:fmt_none)
call s:hi("WhichKeyIconYellow",    s:fg_accent,    s:bg_none,        s:fmt_none)
call s:hi("WhichKeyNormal",        s:fg_fg,        s:bg_panel,       s:fmt_none)
call s:hi("WhichKeySeparator",     s:fg_comment,   s:bg_none,        s:fmt_none)
call s:hi("WhichKeyTitle",         s:fg_keyword,   s:bg_none,        s:fmt_bold)
call s:hi("WhichKeyValue",         s:fg_comment,   s:bg_none,        s:fmt_none)
call s:hi("WhichKeyFloat",         s:fg_none,      s:bg_panel,       s:fmt_none)

" nvim-cmp
call s:hi("CmpItemAbbr",           s:fg_fg,        s:bg_none,        s:fmt_none)
call s:hi("CmpItemAbbrDeprecated", s:fg_fg_idle,   s:bg_none,        s:fmt_curl)
call s:hi("CmpItemAbbrMatch",      s:fg_keyword,   s:bg_none,        s:fmt_bold)
call s:hi("CmpItemAbbrMatchFuzzy", s:fg_keyword,   s:bg_none,        s:fmt_bold)
call s:hi("CmpItemMenu",           s:fg_comment,   s:bg_none,        s:fmt_none)

call s:hi("CmpItemKindVariable",   s:fg_fg,        s:bg_none,        s:fmt_none)
call s:hi("CmpItemKindInterface",  s:fg_fg_idle,   s:bg_none,        s:fmt_none)
call s:hi("CmpItemKindText",       s:fg_string,    s:bg_none,        s:fmt_none)
call s:hi("CmpItemKindFunction",   s:fg_function,  s:bg_none,        s:fmt_none)
call s:hi("CmpItemKindMethod",     s:fg_function,  s:bg_none,        s:fmt_none)
call s:hi("CmpItemKindKeyword",    s:fg_keyword,   s:bg_none,        s:fmt_none)
call s:hi("CmpItemKindProperty",   s:fg_accent,    s:bg_none,        s:fmt_none)
call s:hi("CmpItemKindUnit",       s:fg_constant,  s:bg_none,        s:fmt_none)

" Telescope
call s:hi("TelescopeNormal",       s:fg_fg,        s:bg_panel,       s:fmt_none)
call s:hi("TelescopeBorder",       s:fg_comment,   s:bg_panel,       s:fmt_none)
call s:hi("TelescopePromptPrefix", s:fg_accent,    s:bg_panel,       s:fmt_none)
call s:hi("TelescopeSelection",    s:fg_fg,        s:bg_selection,   s:fmt_none)
call s:hi("TelescopeSelectionCaret", s:fg_accent,  s:bg_selection,   s:fmt_none)
call s:hi("TelescopeMultiSelection", s:fg_keyword, s:bg_selection,   s:fmt_none)
call s:hi("TelescopeMatching",     s:fg_function,  s:bg_none,        s:fmt_bold)
call s:hi("TelescopePromptTitle",  s:fg_bg,        s:fg_keyword,     s:fmt_bold)
call s:hi("TelescopeResultsTitle", s:fg_bg,        s:fg_string,      s:fmt_bold)
call s:hi("TelescopePreviewTitle", s:fg_bg,        s:fg_special,     s:fmt_bold)

" Lazy
call s:hi("LazyNormal",            s:fg_fg,        s:bg_panel,       s:fmt_none)
call s:hi("LazyButton",            s:fg_fg,        s:bg_selection,   s:fmt_none)
call s:hi("LazyButtonActive",      s:fg_fg,        s:bg_accent,      s:fmt_bold)
call s:hi("LazyH1",                s:fg_keyword,   s:bg_none,        s:fmt_bold)
call s:hi("LazyH2",                s:fg_function,  s:bg_none,        s:fmt_bold)
call s:hi("LazySpecial",           s:fg_special,   s:bg_none,        s:fmt_none)
call s:hi("LazyProgressTodo",      s:fg_bg,        s:fg_comment,     s:fmt_none)
call s:hi("LazyProgressDone",      s:fg_bg,        s:fg_string,      s:fmt_none)
call s:hi("LazyProp",              s:fg_constant,  s:bg_none,        s:fmt_none)
call s:hi("LazyValue",             s:fg_string,    s:bg_none,        s:fmt_none)
call s:hi("LazyReasonPlugin",      s:fg_function,  s:bg_none,        s:fmt_none)
call s:hi("LazyReasonRuntime",     s:fg_keyword,   s:bg_none,        s:fmt_none)
call s:hi("LazyReasonEvent",       s:fg_regexp,    s:bg_none,        s:fmt_none)
call s:hi("LazyBorder",            s:fg_comment,   s:bg_comment,     s:fmt_none)
call s:hi("LazyCommit",            s:fg_constant,  s:bg_none,        s:fmt_none)

" Noice
call s:hi("NoiceCmdline",                  s:fg_fg,        s:bg_panel,       s:fmt_none)
call s:hi("NoiceCmdlineIcon",              s:fg_fg_idle,   s:bg_none,        s:fmt_none)
call s:hi("NoiceCmdlineIconSearch",        s:fg_accent,    s:bg_none,        s:fmt_none)
call s:hi("NoiceCmdlinePopup",             s:fg_fg,        s:bg_panel,       s:fmt_none)
call s:hi("NoiceCmdlinePopupBorder",       s:fg_fg_idle,   s:bg_none,        s:fmt_none)
call s:hi("NoiceCmdlinePopupBorderSearch", s:fg_accent,    s:bg_none,        s:fmt_none)
call s:hi("NoiceCmdlinePopupTitle",        s:fg_fg_idle,   s:bg_none,        s:fmt_bold)
call s:hi("NoiceCmdlinePrompt",            s:fg_keyword,   s:bg_none,        s:fmt_bold)
call s:hi("NoiceCompletionItemKindDefault",s:fg_special,   s:bg_none,        s:fmt_none)
call s:hi("NoiceCompletionItemMenu",       s:fg_fg,        s:bg_panel,       s:fmt_none)
call s:hi("NoiceCompletionItemWord",       s:fg_fg,        s:bg_panel,       s:fmt_none)
call s:hi("NoiceConfirm",                  s:fg_fg,        s:bg_panel,       s:fmt_none)
call s:hi("NoiceConfirmBorder",            s:fg_fg_idle,   s:bg_none,        s:fmt_none)
call s:hi("NoiceCursor",                   s:fg_bg,        s:fg_fg,          s:fmt_none)
call s:hi("NoiceFormatConfirm",            s:fg_fg,        s:bg_selection,   s:fmt_none)
call s:hi("NoiceFormatConfirmDefault",     s:fg_fg,        s:bg_selection,   s:fmt_none)
call s:hi("NoiceFormatDate",               s:fg_special,   s:bg_none,        s:fmt_none)
call s:hi("NoiceFormatEvent",              s:fg_comment,   s:bg_none,        s:fmt_none)
call s:hi("NoiceFormatKind",               s:fg_comment,   s:bg_none,        s:fmt_none)
call s:hi("NoiceFormatLevelDebug",         s:fg_comment,   s:bg_none,        s:fmt_none)
call s:hi("NoiceFormatLevelError",         s:fg_error,     s:bg_none,        s:fmt_none)
call s:hi("NoiceFormatLevelInfo",          s:fg_fg_idle,   s:bg_none,        s:fmt_none)
call s:hi("NoiceFormatLevelOff",           s:fg_comment,   s:bg_none,        s:fmt_none)
call s:hi("NoiceFormatLevelTrace",         s:fg_comment,   s:bg_none,        s:fmt_none)
call s:hi("NoiceFormatLevelWarn",          s:fg_accent,    s:bg_none,        s:fmt_none)
call s:hi("NoiceFormatProgressDone",       s:fg_bg,        s:fg_string,      s:fmt_none)
call s:hi("NoiceFormatProgressTodo",       s:fg_fg,        s:bg_selection,   s:fmt_none)
call s:hi("NoiceFormatTitle",              s:fg_keyword,   s:bg_none,        s:fmt_bold)
call s:hi("NoiceLspProgressClient",        s:fg_keyword,   s:bg_none,        s:fmt_bold)
call s:hi("NoiceLspProgressSpinner",       s:fg_constant,  s:bg_none,        s:fmt_none)
call s:hi("NoiceLspProgressTitle",         s:fg_comment,   s:bg_none,        s:fmt_none)
call s:hi("NoiceMini",                     s:fg_fg,        s:bg_panel,       s:fmt_none)
call s:hi("NoicePopup",                    s:fg_fg,        s:bg_panel,       s:fmt_none)
call s:hi("NoicePopupBorder",              s:fg_comment,   s:bg_none,        s:fmt_none)
call s:hi("NoicePopupmenu",                s:fg_fg,        s:bg_panel,       s:fmt_none)
call s:hi("NoicePopupmenuBorder",          s:fg_comment,   s:bg_none,        s:fmt_none)
call s:hi("NoicePopupmenuMatch",           s:fg_special,   s:bg_none,        s:fmt_bold)
call s:hi("NoicePopupmenuSelected",        s:fg_fg,        s:bg_selection,   s:fmt_none)
call s:hi("NoiceScrollbar",                s:fg_comment,   s:bg_panel,       s:fmt_none)
call s:hi("NoiceScrollbarThumb",           s:fg_fg_idle,   s:bg_none,        s:fmt_none)
call s:hi("NoiceSplit",                    s:fg_fg,        s:bg_panel,       s:fmt_none)
call s:hi("NoiceSplitBorder",              s:fg_comment,   s:bg_none,        s:fmt_none)
call s:hi("NoiceVirtualText",              s:fg_fg_idle,   s:bg_none,        s:fmt_none)

" Diff Syntax Highlighting
hi! link diffRemoved Constant
hi! link diffAdded String

"------------------------------------
" Terminal Colors
"------------------------------------
if has("nvim")
    let g:terminal_color_0  = s:palette.bg
    let g:terminal_color_1  = s:palette.markup
    let g:terminal_color_2  = s:palette.string
    let g:terminal_color_3  = s:palette.accent
    let g:terminal_color_4  = s:palette.tag
    let g:terminal_color_5  = s:palette.constant
    let g:terminal_color_6  = s:palette.regexp
    let g:terminal_color_7  = "#FFFFFF"
    let g:terminal_color_8  = s:palette.fg_idle
    let g:terminal_color_9  = s:palette.error
    let g:terminal_color_10 = s:palette.string
    let g:terminal_color_11 = s:palette.accent
    let g:terminal_color_12 = s:palette.tag
    let g:terminal_color_13 = s:palette.constant
    let g:terminal_color_14 = s:palette.regexp
    let g:terminal_color_15 = s:palette.comment
    let g:terminal_color_background = g:terminal_color_0
    let g:terminal_color_foreground = s:palette.fg
else
    let g:terminal_ansi_colors = [
        \ s:palette.bg,      s:palette.markup,
        \ s:palette.string,  s:palette.accent,
        \ s:palette.tag,     s:palette.constant,
        \ s:palette.regexp,  "#FFFFFF",
        \ s:palette.fg_idle, s:palette.error,
        \ s:palette.string,  s:palette.accent,
        \ s:palette.tag,     s:palette.constant,
        \ s:palette.regexp,  s:palette.comment
    \ ]
endif
