hi clear
if exists('syntax_on')
    syntax reset
endif

let g:colors_name = 'anthraxylon'

let s:highlights = {}

function s:hi(group, attrs)
  if !has_key(s:highlights, a:group)
    let s:highlights[a:group] = ''
  endif

  let l:attr_str = a:attrs->map({key, value -> key . '=' . value})->values()->join(' ')

  if l:attr_str == ''
    return
  endif

  let s:highlights[a:group] =
    \ s:highlights[a:group] . ' ' .
    \ l:attr_str
endfunction

function! s:hi_gui(group, gui, guifg, guibg, guisp)
  let l:attrs = {}

  if a:gui != ''
    let l:attrs['gui'] = a:gui
  endif

  if a:guifg != ''
    let l:attrs['guifg'] = a:guifg
  endif

  if a:guibg != ''
    let l:attrs['guibg'] = a:guibg
  endif

  if a:guisp != ''
    let l:attrs['guisp'] = a:guisp
  endif

  call s:hi(a:group, l:attrs)
endfunction

function! s:set_highlights()
  for [l:group, l:attrs] in items(s:highlights)
    if l:attrs == ''
      continue
    endif
    exe 'hi ' . l:group . ' ' . l:attrs
  endfor
endfunction

" Color Palette
let s:black       = '#000000'
let s:gray1       = '#212121'
let s:gray2       = '#404040'
let s:gray3       = '#5d5d5d'
let s:gray4       = '#808080'
let s:gray5       = '#a3a3a3'
let s:gray6       = '#cfcfcf'
let s:white       = '#ffffff'

let s:dark_green  = '#18381f'
let s:green       = '#9ac96d'
let s:blue        = '#adacf2'
let s:light_blue  = '#7fccdb'
let s:purple      = '#efa4f5'
let s:dark_red    = '#361521'
let s:red         = '#f283ac'
let s:orange      = '#dea462'
let s:dark_yellow = '#383816'
let s:yellow      = '#9d9d32'

" Highlights
call s:hi_gui('Comment',    '',          s:gray4,      '',      '')
call s:hi_gui('Constant',   '',          s:green,      '',      '')
call s:hi_gui('Identifier', '',          s:light_blue, '',      '')
call s:hi_gui('Statement',  '',          s:blue,       '',      '')
call s:hi_gui('Preproc',    '',          s:blue,       '',      '')
call s:hi_gui('Type',       '',          s:blue,       '',      '')
call s:hi_gui('Special',    '',          s:purple,     '',      '')
call s:hi_gui('Underlined', 'underline', '',           '',      '')
call s:hi_gui('Ignore',     '',          '',           '',      '')
call s:hi_gui('Error',      'NONE',      s:red,        s:gray1, '')
call s:hi_gui('Todo',       'NONE',      s:orange,     s:gray1, '')

call s:hi_gui('ColorColumn',  '',          '',         s:black,       '')
call s:hi_gui('Cursor',       '',          s:black,    s:gray5,       '')
call s:hi_gui('CursorColumn', '',          '',         s:black,       '')
call s:hi_gui('CursorLine',   '',          '',         s:black,       '')
call s:hi_gui('Directory',    '',          s:blue,     '',            '')
call s:hi_gui('DiffAdd',      '',          '',         s:dark_green,  '')
call s:hi_gui('DiffChange',   'NONE',      '',         s:dark_yellow, '')
call s:hi_gui('DiffDelete',   '',          s:dark_red, s:dark_red,    '')
call s:hi_gui('DiffText',     'underline', '',         s:dark_yellow, s:white)
call s:hi_gui('EndOfBuffer',  '',          s:gray3,    '',            '')
call s:hi_gui('VertSplit',    '',          s:black,    s:black,       '')
call s:hi_gui('Folded',       '',          s:gray5,    s:black,       '')
call s:hi_gui('FoldColumn',   '',          s:gray4,    s:black,       '')
call s:hi_gui('SignColumn',   '',          '',         s:black,       '')
call s:hi_gui('LineNr',       '',          s:gray4,    s:black,       '')
call s:hi_gui('CursorLineNr', '',          s:gray6,    s:gray2,       '')
call s:hi_gui('MatchParen',   '',          s:black,    s:gray5,       '')
call s:hi_gui('Normal',       '',          s:gray6,    s:gray1,       '')
call s:hi_gui('Pmenu',        '',          s:gray6,    s:gray2,       '')
call s:hi_gui('PmenuSel',     '',          s:gray6,    s:black,       '')
call s:hi_gui('PmenuSbar',    '',          '',         s:gray4,       '')
call s:hi_gui('PmenuThumb',   '',          '',         s:black,       '')
call s:hi_gui('Question',     '',          s:green,    '',            '')
call s:hi_gui('QuickFixLine', 'underline', '',         '',            s:white)
call s:hi_gui('Search',       'NONE',      s:black,    s:yellow,      '')
call s:hi_gui('SpecialKey',   '',          s:gray4,    '',            '')
call s:hi_gui('SpellBad',     'underline', '',         '',            s:red)
call s:hi_gui('SpellCap',     'underline', '',         '',            s:yellow)
call s:hi_gui('SpellLocal',   'underline', '',         '',            s:green)
call s:hi_gui('SpellRare',    'underline', '',         '',            s:blue)
call s:hi_gui('StatusLine',   'NONE',      s:black,    s:gray5,       '')
call s:hi_gui('StatusLineNC', 'NONE',      s:black,    s:gray4,       '')
call s:hi_gui('TabLine',      'underline', s:gray6,    s:gray1,       '')
call s:hi_gui('TabLineSel',   'underline', s:black,    s:gray4,       '')
call s:hi_gui('Title',        '',          s:blue,     '',            '')
" call s:hi_gui('Visual',       'NONE',      s:black,    s:gray4,       '')
call s:hi_gui('Visual',       'NONE',      '',    s:gray2,       '')
call s:hi_gui('WarningMsg',   '',          s:orange,   '',            '')
call s:hi_gui('WildMenu',     '',          s:gray6,    s:black,       '')

" link
hi! link Conceal          Normal
hi! link lCursor          Cursor
hi! link CurSorIM         Cursor
hi! link ErrorMsg         Error
hi! link IncSearch        Search
hi! link LineNrAbove      LineNr
hi! link LineNrBelow      LineNr
hi! link ModeMsg          Normal
hi! link MoreMsg          Normal
hi! link NonText          EndOfBuffer
hi! link StatusLineTerm   StatusLine
hi! link StatusLineTermNC StatusLineNC
hi! link TabLineFill      TabLine
hi! link VisualNOS        Visual

call s:set_highlights()

" vim: set sw=2 ts=2 sts=2 et :
