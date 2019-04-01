;;; from http://newartisans.com/2007/08/using-org-mode-as-a-day-planner/
;;; Описание хуков: http://orgmode.org/tmp/worg/org-configs/org-hooks.html

;; (require 'org-install)
(require 'async)

(define-key mode-specific-map [?a] 'org-agenda)



(defun update-org-agenda-files ()
  (add-to-list 'org-agenda-files buffer-file-name))


(defun set-org-agenda-files ()
  "Goes recursively through org-directory and adds
all tasks.org files into the list."
  (require 'f)
  (require 's)

  (setq org-agenda-files
        (f-entries org-directory
                   (lambda (filename)
                     (s-ends-with-p "/tasks.org" filename))
                   t)))


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


    ;; Set text width and auto-wrapping
    (setq-local fill-column 72)
    (auto-fill-mode t)))


(defun 40wt-configure-org-mode-agenda-buffer-hook ()
  (define-key org-agenda-mode-map "1" '40wt/next-week)
  (define-key org-agenda-mode-map "2" '40wt/clone-schedule))


(defun setup-org-caldav ()
;  (setq org-caldav-url "https://caldav.yandex-team.ru")
  (setq org-caldav-url "https://caldav.yandex-team.ru/principals/users/art@yandex-team.ru")
;  (setq org-caldav-calendar-id "calendars/art%40yandex-team.ru/events-1527")
   (setq org-caldav-calendar-id "events-1527")
  
   (setq org-caldav-inbox "~/txt/appointments.org"))
(setq org-caldav-debug-level 2)

  
(eval-after-load "org"
  '(progn
     (message "ORG mode loaded, running setup code from 40wt-org.el")
     
     ;; делаем так, чтобы в саджесте по файлам не появлялись архивные org-mode файлы
     (pushnew "\\.org_archive" ido-ignore-files)

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

     (define-key org-mode-map "\C-cx" 'org-todo-state-map)
                                        ;(define-key org-mode-map (kbd "C-c a l") 'org-agenda-list)
                                        ;(define-key org-mode-map (kbd "C-c a t") 'org-timeline)
     (define-key org-mode-map (kbd "C-c C-x C-k") 'org-cut-subtree)
     
     (define-key org-mode-map (kbd "C-c i") 'org-table-insert-row)
     (define-key org-mode-map (kbd "C-c k") 'org-table-kill-row)

     (add-hook 'org-ctrl-c-ctrl-c-hook 'expand-ticket-at-point)
     (define-key org-mode-map (kbd "C-c TAB")
       #'(lambda () (interactive) (expand-ticket-at-point t)))

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

                                        ; (define-key org-agenda-mode-map "\C-n" 'next-line)
                                        ; (define-key org-agenda-keymap "\C-n" 'next-line)
                                        ; (define-key org-agenda-mode-map "\C-p" 'previous-line)
                                        ; (define-key org-agenda-keymap "\C-p" 'previous-line)


     ;; setup todo items clocking
     ;; http://orgmode.org/manual/Clocking-work-time.html#Clocking-work-time
     (setq org-clock-persist 'history)
     (org-clock-persistence-insinuate)

     ;; optional configuration of RSS source for inbox
     

     (setq org-export-backends '(html md))

     ;; Пока закомментировал, похоже что некоторые из этих модулей надо ставить отельно
     ;;(org-babel-do-load-languages 'org-babel-load-languages
     ;;                             '((dot . true)
     ;;                               (python . true)
     ;;                               (http . true)))

     ;; Set to the location of your Org files on your local system
     (setq org-directory "~/txt")
     (set-org-agenda-files)
     ;; Set to the name of the file where new notes will be stored
     (setq org-mobile-inbox-for-pull "~/txt/mobile-inbox.org")
     ;; Set to <your Dropbox root directory>/MobileOrg.
     (setq org-mobile-directory "~/Dropbox/Apps/MobileOrg")

     ;; Set clean mode when only items are indented and headers have
     ;; only one star. Read more at:
     ;; http://orgmode.org/guide/Clean-view.html#Clean-view
     (setq org-startup-indented t)))

;; (require 'remember)

;; (add-hook 'remember-mode-hook 'org-remember-apply-template)

;(define-key global-map [(control meta ?r)] 'remember)
(define-key global-map (kbd "C-M-r") 'org-capture)


(provide '40wt-org)
