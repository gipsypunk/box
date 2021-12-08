if version > 580
  hi clear
  if exists("syntax_on")
    syntax reset
  endif
endif

let g:colors_name='yoda'

if !(has('termguicolors') && &termguicolors) && !has('gui_running') && &t_Co != 256
  finish
endif

" }}}
" Global Settings: {{{

if !exists('g:yoda_bold')
  let g:yoda_bold=1
endif
if !exists('g:yoda_italic')
  if has('gui_running') || $TERM_ITALICS == 'true'
    let g:yoda_italic=1
  else
    let g:yoda_italic=0
  endif
endif
if !exists('g:yoda_undercurl')
  let g:yoda_undercurl=1
endif
if !exists('g:yoda_underline')
  let g:yoda_underline=1
endif
if !exists('g:yoda_inverse')
  let g:yoda_inverse=1
endif

if !exists('g:yoda_guisp_fallback') || index(['fg', 'bg'], g:yoda_guisp_fallback) == -1
  let g:yoda_guisp_fallback='NONE'
endif

if !exists('g:yoda_improved_strings')
  let g:yoda_improved_strings=0
endif

if !exists('g:yoda_improved_warnings')
  let g:yoda_improved_warnings=0
endif

if !exists('g:yoda_termcolors')
  let g:yoda_termcolors=256
endif

if !exists('g:yoda_invert_indent_guides')
  let g:yoda_invert_indent_guides=0
endif

if exists('g:yoda_contrast')
  echo 'g:yoda_contrast is deprecated; use g:yoda_contrast_light and g:yoda_contrast_dark instead'
endif

if !exists('g:yoda_contrast_dark')
  let g:yoda_contrast_dark='medium'
endif

if !exists('g:yoda_contrast_light')
  let g:yoda_contrast_light='medium'
endif

let s:is_dark=(&background == 'dark')

" }}}
" Palette: {{{

" setup palette dictionary
let s:yo = {}

" fill it with absolute colors
let s:yo.dark0_hard  = ['#34C924', 234]     " 29-32-33
let s:yo.dark0       = ['#1C1C1C', 235]     " 40-40-40
let s:yo.dark0_soft  = ['#32302f', 236]     " 50-48-47
let s:yo.dark1       = ['#3c3836', 237]     " 60-56-54
let s:yo.dark2       = ['#504945', 239]     " 80-73-69
let s:yo.dark3       = ['#665c54', 241]     " 102-92-84
let s:yo.dark4       = ['#7c6f64', 243]     " 124-111-100
let s:yo.dark4_256   = ['#7c6f64', 243]     " 124-111-100

let s:yo.gray_245    = ['#928374', 245]     " 146-131-116
let s:yo.gray_244    = ['#928374', 244]     " 146-131-116

let s:yo.light0_hard = ['#f9f5d7', 230]     " 249-245-215
let s:yo.light0      = ['#fbf1c7', 229]     " 253-244-193
let s:yo.light0_soft = ['#f2e5bc', 228]     " 242-229-188
let s:yo.light1      = ['#ebdbb2', 223]     " 235-219-178
let s:yo.light2      = ['#d5c4a1', 250]     " 213-196-161
let s:yo.light3      = ['#bdae93', 248]     " 189-174-147
let s:yo.light4      = ['#a89984', 246]     " 168-153-132
let s:yo.light4_256  = ['#a89984', 246]     " 168-153-132

let s:yo.bright_red     = ['#fb4934', 167]     " 251-73-52
let s:yo.bright_green   = ['#b8bb26', 142]     " 184-187-38
let s:yo.bright_yellow  = ['#fabd2f', 214]     " 250-189-47
let s:yo.bright_blue    = ['#83a598', 109]     " 131-165-152
let s:yo.bright_purple  = ['#d3869b', 175]     " 211-134-155
let s:yo.bright_aqua    = ['#8ec07c', 108]     " 142-192-124
let s:yo.bright_orange  = ['#fe8019', 208]     " 254-128-25

let s:yo.neutral_red    = ['#cc241d', 124]     " 204-36-29
let s:yo.neutral_green  = ['#98971a', 106]     " 152-151-26
let s:yo.neutral_yellow = ['#d79921', 172]     " 215-153-33
let s:yo.neutral_blue   = ['#458588', 66]      " 69-133-136
let s:yo.neutral_purple = ['#b16286', 132]     " 177-98-134
let s:yo.neutral_aqua   = ['#689d6a', 72]      " 104-157-106
let s:yo.neutral_orange = ['#d65d0e', 166]     " 214-93-14

let s:yo.faded_red      = ['#9d0006', 88]      " 157-0-6
let s:yo.faded_green    = ['#79740e', 100]     " 121-116-14
let s:yo.faded_yellow   = ['#b57614', 136]     " 181-118-20
let s:yo.faded_blue     = ['#076678', 24]      " 7-102-120
let s:yo.faded_purple   = ['#8f3f71', 96]      " 143-63-113
let s:yo.faded_aqua     = ['#427b58', 66]      " 66-123-88
let s:yo.faded_orange   = ['#af3a03', 130]     " 175-58-3

" }}}
" Setup Emphasis: {{{

let s:bold = 'bold,'
if g:yoda_bold == 0
  let s:bold = ''
endif

let s:italic = 'italic,'
if g:yoda_italic == 0
  let s:italic = ''
endif

let s:underline = 'underline,'
if g:yoda_underline == 0
  let s:underline = ''
endif

let s:undercurl = 'undercurl,'
if g:yoda_undercurl == 0
  let s:undercurl = ''
endif

let s:inverse = 'inverse,'
if g:yoda_inverse == 0
  let s:inverse = ''
endif

" }}}
" Setup Colors: {{{

let s:vim_bg = ['bg', 'bg']
let s:vim_fg = ['fg', 'fg']
let s:none = ['NONE', 'NONE']

" determine relative colors
if s:is_dark
  let s:bg0  = s:yo.dark0
  if g:yoda_contrast_dark == 'soft'
    let s:bg0  = s:yo.dark0_soft
  elseif g:yoda_contrast_dark == 'hard'
    let s:bg0  = s:yo.dark0_hard
  endif

  let s:bg1  = s:yo.dark1
  let s:bg2  = s:yo.dark2
  let s:bg3  = s:yo.dark3
  let s:bg4  = s:yo.dark4

  let s:gray = s:yo.gray_245

  let s:fg0 = s:yo.light0
  let s:fg1 = s:yo.light1
  let s:fg2 = s:yo.light2
  let s:fg3 = s:yo.light3
  let s:fg4 = s:yo.light4

  let s:fg4_256 = s:yo.light4_256

  let s:red    = s:yo.bright_red
  let s:green  = s:yo.bright_green
  let s:yellow = s:yo.bright_yellow
  let s:blue   = s:yo.bright_blue
  let s:purple = s:yo.bright_purple
  let s:aqua   = s:yo.bright_aqua
  let s:orange = s:yo.bright_orange
else
  let s:bg0  = s:yo.light0
  if g:yoda_contrast_light == 'soft'
    let s:bg0  = s:yo.light0_soft
  elseif g:yoda_contrast_light == 'hard'
    let s:bg0  = s:yo.light0_hard
  endif

  let s:bg1  = s:yo.light1
  let s:bg2  = s:yo.light2
  let s:bg3  = s:yo.light3
  let s:bg4  = s:yo.light4

  let s:gray = s:yo.gray_244

  let s:fg0 = s:yo.dark0
  let s:fg1 = s:yo.dark1
  let s:fg2 = s:yo.dark2
  let s:fg3 = s:yo.dark3
  let s:fg4 = s:yo.dark4

  let s:fg4_256 = s:yo.dark4_256

  let s:red    = s:yo.faded_red
  let s:green  = s:yo.faded_green
  let s:yellow = s:yo.faded_yellow
  let s:blue   = s:yo.faded_blue
  let s:purple = s:yo.faded_purple
  let s:aqua   = s:yo.faded_aqua
  let s:orange = s:yo.faded_orange
endif

" reset to 16 colors fallback
if g:yoda_termcolors == 16
  let s:bg0[1]    = 0
  let s:fg4[1]    = 7
  let s:gray[1]   = 8
  let s:red[1]    = 9
  let s:green[1]  = 10
  let s:yellow[1] = 11
  let s:blue[1]   = 12
  let s:purple[1] = 13
  let s:aqua[1]   = 14
  let s:fg1[1]    = 15
endif

" save current relative colors back to palette dictionary
let s:yo.bg0 = s:bg0
let s:yo.bg1 = s:bg1
let s:yo.bg2 = s:bg2
let s:yo.bg3 = s:bg3
let s:yo.bg4 = s:bg4

let s:yo.gray = s:gray

let s:yo.fg0 = s:fg0
let s:yo.fg1 = s:fg1
let s:yo.fg2 = s:fg2
let s:yo.fg3 = s:fg3
let s:yo.fg4 = s:fg4

let s:yo.fg4_256 = s:fg4_256

let s:yo.red    = s:red
let s:yo.green  = s:green
let s:yo.yellow = s:yellow
let s:yo.blue   = s:blue
let s:yo.purple = s:purple
let s:yo.aqua   = s:aqua
let s:yo.orange = s:orange

" }}}
" Setup Terminal Colors For Neovim: {{{

if has('nvim')
  let g:terminal_color_0 = s:bg0[0]
  let g:terminal_color_8 = s:gray[0]

  let g:terminal_color_1 = s:yo.neutral_red[0]
  let g:terminal_color_9 = s:red[0]

  let g:terminal_color_2 = s:yo.neutral_green[0]
  let g:terminal_color_10 = s:green[0]

  let g:terminal_color_3 = s:yo.neutral_yellow[0]
  let g:terminal_color_11 = s:yellow[0]

  let g:terminal_color_4 = s:yo.neutral_blue[0]
  let g:terminal_color_12 = s:blue[0]

  let g:terminal_color_5 = s:yo.neutral_purple[0]
  let g:terminal_color_13 = s:purple[0]

  let g:terminal_color_6 = s:yo.neutral_aqua[0]
  let g:terminal_color_14 = s:aqua[0]

  let g:terminal_color_7 = s:fg4[0]
  let g:terminal_color_15 = s:fg1[0]
endif

" }}}
" Overload Setting: {{{

let s:hls_cursor = s:orange
if exists('g:yoda_hls_cursor')
  let s:hls_cursor = get(s:yo, g:yoda_hls_cursor)
endif

let s:number_column = s:none
if exists('g:yoda_number_column')
  let s:number_column = get(s:yo, g:yoda_number_column)
endif

let s:sign_column = s:bg1

if exists('g:gitgutter_override_sign_column_highlight') &&
      \ g:gitgutter_override_sign_column_highlight == 1
  let s:sign_column = s:number_column
else
  let g:gitgutter_override_sign_column_highlight = 0

  if exists('g:yoda_sign_column')
    let s:sign_column = get(s:yo, g:yoda_sign_column)
  endif
endif

let s:color_column = s:bg1
if exists('g:yoda_color_column')
  let s:color_column = get(s:yo, g:yoda_color_column)
endif

let s:vert_split = s:bg0
if exists('g:yoda_vert_split')
  let s:vert_split = get(s:yo, g:yoda_vert_split)
endif

let s:invert_signs = ''
if exists('g:yoda_invert_signs')
  if g:yoda_invert_signs == 1
    let s:invert_signs = s:inverse
  endif
endif

let s:invert_selection = s:inverse
if exists('g:yoda_invert_selection')
  if g:yoda_invert_selection == 0
    let s:invert_selection = ''
  endif
endif

let s:invert_tabline = ''
if exists('g:yoda_invert_tabline')
  if g:yoda_invert_tabline == 1
    let s:invert_tabline = s:inverse
  endif
endif

let s:italicize_comments = s:italic
if exists('g:yoda_italicize_comments')
  if g:yoda_italicize_comments == 0
    let s:italicize_comments = ''
  endif
endif

let s:italicize_strings = ''
if exists('g:yoda_italicize_strings')
  if g:yoda_italicize_strings == 1
    let s:italicize_strings = s:italic
  endif
endif

" }}}
" Highlighting Function: {{{

function! s:HL(group, fg, ...)
  " Arguments: group, guifg, guibg, gui, guisp

  " foreground
  let fg = a:fg

  " background
  if a:0 >= 1
    let bg = a:1
  else
    let bg = s:none
  endif

  " emphasis
  if a:0 >= 2 && strlen(a:2)
    let emstr = a:2
  else
    let emstr = 'NONE,'
  endif

  " special fallback
  if a:0 >= 3
    if g:yoda_guisp_fallback != 'NONE'
      let fg = a:3
    endif

    " bg fallback mode should invert higlighting
    if g:yoda_guisp_fallback == 'bg'
      let emstr .= 'inverse,'
    endif
  endif

  let histring = [ 'hi', a:group,
        \ 'guifg=' . fg[0], 'ctermfg=' . fg[1],
        \ 'guibg=' . bg[0], 'ctermbg=' . bg[1],
        \ 'gui=' . emstr[:-2], 'cterm=' . emstr[:-2]
        \ ]

  " special
  if a:0 >= 3
    call add(histring, 'guisp=' . a:3[0])
  endif

  execute join(histring, ' ')
endfunction

" }}}
" Yoda Hi Groups: {{{

" memoize common hi groups
call s:HL('YodaFg0', s:fg0)
call s:HL('YodaFg1', s:fg1)
call s:HL('YodaFg2', s:fg2)
call s:HL('YodaFg3', s:fg3)
call s:HL('YodaFg4', s:fg4)
call s:HL('YodaGray', s:gray)
call s:HL('YodaBg0', s:bg0)
call s:HL('YodaBg1', s:bg1)
call s:HL('YodaBg2', s:bg2)
call s:HL('YodaBg3', s:bg3)
call s:HL('YodaBg4', s:bg4)

call s:HL('YodaRed', s:red)
call s:HL('YodaRedBold', s:red, s:none, s:bold)
call s:HL('YodaGreen', s:green)
call s:HL('YodaGreenBold', s:green, s:none, s:bold)
call s:HL('YodaYellow', s:yellow)
call s:HL('YodaYellowBold', s:yellow, s:none, s:bold)
call s:HL('YodaBlue', s:blue)
call s:HL('YodaBlueBold', s:blue, s:none, s:bold)
call s:HL('YodaPurple', s:purple)
call s:HL('YodaPurpleBold', s:purple, s:none, s:bold)
call s:HL('YodaAqua', s:aqua)
call s:HL('YodaAquaBold', s:aqua, s:none, s:bold)
call s:HL('YodaOrange', s:orange)
call s:HL('YodaOrangeBold', s:orange, s:none, s:bold)

call s:HL('YodaRedSign', s:red, s:sign_column, s:invert_signs)
call s:HL('YodaGreenSign', s:green, s:sign_column, s:invert_signs)
call s:HL('YodaYellowSign', s:yellow, s:sign_column, s:invert_signs)
call s:HL('YodalueSign', s:blue, s:sign_column, s:invert_signs)
call s:HL('YodaPurpleSign', s:purple, s:sign_column, s:invert_signs)
call s:HL('YodaAquaSign', s:aqua, s:sign_column, s:invert_signs)
call s:HL('YodaOrangeSign', s:orange, s:sign_column, s:invert_signs)

" }}}

" Vanilla colorscheme ---------------------------------------------------------
" General UI: {{{

" Normal text
call s:HL('Normal', s:fg1, s:bg0)


if s:is_dark
  set background=dark
else
  set background=light
endif

if version >= 700
  " Screen line that the cursor is
  call s:HL('CursorLine',   s:none, s:bg1)
  " Screen column that the cursor is
  hi! link CursorColumn CursorLine

  " Tab pages line filler
  call s:HL('TabLineFill', s:bg4, s:bg1, s:invert_tabline)
  " Active tab page label
  call s:HL('TabLineSel', s:green, s:bg1, s:invert_tabline)
  " Not active tab page label
  hi! link TabLine TabLineFill

  " Match paired bracket under the cursor
  call s:HL('MatchParen', s:none, s:bg3, s:bold)
endif

if version >= 703
  " Highlighted screen columns
  call s:HL('ColorColumn',  s:none, s:color_column)

  " Concealed element: \lambda → λ
  call s:HL('Conceal', s:blue, s:none)

  " Line number of CursorLine
  call s:HL('CursorLineNr', s:yellow, s:bg1)
endif

hi! link NonText YodaBg2
hi! link SpecialKey YodaBg2

call s:HL('Visual',    s:none,  s:bg3, s:invert_selection)
hi! link VisualNOS Visual

call s:HL('Search',    s:yellow, s:bg0, s:inverse)
call s:HL('IncSearch', s:hls_cursor, s:bg0, s:inverse)

call s:HL('Underlined', s:blue, s:none, s:underline)

call s:HL('StatusLine',   s:bg2, s:fg1, s:inverse)
call s:HL('StatusLineNC', s:bg1, s:fg4, s:inverse)

" The column separating vertically split windows
call s:HL('VertSplit', s:bg3, s:vert_split)

" Current match in wildmenu completion
call s:HL('WildMenu', s:blue, s:bg2, s:bold)

" Directory names, special names in listing
hi! link Directory YodaGreenBold

" Titles for output from :set all, :autocmd, etc.
hi! link Title YodaGreenBold

" Error messages on the command line
call s:HL('ErrorMsg',   s:bg0, s:red, s:bold)
" More prompt: -- More --
hi! link MoreMsg YodaYellowBold
" Current mode message: -- INSERT --
hi! link ModeMsg YodaYellowBold
" 'Press enter' prompt and yes/no questions
hi! link Question YodaOrangeBold
" Warning messages
hi! link WarningMsg YodaRedBold

" }}}
" Gutter: {{{

" Line number for :number and :# commands
call s:HL('LineNr', s:bg4, s:number_column)

" Column where signs are displayed
call s:HL('SignColumn', s:none, s:sign_column)

" Line used for closed folds
call s:HL('Folded', s:gray, s:bg1, s:italic)
" Column where folds are displayed
call s:HL('FoldColumn', s:gray, s:bg1)

" }}}
" Cursor: {{{

" Character under cursor
call s:HL('Cursor', s:none, s:none, s:inverse)
" Visual mode cursor, selection
hi! link vCursor Cursor
" Input moder cursor
hi! link iCursor Cursor
" Language mapping cursor
hi! link lCursor Cursor

" }}}
" Syntax Highlighting: {{{

if g:yoda_improved_strings == 0
  hi! link Special YodaOrange
else
  call s:HL('Special', s:orange, s:bg1, s:italicize_strings)
endif

call s:HL('Comment', s:gray, s:none, s:italicize_comments)
call s:HL('Todo', s:vim_fg, s:vim_bg, s:bold . s:italic)
call s:HL('Error', s:red, s:vim_bg, s:bold . s:inverse)

" Generic statement
hi! link Statement YodaRed
" if, then, else, endif, swicth, etc.
hi! link Conditional YodaRed
" for, do, while, etc.
hi! link Repeat YodaRed
" case, default, etc.
hi! link Label YodaRed
" try, catch, throw
hi! link Exception YodaRed
" sizeof, "+", "*", etc.
hi! link Operator Normal
" Any other keyword
hi! link Keyword YodaRed

" Variable name
hi! link Identifier YodaBlue
" Function name
hi! link Function YodaGreenBold

" Generic preprocessor
hi! link PreProc YodaAqua
" Preprocessor #include
hi! link Include YodaAqua
" Preprocessor #define
hi! link Define YodaAqua
" Same as Define
hi! link Macro YodaAqua
" Preprocessor #if, #else, #endif, etc.
hi! link PreCondit YodaAqua

" Generic constant
hi! link Constant YodaPurple
" Character constant: 'c', '/n'
hi! link Character YodaPurple
" String constant: "this is a string"
if g:yoda_improved_strings == 0
  call s:HL('String',  s:green, s:none, s:italicize_strings)
else
  call s:HL('String',  s:fg1, s:bg1, s:italicize_strings)
endif
" Boolean constant: TRUE, false
hi! link Boolean YodaPurple
" Number constant: 234, 0xff
hi! link Number YodaPurple
" Floating point constant: 2.3e10
hi! link Float YodaPurple

" Generic type
hi! link Type YodaYellow
" static, register, volatile, etc
hi! link StorageClass YodaOrange
" struct, union, enum, etc.
hi! link Structure YodaAqua
" typedef
hi! link Typedef YodaYellow

" }}}
" Completion Menu: {{{

if version >= 700
  " Popup menu: normal item
  call s:HL('Pmenu', s:fg1, s:bg2)
  " Popup menu: selected item
  call s:HL('PmenuSel', s:bg2, s:blue, s:bold)
  " Popup menu: scrollbar
  call s:HL('PmenuSbar', s:none, s:bg2)
  " Popup menu: scrollbar thumb
  call s:HL('PmenuThumb', s:none, s:bg4)
endif

" }}}
" Diffs: {{{

call s:HL('DiffDelete', s:red, s:bg0, s:inverse)
call s:HL('DiffAdd',    s:green, s:bg0, s:inverse)
"call s:HL('DiffChange', s:bg0, s:blue)
"call s:HL('DiffText',   s:bg0, s:yellow)

" Alternative setting
call s:HL('DiffChange', s:aqua, s:bg0, s:inverse)
call s:HL('DiffText',   s:yellow, s:bg0, s:inverse)

" }}}
" Spelling: {{{

if has("spell")
  " Not capitalised word, or compile warnings
  if g:yoda_improved_warnings == 0
    call s:HL('SpellCap',   s:none, s:none, s:undercurl, s:red)
  else
    call s:HL('SpellCap',   s:green, s:none, s:bold . s:italic)
  endif
  " Not recognized word
  call s:HL('SpellBad',   s:none, s:none, s:undercurl, s:blue)
  " Wrong spelling for selected region
  call s:HL('SpellLocal', s:none, s:none, s:undercurl, s:aqua)
  " Rare word
  call s:HL('SpellRare',  s:none, s:none, s:undercurl, s:purple)
endif

" }}}

" Plugin specific -------------------------------------------------------------
" EasyMotion: {{{

hi! link EasyMotionTarget Search
hi! link EasyMotionShade Comment

" }}}
" Sneak: {{{

hi! link Sneak Search
hi! link SneakLabel Search

" }}}
" Indent Guides: {{{

if !exists('g:indent_guides_auto_colors')
  let g:indent_guides_auto_colors = 0
endif

if g:indent_guides_auto_colors == 0
  if g:yoda_invert_indent_guides == 0
    call s:HL('IndentGuidesOdd', s:vim_bg, s:bg2)
    call s:HL('IndentGuidesEven', s:vim_bg, s:bg1)
  else
    call s:HL('IndentGuidesOdd', s:vim_bg, s:bg2, s:inverse)
    call s:HL('IndentGuidesEven', s:vim_bg, s:bg3, s:inverse)
  endif
endif

" }}}
" IndentLine: {{{

if !exists('g:indentLine_color_term')
  let g:indentLine_color_term = s:bg2[1]
endif
if !exists('g:indentLine_color_gui')
  let g:indentLine_color_gui = s:bg2[0]
endif

" }}}
" Rainbow Parentheses: {{{

if !exists('g:rbpt_colorpairs')
  let g:rbpt_colorpairs =
    \ [
      \ ['blue', '#458588'], ['magenta', '#b16286'],
      \ ['red',  '#cc241d'], ['166',     '#d65d0e']
    \ ]
endif

let g:rainbow_guifgs = [ '#d65d0e', '#cc241d', '#b16286', '#458588' ]
let g:rainbow_ctermfgs = [ '166', 'red', 'magenta', 'blue' ]

if !exists('g:rainbow_conf')
   let g:rainbow_conf = {}
endif
if !has_key(g:rainbow_conf, 'guifgs')
   let g:rainbow_conf['guifgs'] = g:rainbow_guifgs
endif
if !has_key(g:rainbow_conf, 'ctermfgs')
   let g:rainbow_conf['ctermfgs'] = g:rainbow_ctermfgs
endif

let g:niji_dark_colours = g:rbpt_colorpairs
let g:niji_light_colours = g:rbpt_colorpairs

"}}}
" GitGutter: {{{

hi! link GitGutterAdd YodaGreenSign
hi! link GitGutterChange YodaAquaSign
hi! link GitGutterDelete YodaRedSign
hi! link GitGutterChangeDelete YodaAquaSign

" }}}
" GitCommit: "{{{

hi! link gitcommitSelectedFile YodaGreen
hi! link gitcommitDiscardedFile YodaRed

" }}}
" Signify: {{{

hi! link SignifySignAdd YodaGreenSign
hi! link SignifySignChange YodaAquaSign
hi! link SignifySignDelete YodaRedSign

" }}}
" Syntastic: {{{

call s:HL('SyntasticError', s:none, s:none, s:undercurl, s:red)
call s:HL('SyntasticWarning', s:none, s:none, s:undercurl, s:yellow)

hi! link SyntasticErrorSign YodaRedSign
hi! link SyntasticWarningSign YodaYellowSign

" }}}
" Signature: {{{
hi! link SignatureMarkText   YodaBlueSign
hi! link SignatureMarkerText YodaPurpleSign

" }}}
" ShowMarks: {{{

hi! link ShowMarksHLl YodaBlueSign
hi! link ShowMarksHLu YodaBlueSign
hi! link ShowMarksHLo YodaBlueSign
hi! link ShowMarksHLm YodaBlueSign

" }}}
" CtrlP: {{{

hi! link CtrlPMatch YodaYellow
hi! link CtrlPNoEntries YodaRed
hi! link CtrlPPrtBase YodaBg2
hi! link CtrlPPrtCursor YodaBlue
hi! link CtrlPLinePre YodaBg2

call s:HL('CtrlPMode1', s:blue, s:bg2, s:bold)
call s:HL('CtrlPMode2', s:bg0, s:blue, s:bold)
call s:HL('CtrlPStats', s:fg4, s:bg2, s:bold)

" }}}
" Startify: {{{

hi! link StartifyBracket YodaFg3
hi! link StartifyFile YodaFg1
hi! link StartifyNumber YodaBlue
hi! link StartifyPath YodaGray
hi! link StartifySlash YodaGray
hi! link StartifySection YodaYellow
hi! link StartifySpecial YodaBg2
hi! link StartifyHeader YodaOrange
hi! link StartifyFooter YodaBg2

" }}}
" Vimshell: {{{

let g:vimshell_escape_colors = [
  \ s:bg4[0], s:red[0], s:green[0], s:yellow[0],
  \ s:blue[0], s:purple[0], s:aqua[0], s:fg4[0],
  \ s:bg0[0], s:red[0], s:green[0], s:orange[0],
  \ s:blue[0], s:purple[0], s:aqua[0], s:fg0[0]
  \ ]

" }}}
" BufTabLine: {{{

call s:HL('BufTabLineCurrent', s:bg0, s:fg4)
call s:HL('BufTabLineActive', s:fg4, s:bg2)
call s:HL('BufTabLineHidden', s:bg4, s:bg1)
call s:HL('BufTabLineFill', s:bg0, s:bg0)

" }}}
" Asynchronous Lint Engine: {{{

call s:HL('ALEError', s:none, s:none, s:undercurl, s:red)
call s:HL('ALEWarning', s:none, s:none, s:undercurl, s:yellow)
call s:HL('ALEInfo', s:none, s:none, s:undercurl, s:blue)

hi! link ALEErrorSign YodaRedSign
hi! link ALEWarningSign YodaYellowSign
hi! link ALEInfoSign YodaBlueSign

" }}}
" Dirvish: {{{

hi! link DirvishPathTail YodaAqua
hi! link DirvishArg YodaYellow

" }}}
" Netrw: {{{

hi! link netrwDir YodaAqua
hi! link netrwClassify YodaAqua
hi! link netrwLink YodaGray
hi! link netrwSymLink YodaFg1
hi! link netrwExe YodaYellow
hi! link netrwComment YodaGray
hi! link netrwList YodaBlue
hi! link netrwHelpCmd YodaAqua
hi! link netrwCmdSep YodaFg3
hi! link netrwVersion YodaGreen

" }}}
" NERDTree: {{{

hi! link NERDTreeDir YodaAqua
hi! link NERDTreeDirSlash YodaAqua

hi! link NERDTreeOpenable YodaOrange
hi! link NERDTreeClosable YodaOrange

hi! link NERDTreeFile YodaFg1
hi! link NERDTreeExecFile YodaYellow

hi! link NERDTreeUp YodaGray
hi! link NERDTreeCWD YodaGreen
hi! link NERDTreeHelp YodaFg1

hi! link NERDTreeToggleOn YodaGreen
hi! link NERDTreeToggleOff YodaRed

" }}}
" Vim Multiple Cursors: {{{

call s:HL('multiple_cursors_cursor', s:none, s:none, s:inverse)
call s:HL('multiple_cursors_visual', s:none, s:bg2)

" }}}
" coc.nvim: {{{

hi! link CocErrorSign YodaRedSign
hi! link CocWarningSign YodaOrangeSign
hi! link CocInfoSign YodaYellowSign
hi! link CocHintSign YodaBlueSign
hi! link CocErrorFloat YodaRed
hi! link CocWarningFloat YodaOrange
hi! link CocInfoFloat YodaYellow
hi! link CocHintFloat YodaBlue
hi! link CocDiagnosticsError YodaRed
hi! link CocDiagnosticsWarning YodaOrange
hi! link CocDiagnosticsInfo YodaYellow
hi! link CocDiagnosticsHint YodaBlue

hi! link CocSelectedText YodaRed
hi! link CocCodeLens YodaGray

call s:HL('CocErrorHighlight', s:none, s:none, s:undercurl, s:red)
call s:HL('CocWarningHighlight', s:none, s:none, s:undercurl, s:orange)
call s:HL('CocInfoHighlight', s:none, s:none, s:undercurl, s:yellow)
call s:HL('CocHintHighlight', s:none, s:none, s:undercurl, s:blue)

" }}}

" Filetype specific -----------------------------------------------------------
" Diff: {{{

hi! link diffAdded YodaGreen
hi! link diffRemoved YodaRed
hi! link diffChanged YodaAqua

hi! link diffFile YodaOrange
hi! link diffNewFile YodaYellow

hi! link diffLine YodaBlue

" }}}
" Html: {{{

hi! link htmlTag YodaBlue
hi! link htmlEndTag YodaBlue

hi! link htmlTagName YodaAquaBold
hi! link htmlArg YodaAqua

hi! link htmlScriptTag YodaPurple
hi! link htmlTagN YodaFg1
hi! link htmlSpecialTagName YodaAquaBold

call s:HL('htmlLink', s:fg4, s:none, s:underline)

hi! link htmlSpecialChar YodaOrange

call s:HL('htmlBold', s:vim_fg, s:vim_bg, s:bold)
call s:HL('htmlBoldUnderline', s:vim_fg, s:vim_bg, s:bold . s:underline)
call s:HL('htmlBoldItalic', s:vim_fg, s:vim_bg, s:bold . s:italic)
call s:HL('htmlBoldUnderlineItalic', s:vim_fg, s:vim_bg, s:bold . s:underline . s:italic)

call s:HL('htmlUnderline', s:vim_fg, s:vim_bg, s:underline)
call s:HL('htmlUnderlineItalic', s:vim_fg, s:vim_bg, s:underline . s:italic)
call s:HL('htmlItalic', s:vim_fg, s:vim_bg, s:italic)

" }}}
" Xml: {{{

hi! link xmlTag YodaBlue
hi! link xmlEndTag YodaBlue
hi! link xmlTagName YodaBlue
hi! link xmlEqual YodaBlue
hi! link docbkKeyword YodaAquaBold

hi! link xmlDocTypeDecl YodaGray
hi! link xmlDocTypeKeyword YodaPurple
hi! link xmlCdataStart YodaGray
hi! link xmlCdataCdata YodaPurple
hi! link dtdFunction YodaGray
hi! link dtdTagName YodaPurple

hi! link xmlAttrib YodaAqua
hi! link xmlProcessingDelim YodaGray
hi! link dtdParamEntityPunct YodaGray
hi! link dtdParamEntityDPunct YodaGray
hi! link xmlAttribPunct YodaGray

hi! link xmlEntity YodaOrange
hi! link xmlEntityPunct YodaOrange
" }}}
" Vim: {{{

call s:HL('vimCommentTitle', s:fg4_256, s:none, s:bold . s:italicize_comments)

hi! link vimNotation YodaOrange
hi! link vimBracket YodaOrange
hi! link vimMapModKey YodaOrange
hi! link vimFuncSID YodaFg3
hi! link vimSetSep YodaFg3
hi! link vimSep YodaFg3
hi! link vimContinue YodaFg3

" }}}
" Clojure: {{{

hi! link clojureKeyword YodaBlue
hi! link clojureCond YodaOrange
hi! link clojureSpecial YodaOrange
hi! link clojureDefine YodaOrange

hi! link clojureFunc YodaYellow
hi! link clojureRepeat YodaYellow
hi! link clojureCharacter YodaAqua
hi! link clojureStringEscape YodaAqua
hi! link clojureException YodaRed

hi! link clojureRegexp YodaAqua
hi! link clojureRegexpEscape YodaAqua
call s:HL('clojureRegexpCharClass', s:fg3, s:none, s:bold)
hi! link clojureRegexpMod clojureRegexpCharClass
hi! link clojureRegexpQuantifier clojureRegexpCharClass

hi! link clojureParen YodaFg3
hi! link clojureAnonArg YodaYellow
hi! link clojureVariable YodaBlue
hi! link clojureMacro YodaOrange

hi! link clojureMeta YodaYellow
hi! link clojureDeref YodaYellow
hi! link clojureQuote YodaYellow
hi! link clojureUnquote YodaYellow

" }}}
" C: {{{

hi! link cOperator YodaPurple
hi! link cStructure YodaOrange

" }}}
" Python: {{{

hi! link pythonBuiltin YodaOrange
hi! link pythonBuiltinObj YodaOrange
hi! link pythonBuiltinFunc YodaOrange
hi! link pythonFunction YodaAqua
hi! link pythonDecorator YodaRed
hi! link pythonInclude YodaBlue
hi! link pythonImport YodaBlue
hi! link pythonRun YodaBlue
hi! link pythonCoding YodaBlue
hi! link pythonOperator YodaRed
hi! link pythonException YodaRed
hi! link pythonExceptions YodaPurple
hi! link pythonBoolean YodaPurple
hi! link pythonDot YodaFg3
hi! link pythonConditional YodaRed
hi! link pythonRepeat YodaRed
hi! link pythonDottedName YodaGreenBold

" }}}
" CSS: {{{

hi! link cssBraces YodaBlue
hi! link cssFunctionName YodaYellow
hi! link cssIdentifier YodaOrange
hi! link cssClassName YodaGreen
hi! link cssColor YodaBlue
hi! link cssSelectorOp YodaBlue
hi! link cssSelectorOp2 YodaBlue
hi! link cssImportant YodaGreen
hi! link cssVendor YodaFg1

hi! link cssTextProp YodaAqua
hi! link cssAnimationProp YodaAqua
hi! link cssUIProp YodaYellow
hi! link cssTransformProp YodaAqua
hi! link cssTransitionProp YodaAqua
hi! link cssPrintProp YodaAqua
hi! link cssPositioningProp YodaYellow
hi! link cssBoxProp YodaAqua
hi! link cssFontDescriptorProp YodaAqua
hi! link cssFlexibleBoxProp YodaAqua
hi! link cssBorderOutlineProp YodaAqua
hi! link cssBackgroundProp YodaAqua
hi! link cssMarginProp YodaAqua
hi! link cssListProp YodaAqua
hi! link cssTableProp YodaAqua
hi! link cssFontProp YodaAqua
hi! link cssPaddingProp YodaAqua
hi! link cssDimensionProp YodaAqua
hi! link cssRenderProp YodaAqua
hi! link cssColorProp YodaAqua
hi! link cssGeneratedContentProp YodaAqua

" }}}
" JavaScript: {{{

hi! link javaScriptBraces YodaFg1
hi! link javaScriptFunction YodaAqua
hi! link javaScriptIdentifier YodaRed
hi! link javaScriptMember YodaBlue
hi! link javaScriptNumber YodaPurple
hi! link javaScriptNull YodaPurple
hi! link javaScriptParens YodaFg3

" }}}
" YAJS: {{{

hi! link javascriptImport YodaAqua
hi! link javascriptExport YodaAqua
hi! link javascriptClassKeyword YodaAqua
hi! link javascriptClassExtends YodaAqua
hi! link javascriptDefault YodaAqua

hi! link javascriptClassName YodaYellow
hi! link javascriptClassSuperName YodaYellow
hi! link javascriptGlobal YodaYellow

hi! link javascriptEndColons YodaFg1
hi! link javascriptFuncArg YodaFg1
hi! link javascriptGlobalMethod YodaFg1
hi! link javascriptNodeGlobal YodaFg1
hi! link javascriptBOMWindowProp YodaFg1
hi! link javascriptArrayMethod YodaFg1
hi! link javascriptArrayStaticMethod YodaFg1
hi! link javascriptCacheMethod YodaFg1
hi! link javascriptDateMethod YodaFg1
hi! link javascriptMathStaticMethod YodaFg1

" hi! link javascriptProp YodaFg1
hi! link javascriptURLUtilsProp YodaFg1
hi! link javascriptBOMNavigatorProp YodaFg1
hi! link javascriptDOMDocMethod YodaFg1
hi! link javascriptDOMDocProp YodaFg1
hi! link javascriptBOMLocationMethod YodaFg1
hi! link javascriptBOMWindowMethod YodaFg1
hi! link javascriptStringMethod YodaFg1

hi! link javascriptVariable YodaOrange
" hi! link javascriptVariable YodaRed
" hi! link javascriptIdentifier YodaOrange
" hi! link javascriptClassSuper YodaOrange
hi! link javascriptIdentifier YodaOrange
hi! link javascriptClassSuper YodaOrange

" hi! link javascriptFuncKeyword YodaOrange
" hi! link javascriptAsyncFunc YodaOrange
hi! link javascriptFuncKeyword YodaAqua
hi! link javascriptAsyncFunc YodaAqua
hi! link javascriptClassStatic YodaOrange

hi! link javascriptOperator YodaRed
hi! link javascriptForOperator YodaRed
hi! link javascriptYield YodaRed
hi! link javascriptExceptions YodaRed
hi! link javascriptMessage YodaRed

hi! link javascriptTemplateSB YodaAqua
hi! link javascriptTemplateSubstitution YodaFg1

" hi! link javascriptLabel YodaBlue
" hi! link javascriptObjectLabel YodaBlue
" hi! link javascriptPropertyName YodaBlue
hi! link javascriptLabel YodaFg1
hi! link javascriptObjectLabel YodaFg1
hi! link javascriptPropertyName YodaFg1

hi! link javascriptLogicSymbols YodaFg1
hi! link javascriptArrowFunc YodaYellow

hi! link javascriptDocParamName YodaFg4
hi! link javascriptDocTags YodaFg4
hi! link javascriptDocNotation YodaFg4
hi! link javascriptDocParamType YodaFg4
hi! link javascriptDocNamedParamType YodaFg4

hi! link javascriptBrackets YodaFg1
hi! link javascriptDOMElemAttrs YodaFg1
hi! link javascriptDOMEventMethod YodaFg1
hi! link javascriptDOMNodeMethod YodaFg1
hi! link javascriptDOMStorageMethod YodaFg1
hi! link javascriptHeadersMethod YodaFg1

hi! link javascriptAsyncFuncKeyword YodaRed
hi! link javascriptAwaitFuncKeyword YodaRed

" }}}
" PanglossJS: {{{

hi! link jsClassKeyword YodaAqua
hi! link jsExtendsKeyword YodaAqua
hi! link jsExportDefault YodaAqua
hi! link jsTemplateBraces YodaAqua
hi! link jsGlobalNodeObjects YodaFg1
hi! link jsGlobalObjects YodaFg1
hi! link jsFunction YodaAqua
hi! link jsFuncParens YodaFg3
hi! link jsParens YodaFg3
hi! link jsNull YodaPurple
hi! link jsUndefined YodaPurple
hi! link jsClassDefinition YodaYellow

" }}}
" TypeScript: {{{

hi! link typeScriptReserved YodaAqua
hi! link typeScriptLabel YodaAqua
hi! link typeScriptFuncKeyword YodaAqua
hi! link typeScriptIdentifier YodaOrange
hi! link typeScriptBraces YodaFg1
hi! link typeScriptEndColons YodaFg1
hi! link typeScriptDOMObjects YodaFg1
hi! link typeScriptAjaxMethods YodaFg1
hi! link typeScriptLogicSymbols YodaFg1
hi! link typeScriptDocSeeTag Comment
hi! link typeScriptDocParam Comment
hi! link typeScriptDocTags vimCommentTitle
hi! link typeScriptGlobalObjects YodaFg1
hi! link typeScriptParens YodaFg3
hi! link typeScriptOpSymbols YodaFg3
hi! link typeScriptHtmlElemProperties YodaFg1
hi! link typeScriptNull YodaPurple
hi! link typeScriptInterpolationDelimiter YodaAqua

" }}}
" PureScript: {{{

hi! link purescriptModuleKeyword YodaAqua
hi! link purescriptModuleName YodaFg1
hi! link purescriptWhere YodaAqua
hi! link purescriptDelimiter YodaFg4
hi! link purescriptType YodaFg1
hi! link purescriptImportKeyword YodaAqua
hi! link purescriptHidingKeyword YodaAqua
hi! link purescriptAsKeyword YodaAqua
hi! link purescriptStructure YodaAqua
hi! link purescriptOperator YodaBlue

hi! link purescriptTypeVar YodaFg1
hi! link purescriptConstructor YodaFg1
hi! link purescriptFunction YodaFg1
hi! link purescriptConditional YodaOrange
hi! link purescriptBacktick YodaOrange

" }}}
" CoffeeScript: {{{

hi! link coffeeExtendedOp YodaFg3
hi! link coffeeSpecialOp YodaFg3
hi! link coffeeCurly YodaOrange
hi! link coffeeParen YodaFg3
hi! link coffeeBracket YodaOrange

" }}}
" Ruby: {{{

hi! link rubyStringDelimiter YodaGreen
hi! link rubyInterpolationDelimiter YodaAqua

" }}}
" ObjectiveC: {{{

hi! link objcTypeModifier YodaRed
hi! link objcDirective YodaBlue

" }}}
" Go: {{{

hi! link goDirective YodaAqua
hi! link goConstants YodaPurple
hi! link goDeclaration YodaRed
hi! link goDeclType YodaBlue
hi! link goBuiltins YodaOrange

" }}}
" Lua: {{{

hi! link luaIn YodaRed
hi! link luaFunction YodaAqua
hi! link luaTable YodaOrange

" }}}
" MoonScript: {{{

hi! link moonSpecialOp YodaFg3
hi! link moonExtendedOp YodaFg3
hi! link moonFunction YodaFg3
hi! link moonObject YodaYellow

" }}}
" Java: {{{

hi! link javaAnnotation YodaBlue
hi! link javaDocTags YodaAqua
hi! link javaCommentTitle vimCommentTitle
hi! link javaParen YodaFg3
hi! link javaParen1 YodaFg3
hi! link javaParen2 YodaFg3
hi! link javaParen3 YodaFg3
hi! link javaParen4 YodaFg3
hi! link javaParen5 YodaFg3
hi! link javaOperator YodaOrange

hi! link javaVarArg YodaGreen

" }}}
" Elixir: {{{

hi! link elixirDocString Comment

hi! link elixirStringDelimiter YodaGreen
hi! link elixirInterpolationDelimiter YodaAqua

hi! link elixirModuleDeclaration YodaYellow

" }}}
" Scala: {{{

" NB: scala vim syntax file is kinda horrible
hi! link scalaNameDefinition YodaFg1
hi! link scalaCaseFollowing YodaFg1
hi! link scalaCapitalWord Yodag1
hi! link scalaTypeExtension YodaFg1

hi! link scalaKeyword YodaRed
hi! link scalaKeywordModifier YodaRed

hi! link scalaSpecial YodaAqua
hi! link scalaOperator YodaFg1

hi! link scalaTypeDeclaration YodaYellow
hi! link scalaTypeTypePostDeclaration YodaYellow

hi! link scalaInstanceDeclaration YodaFg1
hi! link scalaInterpolation YodaAqua

" }}}
" Markdown: {{{

call s:HL('markdownItalic', s:fg3, s:none, s:italic)

hi! link markdownH1 YodaGreenBold
hi! link markdownH2 YodaGreenBold
hi! link markdownH3 YodaYellowBold
hi! link markdownH4 YodaYellowBold
hi! link markdownH5 YodaYellow
hi! link markdownH6 YodaYellow

hi! link markdownCode YodaAqua
hi! link markdownCodeBlock YodaAqua
hi! link markdownCodeDelimiter YodaAqua

hi! link markdownBlockquote YodaGray
hi! link markdownListMarker YodaGray
hi! link markdownOrderedListMarker YodaGray
hi! link markdownRule YodaGray
hi! link markdownHeadingRule YodaGray

hi! link markdownUrlDelimiter YodaFg3
hi! link markdownLinkDelimiter YodaFg3
hi! link markdownLinkTextDelimiter YodaFg3

hi! link markdownHeadingDelimiter YodaOrange
hi! link markdownUrl YodaPurple
hi! link markdownUrlTitleDelimiter YodaGreen

call s:HL('markdownLinkText', s:gray, s:none, s:underline)
hi! link markdownIdDeclaration markdownLinkText

" }}}
" Haskell: {{{

" hi! link haskellType YodaYellow
" hi! link haskellOperators YodaOrange
" hi! link haskellConditional YodaAqua
" hi! link haskellLet YodaOrange
"
hi! link haskellType YodaFg1
hi! link haskellIdentifier YodaFg1
hi! link haskellSeparator YodaFg1
hi! link haskellDelimiter YodaFg4
hi! link haskellOperators YodaBlue
"
hi! link haskellBacktick YodaOrange
hi! link haskellStatement YodaOrange
hi! link haskellConditional YodaOrange

hi! link haskellLet YodaAqua
hi! link haskellDefault YodaAqua
hi! link haskellWhere YodaAqua
hi! link haskellBottom YodaAqua
hi! link haskellBlockKeywords YodaAqua
hi! link haskellImportKeywords YodaAqua
hi! link haskellDeclKeyword YodaAqua
hi! link haskellDeriving YodaAqua
hi! link haskellAssocType YodaAqua

hi! link haskellNumber YodaPurple
hi! link haskellPragma YodaPurple

hi! link haskellString YodaGreen
hi! link haskellChar YodaGreen

" }}}
" Json: {{{

hi! link jsonKeyword YodaGreen
hi! link jsonQuote YodaGreen
hi! link jsonBraces YodaFg1
hi! link jsonString YodaFg1

" }}}


" Functions -------------------------------------------------------------------
" Search Highlighting Cursor {{{

function! YodaHlsShowCursor()
  call s:HL('Cursor', s:bg0, s:hls_cursor)
endfunction

function! YodaHlsHideCursor()
  call s:HL('Cursor', s:none, s:none, s:inverse)
endfunction

" }}}

" vim: set sw=2 ts=2 sts=2 et tw=80 ft=vim fdm=marker:
