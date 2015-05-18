(require 'package)

(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)

(add-to-list 'package-archives
             '("MELPA" . "http://melpa.milkbox.net/packages/") t)


(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))


;; Add in your own as you wish:
(defvar my-packages '(better-defaults
		      color-theme-solarized
                      ;; mustache-mode
                      ;; python
                      ;; pymacs
                      ;; whitespace
                      ; переход на заданный символ C-c 0
                      ace-jump-mode
                      ;; ; пометка и редактирование нескольких регионов сразу
                      ;; multiple-cursors
                      ;; ; зависимости для Jedi

                      
                      ;; fuzzy
                      ;; переход на строку в которой было последнее редактирование C-c C-\
                      goto-chg
                      ;; раскрытие аббревиатур в шаблоны
                      yasnippet
                      ;; без комментариев
                      markdown-mode
                      ;; работа с git
                      magit

                      ;; для пометки мест в файле и переходе между ними
                      bm
                      )
  "A list of packages to ensure are installed at launch.")

(defun use-package (name)
  "Install package if it is not installed."
  (progn
    (print (concat "Using package: " (pp-to-string name)))
    (when (not (package-installed-p name))
      (package-install name))))


(defun use-packages (names)
  "Install all named packages if they are not already installed"
  (mapc 'use-package names))

(use-packages my-packages)

;; yasnippet configuration
(require 'yasnippet)
(yas/load-directory "~/.emacs.d/snippets")

;; https://github.com/sellout/emacs-color-theme-solarized
(load-theme 'solarized t)

(setq custom-file "~/.emacs.d/customizations.el")
(load custom-file)

; Now load all files from ~/.emacs.d/lib
(mapc 'load (directory-files "~/.emacs.d/lib" t "^[^#].*el$"))
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

(let ((local-conf (expand-file-name ".local.el")))
  (if (file-exists-p local-conf)
      (load local-conf)))
