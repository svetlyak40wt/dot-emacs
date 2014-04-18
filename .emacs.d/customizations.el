(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(fill-column 1000)
 '(org-agenda-custom-commands (quote (("d" todo "DELEGATED" nil) ("c" todo "DONE|DEFERRED|CANCELLED" nil) ("w" todo "WAITING" nil) ("W" agenda "" ((org-agenda-ndays 21))) ("A" agenda "" ((org-agenda-skip-function (lambda nil (org-agenda-skip-entry-if (quote notregexp) "\\=.*\\[#A\\]"))) (org-agenda-ndays 1) (org-agenda-overriding-header "Today's Priority #A tasks: "))) ("u" alltodo "" ((org-agenda-skip-function (lambda nil (org-agenda-skip-entry-if (quote scheduled) (quote deadline) (quote regexp) "
]+>"))) (org-agenda-overriding-header "Unscheduled TODO entries: "))))))
 '(org-agenda-files (quote ("~/txt/auto-jimny.org" "~/txt/areas/sobaka.org" "~/txt/areas/opensource.org" "~/txt/areas/dom.org" "~/txt/areas/yandex.org" "~/txt/projects/pizzbook.org" "~/txt/projects/certificator.org" "~/txt/projects/upravlyator.org" "~/txt/todo.org" "/Users/art/txt/projects/allmychanges.org" "/Users/art/txt/projects/deploy.org")))
 '(org-agenda-ndays 7)
 '(org-agenda-show-all-dates t)
 '(org-agenda-skip-deadline-if-done t)
 '(org-agenda-skip-scheduled-if-done nil)
 '(org-agenda-start-on-weekday nil)
 '(org-agenda-window-setup (quote current-window))
 '(org-deadline-warning-days 14)
 '(org-default-notes-file "~/txt/notes.org")
 '(org-enforce-todo-dependencies t)
 '(org-fast-tag-selection-single-key (quote expert))
 '(org-remember-store-without-prompt t)
 '(org-remember-templates (quote (("" 116 "* TODO %?
  %u" "~/txt/todo.org" "INBOX" nil))))
 '(org-reverse-note-order t)
 '(remember-annotation-functions (quote (org-remember-annotation)))
 '(remember-handler-functions (quote (org-remember-handler))))


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-done ((t (:foreground "brightcyan"))))
 '(org-scheduled ((t (:foreground "color-28"))))
 '(org-scheduled-today ((t (:foreground "color-28"))))
 '(show-paren-match ((t (:background "#e56545" :foreground "#00cdcd" :inverse-video nil :underline nil :slant normal :weight bold))) nil "подсвечиваем скобочки красненьким, чтобы можно было нормально Lisp код редактировать"))
