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
let s:gray1_gui       = '#212121'
let s:gray2_gui       = '#404040'
let s:gray4_gui       = '#808080'
let s:gray5_gui       = '#a3a3a3'
let s:gray6_gui       = '#cfcfcf'

let s:dark_green_gui  = '#18381f'
let s:green_gui       = '#9ac96d'
let s:blue_gui        = '#b0bbf5'
let s:light_blue_gui  = '#84dbd3'
let s:purple_gui      = '#e090db'
let s:dark_red_gui    = '#361521'
let s:red_gui         = '#fa787c'
let s:orange_gui      = '#dea462'
let s:dark_yellow_gui = '#383816'
let s:yellow_gui      = '#7f821f'

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
call s:hi_gui('TabLine',      'underline', s:gray6_gui,    s:gray1_gui,       '')
call s:hi_gui('TabLineSel',   'underline', s:black_gui,    s:gray4_gui,       '')
call s:hi_gui('Title',        '',          s:blue_gui,     '',                '')
call s:hi_gui('Visual',       'NONE',      '',             s:gray2_gui,       '')
call s:hi_gui('WarningMsg',   '',          s:orange_gui,   '',                '')
call s:hi_gui('WildMenu',     '',          s:gray6_gui,    s:black_gui,       '')

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

call s:set_highlights()

" vim: set sw=2 ts=2 sts=2 et :
