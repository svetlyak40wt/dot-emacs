;;; from http://newartisans.com/2007/08/using-org-mode-as-a-day-planner/
;;; Описание хуков: http://orgmode.org/tmp/worg/org-configs/org-hooks.html

(require 'async)

(define-key mode-specific-map [?a] 'org-agenda)


(defun update-org-agenda-files ()
  ;; (add-to-list 'org-agenda-files buffer-file-name)
  )


(defun set-org-agenda-files ()
  "Goes recursively through org-directory and adds
all tasks.org files into the list."
  (require 'f)
  (require 's)


  (setq org-agenda-files (list "~/txt/goals.org"))

  ;; (setq org-agenda-files
  ;;       (f-entries org-directory
  ;;                  (lambda (filename)
  ;;                    (s-ends-with-p "/tasks.org" filename))
  ;;                  t))
  )


(defun 40wt-configure-org-mode-buffer-hook ()
  (let ((filename (buffer-file-name)))
    (if (s-ends-with-p "/tasks.org" filename)
        (add-hook 'after-save-hook 'update-org-agenda-files t t))

    (when (and (file-exists-p "~/.org-feed")
               ;; will run inbox update only if inbox.org was opened
               ;; I do this only in one Emacs instance
               (s-ends-with-p "/txt/inbox.org" filename))
      
      (message "Configuring a timer to update ~/txt/inbox.org")
      
      (load "~/.org-feed")
      (setq org-feed-alist
            (list (list "TODO Rss Input"
                        org-inbox-rss-feed
                        "~/txt/inbox.org" "INBOX")))
      
      ;; update inbox every 15 minutes
      (run-with-idle-timer (* 15 60) 1 'org-feed-update-all))


    ;; Set text width and auto-wrapping if you wish. Personally I'm don't like it
    ;; (setq-local fill-column 72)
    ;; (auto-fill-mode 1)
    ))


(defun 40wt-configure-org-mode-agenda-buffer-hook ()
  (define-key org-agenda-mode-map "1" '40wt/next-week)
  (define-key org-agenda-mode-map "2" '40wt/clone-schedule))


;; Чтобы экспорт из Org-mode в HTML работал
(use-package htmlize
    :ensure t)

(setf org-publish-project-alist
      '(("svetlyak"
         :components ("pages" "blog"))
        ("pages"
         :base-directory "~/txt/svetlyak/"
         :publishing-directory "~/tmp/svetlyak/"
         :publishing-function org-html-publish-to-html
         :html-validation-link nil
         :section-numbers nil
         :with-author nil
         :with-toc nil
         )
        ("blog"
         :base-directory "~/txt/svetlyak/blog/"
         :publishing-directory "~/tmp/svetlyak/blog/"
         :publishing-function org-html-publish-to-html
         :html-validation-link nil
         :section-numbers nil
         :with-author nil
         :with-toc nil)))


(defun 40wt-init-org-mode ()
  (message "ORG mode loaded, running setup code from 40wt-org.el")
  
  ;; делаем так, чтобы в саджесте по файлам не появлялись архивные org-mode файлы
  (when (boundp 'ido-ignore-files)
    (cl-pushnew "\\.org_archive" ido-ignore-files))

  ;; настраиваем ширину текста и включаем автоперенос
  (setq-local fill-column 72)
  (auto-fill-mode t)

  ;; http://orgmode.org/manual/Fast-access-to-TODO-states.html#Fast-access-to-TODO-states
  ;; https://orgmode.org/guide/Multi_002dstate-workflows.html
  (setq org-todo-keywords
        '((sequence "TODO(t)" "STARTED(s!)" "WAITING(w@/!)" "PAUSED(p!)" "|" "DONE(d!)" "DELEGATED(f!)" "CANCELLED(c!)")))

  (setq org-global-properties
        '(("Effort_ALL". "0 0:10 0:30 1:00 2:00 3:00 4:00 5:00 6:00 7:00")))

  (define-prefix-command 'org-todo-state-map)

  ;; чтобы айтемы с приоритетом  B поднимались в верх списка.
  ;; В emacs 28.2 нет переменной org-lowest-priority
  ;; (setf org-default-priority org-lowest-priority)
  
  (define-key org-mode-map "\C-cx" 'org-todo-state-map)
                                        ;(define-key org-mode-map (kbd "C-c a l") 'org-agenda-list)
                                        ;(define-key org-mode-map (kbd "C-c a t") 'org-timeline)
  (define-key org-mode-map (kbd "C-c C-x C-k") 'org-cut-subtree)
  
  (define-key org-mode-map (kbd "C-c i") 'org-table-insert-row)
  (define-key org-mode-map (kbd "C-c k") 'org-table-kill-row)
  (define-key org-mode-map (kbd "C-c k") 'org-table-kill-row)

  ;; Надо найти исходник где определяется эта функция
  ;; (add-hook 'org-ctrl-c-ctrl-c-hook 'expand-ticket-at-point)

  ;; (define-key org-mode-map (kbd "C-c TAB")
  ;;  #'(lambda () (interactive) (expand-ticket-at-point t)))

  (define-key org-todo-state-map "x"
    #'(lambda nil (interactive) (org-todo "CANCELLED")))
  (define-key org-todo-state-map "d"
    #'(lambda nil (interactive) (org-todo "DONE")))
  (define-key org-todo-state-map "f"
    #'(lambda nil (interactive) (org-todo "DEFERRED")))
  (define-key org-todo-state-map "p"
    #'(lambda nil (interactive) (org-todo "PAUSED")))
  (define-key org-todo-state-map "s"
    #'(lambda nil (interactive) (org-todo "STARTED")))
  (define-key org-todo-state-map "w"
    #'(lambda nil (interactive) (org-todo "WAITING")))


  ;; delay task to 1 week
  (defun 40wt/next-week ()
    (interactive)
    (org-agenda-schedule nil "+7d"))

  (defun 40wt/clone-schedule ()
    (interactive)
    (org-agenda-schedule nil (substring org-last-inserted-timestamp 1 -1)))

  ;; other useful commands
  ;; http://sachachua.com/blog/2013/01/emacs-org-task-related-keyboard-shortcuts-agenda/
  (add-hook 'org-agenda-mode-hook '40wt-configure-org-mode-agenda-buffer-hook)
  (add-hook 'org-mode-hook '40wt-configure-org-mode-buffer-hook)

  ;; setup todo items clocking
  ;; http://orgmode.org/manual/Clocking-work-time.html#Clocking-work-time
  (setq org-clock-persist 'history)
  (org-clock-persistence-insinuate)

  ;; optional configuration of RSS source for inbox
  

  (setq org-export-backends '(html md))

  (use-package ob-http)

  (org-babel-do-load-languages 'org-babel-load-languages
                               '((dot . true)
                                 (python . true)
                                 (lisp . true)
                                 ;; Probably need to install ob-http extension
                                 (http . true)
                                 (shell . true)))

  ;; Set to the location of your Org files on your local system
  (setq org-directory "~/txt")
  (use-package f)
  (use-package s)
  (set-org-agenda-files)
  ;; Set to the name of the file where new notes will be stored
  (setq org-mobile-inbox-for-pull "~/txt/mobile-inbox.org")
  ;; Set to <your Dropbox root directory>/MobileOrg.
  (setq org-mobile-directory "~/Dropbox/Apps/MobileOrg")

  ;; Set clean mode when only items are indented and headers have
  ;; only one star. Read more at:
  ;; http://orgmode.org/guide/Clean-view.html#Clean-view
  (setq org-startup-indented t)

  (setq org-caldav-debug-level 2)

  ;; To make long lines wrap on screen boundary:
  (add-hook 'org-mode-hook 'visual-line-mode)

  (40wt/set-org-headlines-fonts))


(defun 40wt/set-org-theme-faces ()
  ;; From https://zzamboni.org/post/beautifying-org-mode-in-emacs/
  (custom-theme-set-faces
   'user
   '(variable-pitch ((t (:family "ETBembo" :height 180 :weight thin))))
   '(fixed-pitch ((t (:family "Pragmata Pro" :height 160)))))

  ;; This makes some pieces too small
  ;; I have to revise these settings carefully before apply:
  ;; (custom-theme-set-faces
  ;;  'user
  ;;  '(org-block ((t (:inherit fixed-pitch))))
  ;;  '(org-code ((t (:inherit (shadow fixed-pitch)))))
  ;;  '(org-document-info ((t (:foreground "dark orange"))))
  ;;  '(org-document-info-keyword ((t (:inherit (shadow fixed-pitch)))))
  ;;  '(org-indent ((t (:inherit (org-hide fixed-pitch)))))
  ;;  '(org-link ((t (:foreground "royal blue" :underline t))))
  ;;  '(org-meta-line ((t (:inherit (font-lock-comment-face fixed-pitch)))))
  ;;  '(org-property-value ((t (:inherit fixed-pitch))) t)
  ;;  '(org-special-keyword ((t (:inherit (font-lock-comment-face fixed-pitch)))))
  ;;  '(org-table ((t (:inherit fixed-pitch :foreground "#83a598"))))
  ;;  '(org-tag ((t (:inherit (shadow fixed-pitch) :weight bold :height 0.8))))
  ;;  '(org-verbatim ((t (:inherit (shadow fixed-pitch))))))
  )


(defun 40wt/set-org-headlines-fonts ()
  ;; From https://zzamboni.org/post/beautifying-org-mode-in-emacs/
  (let* ((variable-tuple
          (cond ((x-list-fonts "ETBembo")         '(:font "ETBembo"))
                ((x-list-fonts "Source Sans Pro") '(:font "Source Sans Pro"))
                ((x-list-fonts "Lucida Grande")   '(:font "Lucida Grande"))
                ((x-list-fonts "Verdana")         '(:font "Verdana"))
                ((x-family-fonts "Sans Serif")    '(:family "Sans Serif"))
                (nil (warn "Cannot find a Sans Serif Font.  Install Source Sans Pro."))))
         (base-font-color     (face-foreground 'default nil 'default))
         (headline           `(:inherit default :weight bold :foreground ,base-font-color)))

    (custom-theme-set-faces
     'user
     `(org-level-8 ((t (,@headline ,@variable-tuple))))
     `(org-level-7 ((t (,@headline ,@variable-tuple))))
     `(org-level-6 ((t (,@headline ,@variable-tuple))))
     `(org-level-5 ((t (,@headline ,@variable-tuple))))
     `(org-level-4 ((t (,@headline ,@variable-tuple :height 1.1))))
     `(org-level-3 ((t (,@headline ,@variable-tuple :height 1.2))))
     `(org-level-2 ((t (,@headline ,@variable-tuple :height 1.3))))
     `(org-level-1 ((t (,@headline ,@variable-tuple :height 1.5))))
     `(org-document-title ((t (,@headline ,@variable-tuple :height 2.0 :underline nil)))))))


(use-package org
  :ensure t
  :config
  (setq org-use-speed-commands t
        org-hide-emphasis-markers t
        ;; TODO: Попробовать как работает completion в refile
        ;; org-completion-use-ido t
        ;; org-outline-path-complete-in-steps nil
        org-src-fontify-natively t ;; Pretty code blocks
        org-src-tab-acts-natively t
        org-confirm-babel-evaluate nil
        ;; To remove indentation in CODE blocks
        org-edit-src-content-indentation 0)
  (40wt-init-org-mode))

(use-package org-randomnote
    :ensure t
    :bind ("C-c C-x r" . org-randomnote)
    :config
    (setq org-randomnote-candidates '("~/txt/workaround.org")))


(use-package org-bullets
    :ensure t
    :config
    (add-hook 'org-mode-hook 'org-bullets-mode))

;; To make code editing better:
;; https://github.com/jingtaozf/literate-lisp
(use-package poly-org
    :ensure t
    :config
    (setf auto-mode-alist
          ;; To prevent automatic enabling this mode
          ;; for all org files.
          (remove '("\\.org\\'" . poly-org-mode)
                  auto-mode-alist)))

(use-package org-super-agenda
  :ensure t
  :config
  (setf org-super-agenda-groups
        '((:name "Сегодня"
                 :time-grid t
                 :todo "TODAY")
          (:name "Важное"
                 :tag "work"
                 :tag "finances"
                 :priority "A")
          (:name "Opensource"
                 :tag "opensource")
          (:name "Учу"
                 :tag "learn")
          (:todo "WAITING"
                 :order 8)
          (:priority<= "B"
                       :order 1)))
  (org-super-agenda-mode 1))


(use-package org-roam
    :ensure t
    :hook
    (after-init . org-roam-mode)
    :custom
    (org-roam-directory "~/txt/roam/")
    (org-roam-graph-executable "/opt/homebrew/bin/dot")
    :bind (("C-c n f" . org-roam-node-find)
           :map org-mode-map
           ("C-c n i" . org-roam-node-insert))
           
    ;; :bind (:map org-roam-mode-map
    ;;             (("C-c n l" . org-roam)
    ;;              ("C-c n f" . org-roam-node-find)
    ;;              ("C-c n g" . org-roam-graph-show))
    ;;             :map org-mode-map
    ;;             (("C-c n i" . org-roam-insert))
    ;;             (("C-c n I" . org-roam-insert-immediate)))
    )


;; For Advanced Full-Text search
;; https://www.orgroam.com/manual.html#Full_002dtext-search-with-Deft
(use-package deft
  :after org
  :bind
  ("C-c n d" . deft)
  :custom
  (deft-recursive t)
  (deft-use-filter-string-for-filename t)
  (deft-default-extension "org")
  (deft-directory org-roam-directory))


(defun setup-org-caldav ()
                                        ;  (setq org-caldav-url "https://caldav.yandex-team.ru")
  (setq org-caldav-url "https://caldav.yandex-team.ru/principals/users/art@yandex-team.ru")
                                        ;  (setq org-caldav-calendar-id "calendars/art%40yandex-team.ru/events-1527")
  (setq org-caldav-calendar-id "events-1527")
  
  (setq org-caldav-inbox "~/txt/appointments.org"))

;; (require 'remember)

;; (add-hook 'remember-mode-hook 'org-remember-apply-template)

;(define-key global-map [(control meta ?r)] 'remember)
(define-key global-map (kbd "C-M-r") 'org-capture)

;; Macroses
(fset '40wt-today-task
   [?\C-c ?\C-t ?t ?\C-c ?\C-s return ?\C-a down down ?\C-a])
(define-key org-mode-map (kbd "C-t") '40wt-today-task)

(provide '40wt-org)
