;;; from http://newartisans.com/2007/08/using-org-mode-as-a-day-planner/

(require 'org-install)

;(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))

(define-key mode-specific-map [?a] 'org-agenda)

(eval-after-load "org"
  '(progn
     ; http://orgmode.org/manual/Fast-access-to-TODO-states.html#Fast-access-to-TODO-states
     (setq org-todo-keywords
       '((sequence "TODO(t)" "STARTED(s!)" "WAITING(w@/!)" "DELEGATED(D@/!)" "APPT(a)" "|" "DONE(d!)" "DEFERRED(f!)" "CANCELLED(c!)")))

     (define-prefix-command 'org-todo-state-map)

     (define-key org-mode-map "\C-cx" 'org-todo-state-map)
     ;(define-key org-mode-map (kbd "C-c a l") 'org-agenda-list)
     ;(define-key org-mode-map (kbd "C-c a t") 'org-timeline)
     (define-key org-mode-map (kbd "C-x C-k") 'org-cut-subtree)
     

     (define-key org-todo-state-map "x"
       #'(lambda nil (interactive) (org-todo "CANCELLED")))
     (define-key org-todo-state-map "d"
       #'(lambda nil (interactive) (org-todo "DONE")))
     (define-key org-todo-state-map "f"
       #'(lambda nil (interactive) (org-todo "DEFERRED")))
     (define-key org-todo-state-map "l"
       #'(lambda nil (interactive) (org-todo "DELEGATED")))
     (define-key org-todo-state-map "s"
       #'(lambda nil (interactive) (org-todo "STARTED")))
     (define-key org-todo-state-map "w"
       #'(lambda nil (interactive) (org-todo "WAITING")))

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
                (run-with-idle-timer 30 (* 15 60) 'org-feed-update-all)
))

     (setq org-export-backends '(html md))))

(require 'remember)

(add-hook 'remember-mode-hook 'org-remember-apply-template)

;(define-key global-map [(control meta ?r)] 'remember)
(define-key global-map (kbd "C-M-r") 'remember)


(provide '40wt-org)
