;; Часть отсюда: http://www.masteringemacs.org/articles/2011/02/08/mastering-key-bindings-emacs/
;; А часть отсюда https://sites.google.com/site/steveyegge2/effective-emacs/

;; используем C-w для удаления слова с опечаткой и последующего набора его заново
;; вместо kill-region
(global-set-key (kbd "C-w") 'backward-kill-word)
;; вместо кучи команд начинающихся с kmacro-
(global-set-key (kbd "C-x C-k") 'kill-region)

;; сделаем чтобы в графическом емаксе работали Cmd-C Cmd-V
(setq mac-command-modifier 'super)
(global-set-key (kbd "s-c") 'kill-ring-save)
(global-set-key (kbd "s-v") 'yank)

;; вместо indent-new-comment-line
(global-set-key (kbd "M-j")
                (lambda ()
                  (interactive)
                  (join-line -1)))

;; на этом биндинге ничего нет
(global-set-key (kbd "C-c q") 'join-line)

;; на этом вроде тоже
(global-set-key (kbd "C-c g s") 'magit-status)
(global-set-key (kbd "C-c g b") 'magit-blame)

;; поиск и замена
;; на этом биндинге ничего нет
(global-set-key (kbd "C-c r s") 'replace-string)
(global-set-key (kbd "C-c r r") 'replace-regexp)


;; ;; вместо zap-to-char
;; (global-set-key (kbd "M-z") 'undo)
;; ;; на этом биндинге ничего нет
;; (global-set-key (kbd "C-c z") 'zap-to-char)


;; BEGIN используем то, на чем нет биндингов
(global-set-key (kbd "C-c =") 'er/expand-region)
(global-set-key (kbd "C-c c") 'comment-or-uncomment-region)
(global-set-key (kbd "C-c 0") 'ace-jump-mode)
(global-set-key (kbd "C-c C-\\") 'goto-last-change)

;; Кажется на C-c l ничего нет, ставим сюда быстрое переключение
;; между окнами
(global-set-key (kbd "C-c l") 'ace-window)

;; one line scrolling with cmd-up and cmd-down
(global-set-key (kbd "s-<up>") 'scroll-down-line)
(global-set-key (kbd "s-<down>") 'scroll-up-line)

;; END используем то, на чем нет биндингов

;; какое-то старье, которое наверное можно удалить
;; Steve Yegge утверждает что это удобнее чем M-x
;(global-set-key (kbd "C-x C-m") 'execute-extended-command)
;(global-set-key (kbd "C-c C-s") 'slime-selector)


;; iTerm meta-shift-<arrows> fix
;; from https://github.com/troydm/emacs-stuff/blob/master/windcycle.el
(define-key input-decode-map "\e[1;10A" [M-S-up])
(define-key input-decode-map "\e[1;10B" [M-S-down])
(define-key input-decode-map "\e[1;10C" [M-S-right])
(define-key input-decode-map "\e[1;10D" [M-S-left])


(provide '40wt-bindings)
