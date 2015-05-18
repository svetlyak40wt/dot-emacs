(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(fill-column 1000)
 '(menu-bar-mode nil)
 '(org-agenda-custom-commands (quote (("d" todo "DELEGATED" nil) ("c" todo "DONE|DEFERRED|CANCELLED" nil) ("w" todo "WAITING" nil) ("W" agenda "" ((org-agenda-ndays 21))) ("A" agenda "" ((org-agenda-skip-function (lambda nil (org-agenda-skip-entry-if (quote notregexp) "\\=.*\\[#A\\]"))) (org-agenda-ndays 1) (org-agenda-overriding-header "Today's Priority #A tasks: "))) ("u" alltodo "" ((org-agenda-skip-function (lambda nil (org-agenda-skip-entry-if (quote scheduled) (quote deadline) (quote regexp) "
]+>"))) (org-agenda-overriding-header "Unscheduled TODO entries: "))) ("x" "Save to file" agenda "" ((org-agenda-prefix-format "") (org-agenda-ndays 1)) ("/Users/art/txt/agenda.html")))))
 '(org-agenda-files (quote ("~/txt/blog.org" "~/txt/notes/pdd/pdd.org" "~/txt/projects/saas.org" "~/txt/notes/marketing.org" "~/txt/notes/technology/development.org" "~/txt/notes/technology/devops.org" "~/txt/notes/technology/frontend.org" "~/txt/notes/auto/jimny.org" "~/txt/notes/auto/pajero.org" "~/txt/week.org" "~/txt/areas/education.org" "~/txt/areas/help-generator.org" "~/txt/areas/blog.org" "~/txt/areas/sobaka.org" "~/txt/areas/opensource.org" "~/txt/areas/dom.org" "~/txt/areas/yandex.org" "~/txt/projects/pizzbook.org" "~/txt/projects/certificator.org" "~/txt/projects/upravlyator.org" "~/txt/todo.org" "/Users/art/txt/projects/allmychanges.org" "/Users/art/txt/projects/deploy.org")))
 '(org-agenda-ndays 7)
 '(org-agenda-show-all-dates t)
 '(org-agenda-skip-deadline-if-done t)
 '(org-agenda-skip-scheduled-if-done nil)
 '(org-agenda-start-on-weekday nil)
 '(org-agenda-window-setup (quote current-window))
 '(org-capture-templates (quote (("t" "Add TODO item" entry (file+headline "~/txt/todo.org" "INBOX") "* TODO %?"))))
 '(org-columns-default-format "%70ITEM(Task) %15SCHEDULED %17Effort(Estimated Effort){:} %6CLOCKSUM")
 '(org-deadline-warning-days 14)
 '(org-default-notes-file "~/txt/notes.org")
 '(org-enforce-todo-dependencies t)
 '(org-fast-tag-selection-single-key (quote expert))
 '(org-habit-following-days 3)
 '(org-habit-graph-column 80)
 '(org-habit-preceding-days 21)
 '(org-log-refile (quote time))
 '(org-modules (quote (org-habit)))
 '(org-refile-targets (quote ((org-agenda-files :tag . "inbox"))))
 '(org-reverse-note-order t)
 '(org-sort-agenda-noeffort-is-high nil)
 '(send-mail-function (quote sendmail-send-it))
 '(show-paren-mode t)
 '(tool-bar-mode nil))


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#fcf4dc" :foreground "#52676f" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 180 :width normal :foundry "nil" :family "Menlo"))))
 '(org-agenda-done ((t (:foreground "brightcyan"))))
 '(org-scheduled ((t (:foreground "color-28"))))
 '(org-scheduled-today ((t (:foreground "color-28"))))
 '(show-paren-match ((t (:background "#e56545" :foreground "#00cdcd" :inverse-video nil :underline nil :slant normal :weight bold))) nil "подсвечиваем скобочки красненьким, чтобы можно было нормально Lisp код редактировать"))
