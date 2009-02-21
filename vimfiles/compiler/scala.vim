" Vim Compiler File scalac.vim
" Compiler: Scalac

if exists("current_compiler")
  finish
endif
let current_compiler = "scalac"

setlocal makeprg=scalac\ #<.scala
setlocal errorformat=%f:%l:%m
" I'm not familiar with 'errorformat', so I set it very simple.
