;(load (expand-file-name "~/pizzbook/lisp/quicklisp/slime-helper.el") t)
;; Replace "sbcl" with the path to your implementation
;(setq inferior-lisp-program "sbcl")


;; KEYBINDINGS
;; Mastering Key Bindings: http://www.masteringemacs.org/articles/2011/02/08/mastering-key-bindings-emacs/

;; вместо M-x
(global-set-key (kbd "C-x C-m") 'execute-extended-command)

(global-set-key (kbd "C-c C-s") 'slime-selector)
(global-set-key (kbd "C-c z") 'zap-to-char)
(global-set-key (kbd "C-c m g") 'goto-line)

;; используем C-w для удаления слова с опечаткой и последующего набора его заново
;; https://sites.google.com/site/steveyegge2/effective-emacs/#item3
(global-set-key (kbd "C-w") 'backward-kill-word)
(global-set-key (kbd "C-x C-k") 'kill-region)
(global-set-key (kbd "M-z") 'undo)
(global-set-key (kbd "M-m") 'iy-go-to-char)

(global-set-key (kbd "C-c =") 'er/expand-region)
(global-set-key (kbd "C-c c") 'comment-or-uncomment-region)
(global-set-key (kbd "C-c 0") 'ace-jump-mode)

;; iTerm meta-shift-<arrows> fix
;; from https://github.com/troydm/emacs-stuff/blob/master/windcycle.el
(define-key input-decode-map "\e[1;10A" [M-S-up])
(define-key input-decode-map "\e[1;10B" [M-S-down])
(define-key input-decode-map "\e[1;10C" [M-S-right])
(define-key input-decode-map "\e[1;10D" [M-S-left])
(global-set-key (kbd "C-c C-\\") 'goto-last-change)

(if (file-exists-p ".emacs.el")
    (load-file ".emacs.el"))
