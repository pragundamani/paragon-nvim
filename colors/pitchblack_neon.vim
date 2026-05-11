"=============================================================================
" Name:        pitchblack_neon.vim
" Description: Neovim port of Zed's Pitchblack Neon theme
" Author:      paragon
"=============================================================================

hi clear
if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "pitchblack_neon"
set background=dark

" Base UI (from Zed Pitchblack Neon)
hi Normal           guifg=#EFFFFB guibg=#000000
hi NormalNC         guifg=#EFFFFB guibg=#000000
hi NonText          guifg=#1C5A52 guibg=#000000
hi EndOfBuffer      guifg=#1C5A52 guibg=#000000
hi LineNr           guifg=#2FAE9A guibg=#000000
hi LineNrSeparator  guifg=#1E3B37 guibg=#000000
hi CursorLine       guibg=#000000
hi CursorLineNr     guifg=#00FFD5 guibg=#000000 gui=bold
hi CursorColumn     guibg=#000000
hi SignColumn       guifg=#6FD7C8 guibg=#000000
hi ColorColumn      guibg=#000000
hi VertSplit        guifg=#2A2A2A guibg=#000000
hi WinSeparator     guifg=#2A2A2A guibg=#000000

hi StatusLine       guifg=#EFFFFB guibg=#000000
hi StatusLineNC     guifg=#6FD7C8 guibg=#000000
hi TabLine          guifg=#6FD7C8 guibg=#000000
hi TabLineSel       guifg=#EFFFFB guibg=#000000 gui=bold
hi TabLineFill      guibg=#000000

hi Title            guifg=#3535FF gui=bold
hi Visual           guifg=NONE guibg=#888888
hi VisualNOS        guifg=NONE guibg=#888888
" hi Visual           guifg=NONE guibg=#8080F0
" hi VisualNOS        guifg=NONE guibg=#8080F0
hi MatchParen       guifg=#EFFFFB guibg=#1E3B37 gui=bold

hi Pmenu            guifg=#EFFFFB guibg=#000000
hi PmenuSel         guifg=#EFFFFB guibg=#1A1A1A gui=bold
hi PmenuSbar        guibg=#000000
hi PmenuThumb       guibg=#3A3A3A

hi Folded           guifg=#6FD7C8 guibg=#000000
hi FoldColumn       guifg=#2FAE9A guibg=#000000
hi Conceal          guifg=#3AAE9C guibg=#000000
hi Directory        guifg=#00FFD5

hi NormalFloat      guifg=#EFFFFB guibg=#000000
hi FloatBorder      guifg=#2A2A2A guibg=#000000
hi FloatTitle       guifg=#3535FF guibg=#000000 gui=bold

" Syntax (mapped from Zed syntax scopes)
hi Comment          guifg=#39FF6A gui=italic
hi SpecialComment   guifg=#39FF6A gui=italic

hi Constant         guifg=#00FFD5
hi String           guifg=#00FFD5
hi Character        guifg=#00FFD5
hi Number           guifg=#00FFD5
hi Float            guifg=#00FFD5
hi Boolean          guifg=#00FFD5

hi Identifier       guifg=#6ED6FF
hi Function         guifg=#8900f1
hi Type             guifg=#5A6DFF
hi Structure        guifg=#5A6DFF
hi Typedef          guifg=#5A6DFF
hi StorageClass     guifg=#7A00FF

hi Statement        guifg=#FF9F1A
hi Conditional      guifg=#FF9F1A
hi Repeat           guifg=#FF9F1A
hi Label            guifg=#8E98FF
hi Operator         guifg=#FF9F1A
hi Keyword          guifg=#FF9F1A
hi Exception        guifg=#FF9F1A

hi PreProc          guifg=#6E98FF
hi Include          guifg=#6E98FF
hi Define           guifg=#6E98FF
hi Macro            guifg=#6E98FF
hi PreCondit        guifg=#6E98FF

hi Special          guifg=#6E98FF
hi SpecialChar      guifg=#66FFE8
hi Delimiter        guifg=#39FF14 gui=bold,underline
hi SemicolonHighlight guifg=#39FF14 guibg=NONE gui=bold cterm=bold
hi Underlined       guifg=#00FFD5 gui=underline
hi Todo             guifg=#6F8CFF guibg=NONE gui=bold

" Diagnostics / Search / Diff
hi Error            guifg=#FF3B3B guibg=NONE gui=bold
hi ErrorMsg         guifg=#FF3B3B guibg=NONE gui=bold
hi WarningMsg       guifg=#3535FF guibg=NONE

hi DiagnosticError            guifg=#FF3B3B guibg=NONE
hi DiagnosticWarn             guifg=#3535FF guibg=NONE
hi DiagnosticInfo             guifg=#6F80FF guibg=NONE
hi DiagnosticHint             guifg=#5CD9C5 guibg=NONE
hi DiagnosticOk               guifg=#00FFD5 guibg=NONE
hi DiagnosticUnderlineError   gui=undercurl guisp=#FF3B3B
hi DiagnosticUnderlineWarn    gui=undercurl guisp=#3535FF
hi DiagnosticUnderlineInfo    gui=undercurl guisp=#6F80FF
hi DiagnosticUnderlineHint    gui=undercurl guisp=#5CD9C5

hi Search           guifg=#EFFFFB guibg=#1A2754
hi IncSearch        guifg=#EFFFFB guibg=#3535FF gui=bold
hi CurSearch        guifg=#EFFFFB guibg=#3535FF gui=bold

hi DiffAdd          guifg=#00FFD5 guibg=#0A2A25
hi DiffChange       guifg=#3535FF guibg=#101A3A
hi DiffDelete       guifg=#FF3B3B guibg=#2A0A0A
hi DiffText         guifg=#EFFFFB guibg=#1A1A1A gui=bold

" Treesitter captures
hi @comment                     guifg=#39FF6A gui=italic
hi @comment.documentation       guifg=#39FF6A gui=italic

hi @string                      guifg=#00FFD5
hi @string.escape               guifg=#66FFE8
hi @string.regex                guifg=#66FFE8
hi @string.special              guifg=#66FFE8
hi @number                      guifg=#00FFD5
hi @boolean                     guifg=#00FFD5
hi @constant                    guifg=#00FFD5
hi @constant.builtin            guifg=#00FFD5

hi @function                    guifg=#8F00ff
hi @function.builtin            guifg=#8F00ff
hi @function.call               guifg=#8F00ff
hi @function.method             guifg=#8F00ff
hi @function.method.call        guifg=#8F00ff
hi @constructor                 guifg=#8F00ff

hi @variable                    guifg=#6ED6FF
hi @variable.parameter          guifg=#6ED6FF
hi @variable.member             guifg=#6ED6FF
hi @variable.special            guifg=#B04DFF
hi @property                    guifg=#6ED6FF

hi @type                        guifg=#5A6DFF
hi @type.builtin                guifg=#3535FF
hi @type.definition             guifg=#5A6DFF
hi @type.qualifier              guifg=#7A00FF

hi @keyword                     guifg=#FF9F1A
hi @keyword.control             guifg=#FF9F1A
hi @keyword.function            guifg=#FF9F1A
hi @keyword.return              guifg=#FF9F1A
hi @keyword.operator            guifg=#FF9F1A
hi @keyword.storage             guifg=#C44DFF
hi @keyword.storage.type        guifg=#C44DFF
hi @operator                    guifg=#FF9F1A

hi @attribute                   guifg=#6E98FF
hi @label                       guifg=#6E98FF
hi @tag                         guifg=#6E98FF
hi @tag.attribute               guifg=#6ED6FF

hi @punctuation                 guifg=#7FE2D2
hi @punctuation.bracket         guifg=#7FE2D2
hi @punctuation.delimiter       guifg=#39FF14 gui=bold,underline
hi @punctuation.delimiter.cpp   guifg=#39FF14 gui=bold,underline
hi @punctuation.special         guifg=#7FE2D2

hi @markup.strong               gui=bold
hi @markup.italic               gui=italic
hi @markup.link.url             guifg=#00FFD5 gui=underline
hi @markup.heading              guifg=#3535FF gui=bold

" Terminal ANSI colors (exact from Zed)
let g:terminal_ansi_colors = [
      \ '#000000', '#FF3B3B', '#00FFD5', '#3535FF',
      \ '#5A6DFF', '#8f00ff', '#00F5FF', '#EFFFFB',
      \ '#1E3B37', '#FF7A7A', '#5CFFE6', '#6F8CFF',
      \ '#6E98FF', '#B04DFF', '#8DFBFF', '#FFFFFF'
      \ ]
