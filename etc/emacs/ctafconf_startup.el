;;
;; startup.emacs for ctafconf in /home/ctaf/IBC/batail_s-ibc2
;;
;; Made by GESTES Cedric
;; Login   <ctaf42@gmail.com>
;;
;; Started on  Mon Jan 16 01:00:22 2006 GESTES Cedric
;; Last update Sat Mar 22 12:39:28 2008 GESTES Cedric
;;
(message ".")
(message "ctafconf loading: STARTUP.EMACS")

;; Change startup message...
(defcustom hinitial-scratch-message (purecopy "\
;; CTAFCONF Emacs (http://grk.sourceforce.net)
;; you could add: cedet, semantic, ecb, ilisp
;; in .ctafconf/etc/emacs/site-lisp
;;
;;===GLOBAL KEYBINDING===
;; [F1]         SHOW THIS HELP          [S-F1]          man
;; [C-F1]       describe function under cursor (need cedet)
;; [F2]         find in file            [S-F2]          find in each file
;; [F3]         query-replace           [S-F3]          replace-string
;; [C-F3]       list all occurence
;; [F4]         comment-region          [S-F4]          uncomment-region
;; [F5]         terminal                [S-F5]          speedbar
;; [F6]         togle bookmark          [S/C-F6]        next/prev bookmark
;; [F7]         next mark               [S-F7]          prev mark (made with C-space)
;; [F8]		Compile                 [S-F8]          debug
;; [F9]		next error              [S-F9]          previous error
;; [F10]        Hide/Show one block     [S-F10]         hide all block
;; [C-S-F10]    Show all block
;; [F11]	show ecb (code browser) [S-F11]         hide ecb (code browser)
;; [F12][A-Pup]	scroll-other-window     [S-F12][A-Pdown]scroll-other-window-down
;;
;;===FILE/BUFFER OPERATION===
;; - [c-x c-f] open one file
;;   when opening file [M-UP], [M-DOWN] move into the directory history
;;   when opening file [M-LEFT], [M-RIGHT] move up into the file history
;;   to get the standard open file [C-x C-f] then [C-f]
;;   (usefull to open new file with a name shorter than one already existing)
;; - [M-left]     previous buffer
;; - [M-right]       next buffer
;; - [C-TAB]      change window
;;
;;===MINIBUFFER===
;; when you do: M-x, C-x b, etc..
;; - C-n : next element in the history
;; - C-p : previous element in the history
;;
;;===EDITION===
;; - shift up/down begin a selection, backspace kill the selection, like a normal editor
;;   in fact selection works like in a normal editor
;; - M-x dos2unix	convert a Dos format to unix format
;; - C-return     Box-mode selection (square selection)
;; - M-s          Recall last kbd macro, 'C-x (' record, 'C-x )' stop recording
;; - M-l          Goto-line
;; - M-x goto-char
;; - C-_		undo
;; - C-c r	revert buffer
;; - M-y choose from previous copied string (browse kill-ring)
;; - home/end :
;;   - press 1 time: begin/end of the line
;;   - press 2 time: top/bottom of the window
;;   - press 3 time: begin/end of the buffer
;;
;;===PROGRAMMATION===
;; - m-x setnu-mode (toggle line number on the left)
;; - [S-SPC]      inline completion
;; - M-x setget to create {set,get}_var function (on the line)
;; - c-x 4 a :add one entry to the ChangeLog
;; - DOXYEMACS
;;   C-c d ? will look up documentation for the symbol under the point.
;;   C-c d r will rescan your Doxygen tags file.
;;   C-c d f will insert a Doxygen comment for the next function.
;;   C-c d i will insert a Doxygen comment for the current file.
;;   C-c d ; will insert a Doxygen comment for a member variable on the current line (like M-;).
;;   C-c d m will insert a blank multi-line Doxygen comment.
;;   C-c d s will insert a blank single-line Doxygen comment.
;;   -c d @ will insert grouping comments around the current region.
;;===EPITA===
;;   C-c h   update-std-header
;;   C-c C-d do_insert_time
;;   C-c C-h std-file-header

;;
;;===DEBUG(S-F8)/COMPILATION(F8)===
;; - c-up / c-down in gdb cycle through history
;; - c-x SPC to set a break point in a source file
;; - c-c c-c to send a INT signal (a simple c-c in fact)

;; - c-x c-a c-n NEXT
;; - c-x c-a c-s STEP
;; - c-x c-a c-u UNTIL
;; - c-x c-a c-j JUMP
;; - c-x c-a c-l display the current line in the source code
;; - c-x c-a c-p print the value of the variable under the cursor

;;
;;===TERMINAL(F5)===
;; - c-c c-j line mode
;; - c-c c-k char mode
;; - c-c c-c control-c in a term (interrupt)
;;
;;===COLOR THEME===
;; - m-x load-library RET color-theme RET
;; - m-x color-theme-select (change color theme for the session)
;;   use d for description, i for install the theme for the rest of the session
;;   theme I like: comedia,  white on black, cheap golden road, ramamgalahy (email underlined)
;;   taminmanderson
;;
;;===ELISP PROGRAMMING/DEBUGGING===
;; - c-x c-e :evaluate elisp expression
;; emacs --debug-init
;; emacs -Q (load an empty emacs without using config file)
;; - learn one key:
;;   M-x global-set-key
;;   C-x ESC ESC (affiche la commande precedente nikel chrome)
;; IN THE ELISP DEBUGGER:
;; - q : quit emacs backtrace (when debugging lisp)
;; - e : evaluate an expression
;; - d : step through code one step at a time
;; - c : continue the computation
;;
;;
;; === TODO ===
;;  - copy doesnt work in some case in console (disable cua?)
;;  - html/dtd/php
;;  - re-enable saveplace
;;  - shortcut: kill one line
;;  - kill char from cur to begin
;;  - c/c++ mode (epita indentation)
;;  - kill space til one word
;;  - truncate line
;;  - working directory for gdb/compile
;;  - kill-word, kill-ring,..
;;  - debug / show debug windows
;;  - svn
;;  - dired colored
;;  - man page size
;;  - php-mode/html/css
;;  - emacs: in console (ctrl+backspace, disable ring bell) (enable vt102 in xterm,..)
;;  - emacs: ctrl-qqch => replace the current line , with the current buffer
;;  - support compile this conf 'emacs -batch -l ~/.config/ctafconf/etc/emacs/compile_conf.el'
;;  - ilisp don't work on emacs-snapshot
;;  - turn on semantic-tag-decoration-on-protected-member, semantic-tag-decoration-on-private-member
;;  - folding: use semantic-folding if available, else outline, or hideshow
;;
") "Initial message displayed in *scratch* buffer at startup.
If this is nil, no message will be displayed."
  :type 'string)

(defun ctafconf-help ()
  (with-current-buffer (get-buffer "*scratch*")
    (erase-buffer)
    (when hinitial-scratch-message
      (insert hinitial-scratch-message))
    (set-buffer-modified-p nil)))

(ctafconf-help)