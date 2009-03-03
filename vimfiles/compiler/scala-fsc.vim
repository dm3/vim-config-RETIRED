" Vim Compiler File scalac.vim
" Compiler: Scalac

if exists("current_compiler")
  finish
endif
let current_compiler = "scala-fsc"

if exists(":CompilerSet") != 2		" older Vim always used :setlocal
  command -nargs=* CompilerSet setlocal <args>
endif

execute "CompilerSet makeprg=cat\\ ". escape(g:current_project, ' ') . "\\target\\compile_errors"
setlocal errorformat=%f:%l:%m
