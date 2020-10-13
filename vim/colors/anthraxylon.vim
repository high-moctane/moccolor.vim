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

function! s:hi_cterm(group, cterm, ctermfg, ctermbg, ctermul)
  let l:attrs = {}

  if a:cterm != ''
    let l:attrs['cterm'] = a:cterm
  endif

  if a:ctermfg != ''
    let l:attrs['ctermfg'] = a:ctermfg
  endif

  if a:ctermbg != ''
    let l:attrs['ctermbg'] = a:ctermbg
  endif

  if a:ctermul != ''
    let l:attrs['ctermul'] = a:ctermul
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
let s:black_gui       = '#000000'
let s:gray1_gui       = '#262626'
let s:gray2_gui       = '#444444'
let s:gray4_gui       = '#808080'
let s:gray5_gui       = '#a8a8a8'
let s:gray6_gui       = '#d0d0d0'

let s:dark_green_gui  = '#005f00'
let s:green_gui       = '#87d787'
let s:blue_gui        = '#afafff'
let s:light_blue_gui  = '#87d7d7'
let s:purple_gui      = '#d787ff'
let s:dark_red_gui    = '#5f0000'
let s:red_gui         = '#ff8787'
let s:orange_gui      = '#d7af5f'
let s:dark_yellow_gui = '#5f5f00'
let s:yellow_gui      = '#878700'

let s:black_cterm       = '16'
let s:gray1_cterm       = '235'
let s:gray2_cterm       = '238'
let s:gray4_cterm       = '244'
let s:gray5_cterm       = '248'
let s:gray6_cterm       = '252'

let s:dark_green_cterm  = '22'
let s:green_cterm       = '114'
let s:blue_cterm        = '147'
let s:light_blue_cterm  = '116'
let s:purple_cterm      = '177'
let s:dark_red_cterm    = '52'
let s:red_cterm         = '210'
let s:orange_cterm      = '179'
let s:dark_yellow_cterm = '58'
let s:yellow_cterm      = '100'

" Highlights
call s:hi_gui('Comment',    '',          s:gray4_gui,      '',          '')
call s:hi_gui('Constant',   '',          s:green_gui,      '',          '')
call s:hi_gui('Identifier', '',          s:light_blue_gui, '',          '')
call s:hi_gui('Statement',  'NONE',      s:blue_gui,       '',          '')
call s:hi_gui('Preproc',    '',          s:blue_gui,       '',          '')
call s:hi_gui('Type',       'NONE',      s:blue_gui,       '',          '')
call s:hi_gui('Special',    '',          s:purple_gui,     '',          '')
call s:hi_gui('Underlined', 'underline', '',               '',          '')
call s:hi_gui('Ignore',     '',          '',               '',          '')
call s:hi_gui('Error',      'bold',      s:red_gui,        s:gray1_gui, '')
call s:hi_gui('Todo',       'bold',      s:orange_gui,     s:gray1_gui, '')

call s:hi_gui('ColorColumn',  '',          '',             s:black_gui,       '')
call s:hi_gui('Cursor',       '',          s:black_gui,    s:gray5_gui,       '')
call s:hi_gui('CursorColumn', '',          '',             s:black_gui,       '')
call s:hi_gui('CursorLine',   '',          '',             s:black_gui,       '')
call s:hi_gui('Directory',    '',          s:blue_gui,     '',                '')
call s:hi_gui('DiffAdd',      '',          '',             s:dark_green_gui,  '')
call s:hi_gui('DiffChange',   'NONE',      '',             s:dark_yellow_gui, '')
call s:hi_gui('DiffDelete',   '',          s:dark_red_gui, s:dark_red_gui,    '')
call s:hi_gui('DiffText',     'underline', '',             s:dark_yellow_gui, s:gray6_gui)
call s:hi_gui('EndOfBuffer',  '',          s:gray2_gui,    '',                '')
call s:hi_gui('VertSplit',    '',          s:black_gui,    s:black_gui,       '')
call s:hi_gui('Folded',       '',          s:gray5_gui,    s:black_gui,       '')
call s:hi_gui('FoldColumn',   '',          s:gray4_gui,    s:black_gui,       '')
call s:hi_gui('SignColumn',   '',          s:gray4_gui,    s:black_gui,       '')
call s:hi_gui('LineNr',       '',          s:gray4_gui,    s:black_gui,       '')
call s:hi_gui('CursorLineNr', '',          s:gray6_gui,    s:gray2_gui,       '')
call s:hi_gui('MatchParen',   '',          s:black_gui,    s:gray5_gui,       '')
call s:hi_gui('Normal',       '',          s:gray6_gui,    s:gray1_gui,       '')
call s:hi_gui('Pmenu',        '',          s:gray6_gui,    s:gray2_gui,       '')
call s:hi_gui('PmenuSel',     '',          s:gray6_gui,    s:black_gui,       '')
call s:hi_gui('PmenuSbar',    '',          '',             s:gray4_gui,       '')
call s:hi_gui('PmenuThumb',   '',          '',             s:black_gui,       '')
call s:hi_gui('Question',     '',          s:green_gui,    '',                '')
call s:hi_gui('QuickFixLine', 'underline', '',             '',                s:gray6_gui)
call s:hi_gui('Search',       'NONE',      s:black_gui,    s:yellow_gui,      '')
call s:hi_gui('SpecialKey',   '',          s:gray4_gui,    '',                '')
call s:hi_gui('SpellBad',     'underline', '',             '',                s:red_gui)
call s:hi_gui('SpellCap',     'underline', '',             '',                s:yellow_gui)
call s:hi_gui('SpellLocal',   'underline', '',             '',                s:green_gui)
call s:hi_gui('SpellRare',    'underline', '',             '',                s:blue_gui)
call s:hi_gui('StatusLine',   'NONE',      s:black_gui,    s:gray5_gui,       '')
call s:hi_gui('StatusLineNC', 'NONE',      s:black_gui,    s:gray4_gui,       '')
call s:hi_gui('TabLine',      'NONE',      s:gray6_gui,    s:gray2_gui,       '')
call s:hi_gui('TabLineSel',   'NONE',      s:black_gui,    s:gray5_gui,       '')
call s:hi_gui('Title',        '',          s:blue_gui,     '',                '')
call s:hi_gui('Visual',       'NONE',      '',             s:gray2_gui,       '')
call s:hi_gui('WarningMsg',   '',          s:orange_gui,   '',                '')
call s:hi_gui('WildMenu',     '',          s:gray6_gui,    s:black_gui,       '')

" cterm
call s:hi_cterm('Comment',    '',          s:gray4_cterm,      '',            '')
call s:hi_cterm('Constant',   '',          s:green_cterm,      '',            '')
call s:hi_cterm('Identifier', 'NONE',      s:light_blue_cterm, '',            '')
call s:hi_cterm('Statement',  'NONE',      s:blue_cterm,       '',            '')
call s:hi_cterm('Preproc',    '',          s:blue_cterm,       '',            '')
call s:hi_cterm('Type',       'NONE',      s:blue_cterm,       '',            '')
call s:hi_cterm('Special',    '',          s:purple_cterm,     '',            '')
call s:hi_cterm('Underlined', 'underline', '',                 '',            '')
call s:hi_cterm('Ignore',     '',          '',                 '',            '')
call s:hi_cterm('Error',      'bold',      s:red_cterm,        s:gray1_cterm, '')
call s:hi_cterm('Todo',       'bold',      s:orange_cterm,     s:gray1_cterm, '')

call s:hi_cterm('ColorColumn',  '',          '',               s:black_cterm,       '')
call s:hi_cterm('Cursor',       '',          s:black_cterm,    s:gray5_cterm,       '')
call s:hi_cterm('CursorColumn', '',          '',               s:black_cterm,       '')
call s:hi_cterm('CursorLine',   'NONE',      '',               s:black_cterm,       '')
call s:hi_cterm('Directory',    '',          s:blue_cterm,     '',                  '')
call s:hi_cterm('DiffAdd',      '',          '',               s:dark_green_cterm,  '')
call s:hi_cterm('DiffChange',   'NONE',      '',               s:dark_yellow_cterm, '')
call s:hi_cterm('DiffDelete',   '',          s:dark_red_cterm, s:dark_red_cterm,    '')
call s:hi_cterm('DiffText',     'underline', '',               s:dark_yellow_cterm, s:gray6_cterm)
call s:hi_cterm('EndOfBuffer',  '',          s:gray2_cterm,    '',                  '')
call s:hi_cterm('VertSplit',    '',          s:black_cterm,    s:black_cterm,       '')
call s:hi_cterm('Folded',       '',          s:gray5_cterm,    s:black_cterm,       '')
call s:hi_cterm('FoldColumn',   '',          s:gray4_cterm,    s:black_cterm,       '')
call s:hi_cterm('SignColumn',   '',          s:gray4_cterm,    s:black_cterm,       '')
call s:hi_cterm('LineNr',       '',          s:gray4_cterm,    s:black_cterm,       '')
call s:hi_cterm('CursorLineNr', 'NONE',      s:gray6_cterm,    s:gray2_cterm,       '')
call s:hi_cterm('MatchParen',   '',          s:black_cterm,    s:gray5_cterm,       '')
call s:hi_cterm('Normal',       '',          s:gray6_cterm,    s:gray1_cterm,       '')
call s:hi_cterm('Pmenu',        '',          s:gray6_cterm,    s:gray2_cterm,       '')
call s:hi_cterm('PmenuSel',     '',          s:gray6_cterm,    s:black_cterm,       '')
call s:hi_cterm('PmenuSbar',    '',          '',               s:gray4_cterm,       '')
call s:hi_cterm('PmenuThumb',   '',          '',               s:black_cterm,       '')
call s:hi_cterm('Question',     '',          s:green_cterm,    '',                  '')
call s:hi_cterm('QuickFixLine', 'underline', '',               '',                  s:gray6_cterm)
call s:hi_cterm('Search',       'NONE',      s:black_cterm,    s:yellow_cterm,      '')
call s:hi_cterm('SpecialKey',   '',          s:gray4_cterm,    '',                  '')
call s:hi_cterm('SpellBad',     'underline', '',               s:gray1_cterm,       s:red_cterm)
call s:hi_cterm('SpellCap',     'underline', '',               s:gray1_cterm,       s:yellow_cterm)
call s:hi_cterm('SpellLocal',   'underline', '',               s:gray1_cterm,       s:green_cterm)
call s:hi_cterm('SpellRare',    'underline', '',               s:gray1_cterm,       s:blue_cterm)
call s:hi_cterm('StatusLine',   'NONE',      s:black_cterm,    s:gray5_cterm,       '')
call s:hi_cterm('StatusLineNC', 'NONE',      s:black_cterm,    s:gray4_cterm,       '')
call s:hi_cterm('TabLine',      'NONE',      s:gray6_cterm,    s:gray1_cterm,       '')
call s:hi_cterm('TabLineSel',   'NONE',      s:gray1_cterm,    s:gray5_cterm,       '')
call s:hi_cterm('Title',        '',          s:blue_cterm,     '',                  '')
call s:hi_cterm('Visual',       'NONE',      '',               s:gray2_cterm,       '')
call s:hi_cterm('WarningMsg',   '',          s:orange_cterm,   '',                  '')
call s:hi_cterm('WildMenu',     '',          s:gray6_cterm,    s:black_cterm,       '')

" link
hi! link Conceal          Normal
hi! link Delimiter        Normal
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

set background=dark
call s:set_highlights()


" vim: set sw=2 ts=2 sts=2 et :
