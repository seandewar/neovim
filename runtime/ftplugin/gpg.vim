" Vim filetype plugin file
" Language:             gpg(1) configuration file
" Previous Maintainer:  Nikolai Weibull <now@bitwi.se>
" Latest Revision:      2008-07-09

if exists("b:did_ftplugin")
  finish
endif
let b:did_ftplugin = 1

let s:cpo_save = &cpo
set cpo&vim

let b:undo_ftplugin = "setl com< cms< fo<"

setlocal comments=:# commentstring=#\ %s formatoptions-=t formatoptions+=croql

if has('unix') && executable('less')
  " Nvim's :! is not interactive.
  " if !has('gui_running')
  "   command -buffer -nargs=1 Sman
  "         \ silent exe '!' . 'LESS= MANPAGER="less --pattern=''^\s+--' . <q-args> . '\b'' --hilite-search" man ' . 'gpg' |
  "         \ redraw!
  " elseif has('terminal')
    command -buffer -nargs=1 Sman
          "\ Nvim's :terminal doesn't split or enter terminal mode by default.
          \ split | startinsert |
          \ silent exe ':term ' . 'env LESS= MANPAGER="less --pattern=''' . escape('^\s+--' . <q-args> . '\b', '\') . ''' --hilite-search" man ' . 'gpg'
  " endif
  if exists(':Sman') == 2
    setlocal iskeyword+=-
    setlocal keywordprg=:Sman
    let b:undo_ftplugin .= '| setlocal keywordprg< iskeyword<'
  endif
endif

let &cpo = s:cpo_save
unlet s:cpo_save

