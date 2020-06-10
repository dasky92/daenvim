" pymode plugin settings

" ==> common

"let g:pymode = 1
"let g:pymode_warnings = 1
"let g:pymode_trim_whitespaces = 1

"let g:pymode_options = 1
let g:pymode_options_max_line_length = 100

" ==> python motion
" ====  ============================
" Key   Command
" ====  ============================
" [[    Jump to previous class or function (normal, visual, operator modes)
" ]]    Jump to next class or function  (normal, visual, operator modes)
" [M    Jump to previous class or method (normal, visual, operator modes)
" ]M    Jump to next class or method (normal, visual, operator modes)
" aC    Select a class. Ex: vaC, daC, yaC, caC (normal, operator modes)
" iC    Select inner class. Ex: viC, diC, yiC, ciC (normal, operator modes)
" aM    Select a function or method. Ex: vaM, daM, yaM, caM (normal, operator modes)
" iM    Select inner function or method. Ex: viM, diM, yiM, ciM (normal, operator modes)
" ====  ============================

"let g:pymode_motion = 1

" ==> pydoc
"let g:pymode_doc = 1
" default 'K'
let g:pymode_doc_bind = ',k'


" ==> virtualenv

"let g:pymode_virtualenv = 1
"let g:pymode_virtualenv_path = $VIRTUAL_ENV


" ==> run

"let g:pymode_run = 1
"let g:pymode_run_bind = '<leader>r'


" ==> breakpoint

"let g:pymode_breakpoint = 1
"let g:pymode_breakpoint_bind = '<leader>b'


" ==> code check

"let g:pymode_lint = 1
" check code on every save (if file has been modified)
"let g:pymode_lint_on_write = 1
"let g:pymode_lint_unmodified = 0
" check code when editing (on the fly)
"let g:pymode_lint_on_fly = 0

" show error message if cursor placed at the error line
"let g:pymode_lint_message = 1

" code checker: pyflakes, pep8, mccabe, pylint, pep257,...
" but you need install them by 'pip install []'
"let g:pymode_lint_checkers = [ 'pyflakes', 'pep8', 'mccabe' ]

" ignore check, "W", "E2"(Skip all Warnings and error starting with E2)
"let g:pymode_lint_ignore = ["E501", "W"]
" 
"let g:pymode_lint_select = ["W0011", "W430"]


" ==>TODO:code checker options


" ==> Rope support for refactoring operations

let g:pymode_rope = 0

" default '<C-c>d'
let g:pymode_rope_show_doc_bind = ',c'



" ==> Find definition
" default '<C-c>g'
let g:pymode_rope_goto_definition_bind = ',g'



" ==> Refactoring

" keymap for rename method/function/class/variables under curosr
"let g:pymode_rope_rename_bind = '<C-c>rr'

" rename module/package
"let g:pymode_rope_rename_module_bind = '<C-c>rlr'

" organize imports sorts imports,too. It does that according to PEP8. Unsed
" imports will be dropped.
" default '<C-c>ro'
let g:pymode_rope_organize_imports_bind = '<C-i>'


" auto import under cursor
" default 0
"let g:pymode_rope_autoimport = 1
"let g:pymode_rope_autoimport_bind = '<C-c>ra'

" Extract method/variable
"let g:pymode_rope_extract_method_bind = '<C-c>rm'
"let g:pymode_rope_extract_variable_bind = '<C-c>rl'
" Move method/fields
"let g:pymode_rope_move_bind = '<C-c>rv'
" Change function signature
"let g:pymode_rope_change_signature_bind = '<C-c>rs'



" ==> Undo/Redo Changes
" ==> Syntax

let g:pymode_syntax = 1
let g:pymode_syntax_print_as_function = 1


" ===========> autopep8 fixes the following issues reported by pycodestyle
" E101 - Reindent all lines.
" E11  - Fix indentation.
" E121 - Fix indentation to be a multiple of four.
" E122 - Add absent indentation for hanging indentation.
" E123 - Align closing bracket to match opening bracket.
" E124 - Align closing bracket to match visual indentation.
" E125 - Indent to distinguish line from next logical line.
" E126 - Fix over-indented hanging indentation.
" E127 - Fix visual indentation.
" E128 - Fix visual indentation.
" E129 - Fix visual indentation.
" E131 - Fix hanging indent for unaligned continuation line.
" E133 - Fix missing indentation for closing bracket.
" E20  - Remove extraneous whitespace.
" E211 - Remove extraneous whitespace.
" E22  - Fix extraneous whitespace around keywords.
" E224 - Remove extraneous whitespace around operator.
" E225 - Fix missing whitespace around operator.
" E226 - Fix missing whitespace around arithmetic operator.
" E227 - Fix missing whitespace around bitwise/shift operator.
" E228 - Fix missing whitespace around modulo operator.
" E231 - Add missing whitespace.
" E241 - Fix extraneous whitespace around keywords.
" E242 - Remove extraneous whitespace around operator.
" E251 - Remove whitespace around parameter '=' sign.
" E252 - Missing whitespace around parameter equals.
" E26  - Fix spacing after comment hash for inline comments.
" E265 - Fix spacing after comment hash for block comments.
" E266 - Fix too many leading '#' for block comments.
" E27  - Fix extraneous whitespace around keywords.
" E301 - Add missing blank line.
" E302 - Add missing 2 blank lines.
" E303 - Remove extra blank lines.
" E304 - Remove blank line following function decorator.
" E305 - Expected 2 blank lines after end of function or class.
" E306 - Expected 1 blank line before a nested definition.
" E401 - Put imports on separate lines.
" E402 - Fix module level import not at top of file
" E501 - Try to make lines fit within --max-line-length characters.
" E502 - Remove extraneous escape of newline.
" E701 - Put colon-separated compound statement on separate lines.
" E70  - Put semicolon-separated compound statement on separate lines.
" E711 - Fix comparison with None.
" E712 - Fix comparison with boolean.
" E713 - Use 'not in' for test for membership.
" E714 - Use 'is not' test for object identity.
" E721 - Use "isinstance()" instead of comparing types directly.
" E722 - Fix bare except.
" E731 - Use a def when use do not assign a lambda expression.
" W291 - Remove trailing whitespace.
" W292 - Add a single newline at the end of the file.
" W293 - Remove trailing whitespace on blank line.
" W391 - Remove trailing blank lines.
" W503 - Fix line break before binary operator.
" W504 - Fix line break after binary operator.
" W601 - Use "in" rather than "has_key()".
" W602 - Fix deprecated form of raising exception.
" W603 - Use "!=" instead of "<>"
" W604 - Use "repr()" instead of backticks.
" W605 - Fix invalid escape sequence 'x'.
" W690 - Fix various deprecated code (via lib2to3).
