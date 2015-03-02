;;; from http://newartisans.com/2007/08/using-org-mode-as-a-day-planner/
;;; Описание хуков: http://orgmode.org/tmp/worg/org-configs/org-hooks.html

(require 'org-install)

(define-key mode-specific-map [?a] 'org-agenda)


(eval-after-load "org"
  '(progn
     ; http://orgmode.org/manual/Fast-access-to-TODO-states.html#Fast-access-to-TODO-states
     (setq org-todo-keywords
           '((sequence "TODO(t)" "STARTED(s!)" "WAITING(w@/!)" "PAUSED(p!)" "|" "DONE(d!)" "DEFERRED(f!)" "CANCELLED(c!)")))

     (setq org-global-properties
           '(("Effort_ALL". "0 0:10 0:30 1:00 2:00 3:00 4:00 5:00 6:00 7:00")))

     (define-prefix-command 'org-todo-state-map)

     (define-key org-mode-map "\C-cx" 'org-todo-state-map)
     ;(define-key org-mode-map (kbd "C-c a l") 'org-agenda-list)
     ;(define-key org-mode-map (kbd "C-c a t") 'org-timeline)
     (define-key org-mode-map (kbd "C-c C-x C-k") 'org-cut-subtree)

     (add-hook 'org-ctrl-c-ctrl-c-hook 'expand-ticket-at-point)

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
     (add-hook 'org-agenda-mode-hook
               (lambda ()
                 (define-key org-agenda-mode-map "1" '40wt/next-week)
                 (define-key org-agenda-mode-map "2" '40wt/clone-schedule)))

     ; (define-key org-agenda-mode-map "\C-n" 'next-line)
     ; (define-key org-agenda-keymap "\C-n" 'next-line)
     ; (define-key org-agenda-mode-map "\C-p" 'previous-line)
     ; (define-key org-agenda-keymap "\C-p" 'previous-line)


     ;; setup todo items clocking
     ;; http://orgmode.org/manual/Clocking-work-time.html#Clocking-work-time
     (setq org-clock-persist 'history)
     (org-clock-persistence-insinuate)

     ;; optional configuration of RSS source for inbox
     (if (file-exists-p "~/.org-feed")
         (progn (load "~/.org-feed")
                (setq org-feed-alist
                      (list (list "Input from evernote"
                                  org-inbox-rss-feed
                                  "~/txt/todo.org" "INBOX")))
                ;; update inbox every 15 minutes
                (run-with-idle-timer (* 15 60) 1 'org-feed-update-all)))

     (setq org-export-backends '(html md))

     (org-babel-do-load-languages 'org-babel-load-languages
                                  '((sh . true) (python . true)))

     ;; Set to the location of your Org files on your local system
     (setq org-directory "~/txt")
     ;; Set to the name of the file where new notes will be stored
     (setq org-mobile-inbox-for-pull "~/txt/from-mobile.org")
     ;; Set to <your Dropbox root directory>/MobileOrg.
     (setq org-mobile-directory "~/Dropbox/Apps/MobileOrg")))

;; (require 'remember)

;; (add-hook 'remember-mode-hook 'org-remember-apply-template)

;(define-key global-map [(control meta ?r)] 'remember)
(define-key global-map (kbd "C-M-r") 'org-capture)


(provide '40wt-org)
