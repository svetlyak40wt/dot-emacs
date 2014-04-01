(require 'package)

(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))


;; Add in your own as you wish:
(defvar my-packages '(better-defaults
		      color-theme-solarized
                      ;; mustache-mode
                      ;; python
                      ;; pymacs
                      ;; flymake-python-pyflakes
                      ;; flymake-cursor
                      ;; whitespace
                      ; выделение окружающего контекста по C-c =
                      expand-region
                      ; переход на заданный символ C-c 0
                      ace-jump-mode
                      ;; ; пометка и редактирование нескольких регионов сразу
                      ;; multiple-cursors
                      ;; ; зависимости для Jedi
                      ;; auto-complete
                      ;; fuzzy
                      ;; py-import-check ;; pip install importchecker, запускать как py-import-check
                      ; переход на строку в которой было последнее редактирование C-c C-\
                      goto-last-change
                      ;; yasnippet
                      )
  "A list of packages to ensure are installed at launch.")

(dolist (p my-packages)
  (when (not (package-installed-p p))
        (package-install p)))


(load-theme 'solarized-light t)

(setq custom-file "~/.emacs.d/customizations.el")
(load custom-file)

(add-to-list 'load-path "~/.emacs.d/lib")

;; (print "LOAD-PATH:")
;; (dolist (name load-path)
;;   (print name))


(require '40wt-bindings)
(require '40wt-org)
