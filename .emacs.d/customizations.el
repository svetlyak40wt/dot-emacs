(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(bitly-access-token "0205a8217856bf0e500fc3ea615219d76dc76f2b")
 '(calendar-week-start-day 1)
 '(custom-safe-themes
   '("c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" "a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" "e87a2bd5abc8448f8676365692e908b709b93f2d3869c42a4371223aab7d9cf8" default))
 '(elfeed-feeds
   '("http://feeds.feedburner.com/40-wt-firefly/all-posts" "http://svetlyak.ru" "https://www.upwork.com/jobs/rss?cn1[]=IT+%26+Networking&cn2[]=Network+%26+System+Administration&t[]=0&t[]=1&dur[]=0&dur[]=1&dur[]=13&dur[]=26&dur[]=none&wl[]=10&wl[]=30&wl[]=none&tba[]=0&tba[]=1-9&tba[]=10-&exp[]=1&exp[]=2&exp[]=3&amount[]=Min&amount[]=Max&q=docker&sortBy=s_ctime+desc"))
 '(fill-column 1000)
 '(google-translate-default-source-language "en")
 '(google-translate-default-target-language "ru")
 '(graphviz-dot-dot-program "/usr/local/bin/dot")
 '(htmlize-output-type 'inline-css)
 '(json-reformat:pretty-string\? t)
 '(markdown-command "/usr/local/bin/markdown")
 '(menu-bar-mode nil)
 '(ns-alternate-modifier 'meta)
 '(org-agenda-custom-commands
   '(("d" todo "DELEGATED" nil)
     ("c" todo "DONE|DEFERRED|CANCELLED" nil)
     ("w" todo "WAITING" nil)
     ("W" agenda ""
      ((org-agenda-ndays 21)))
     ("A" agenda ""
      ((org-agenda-skip-function
        (lambda nil
          (org-agenda-skip-entry-if 'notregexp "\\=.*\\[#A\\]")))
       (org-agenda-ndays 1)
       (org-agenda-overriding-header "Today's Priority #A tasks: ")))
     ("u" alltodo ""
      ((org-agenda-skip-function
        (lambda nil
          (org-agenda-skip-entry-if 'scheduled 'deadline 'regexp "
]+>")))
       (org-agenda-overriding-header "Unscheduled TODO entries: ")))
     ("x" "Save to file" agenda ""
      ((org-agenda-prefix-format "")
       (org-agenda-ndays 1))
      ("/Users/art/txt/agenda.html"))))
 '(org-agenda-files '("/Users/art/txt/goals.org"))
 '(org-agenda-ndays 7)
 '(org-agenda-prefix-format
   '((agenda . " %i %-12:c%?-12t% s")
     (timeline . "  % s")
     (todo . " %i %-12:c")
     (tags . " %i %-12:c")
     (search . " %i %-12:c")))
 '(org-agenda-show-all-dates t)
 '(org-agenda-skip-deadline-if-done t)
 '(org-agenda-skip-scheduled-if-done nil)
 '(org-agenda-sort-noeffort-is-high nil)
 '(org-agenda-start-on-weekday nil)
 '(org-agenda-window-setup 'current-window)
 '(org-capture-templates
   '(("t" "Add TODO item" entry
      (file+headline "~/txt/inbox.org" "INBOX")
      "* TODO %?")))
 '(org-columns-default-format
   "%70ITEM(Task) %15SCHEDULED %17Effort(Estimated Effort){:} %6CLOCKSUM")
 '(org-deadline-warning-days 14)
 '(org-default-notes-file "~/txt/notes.org")
 '(org-enforce-todo-dependencies t)
 '(org-fast-tag-selection-single-key 'expert)
 '(org-habit-following-days 3)
 '(org-habit-graph-column 80)
 '(org-habit-preceding-days 21)
 '(org-log-refile 'time)
 '(org-modules '(org-habit))
 '(org-refile-targets '((org-agenda-files :tag . "inbox")))
 '(org-reverse-note-order nil)
 '(org-sort-agenda-noeffort-is-high nil)
 '(package-selected-packages
   '(telega tide typescript-mode deft undo-tree forge magit-forge sly-package-inferred diffview sly-docker sly-tramp sly-repl-ansi-color sly-macrostep sly-named-readtables org-roam poly-markdown polymode poly-org org-drill org-bullets fzf org-super-agenda org-randomnote realgud-ipdb ipython-shell-send flycheck-pycheckers ox-pandoc flycheck-julia julia-mode julia-repl helm-ag perspective foo yas pony-mode django-mode ace-jump-mode ag airline-themes auto-complete better-defaults bitly bm color-theme-active color-theme-emacs-revert-theme color-theme-github color-theme-solarized color-theme-tango color-theme-wombat column-enforce-mode common-lisp-snippets corral docker-tramp ecb ein elfeed elpy emmet-mode expand-region f feature-mode flymake-cursor flymake-python-pyflakes fuzzy git-blame go-mode google-translate goto-chg goto-last-change graphviz-dot-mode helm-company helm-projectile helm-swoop html-to-markdown htmlize hy-mode hyperbole idomenu iedit init-loader iy-go-to-char jinja2-mode js2-refactor json-mode json-reformat jsx-mode keyfreq langtool layout-restore lispy list-utils magit markdown-mode minimap mo-git-blame nose ob-http olivetti org-caldav org-mobile-sync org-trello ox-rst ox-yawiki pandoc-mode paredit parinfer persp-mode popwin rainbow-delimiters realgud relative-line-numbers restclient skewer-mode slime-company sly smart-mode-line sotlisp spaceline tern-auto-complete w3 web-mode wgrep-helm which-key writeroom-mode xah-fly-keys yaml-mode yawiki-mode))
 '(pyvenv-activate nil)
 '(safe-local-variable-values '((encoding . utf-8) (Package . CCL)))
 '(send-mail-function 'sendmail-send-it)
 '(show-paren-mode t)
 '(tool-bar-mode nil))


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 200 :width normal :foundry "nil" :family "PragmataPro"))))
 '(org-agenda-done ((t (:foreground "brightcyan"))))
 '(org-default ((t (:family "PragmataPro Mono"))))
 '(org-hide ((t (:foreground "#fcf4dc" :family "PragmataPro Mono"))))
 '(org-scheduled ((t (:foreground "color-28"))))
 '(org-scheduled-today ((t (:foreground "color-28"))))
 '(outline-3 ((t (:foreground "#b58900"))))
 '(show-paren-match ((t (:background "#e56545" :foreground "#00cdcd" :inverse-video nil :underline nil :slant normal :weight bold))) nil "подсвечиваем скобочки красненьким, чтобы можно было нормально Lisp код редактировать"))
