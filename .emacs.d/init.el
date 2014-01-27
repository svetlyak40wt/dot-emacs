(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)


(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))


;; Add in your own as you wish:
(defvar my-packages '(starter-kit
                      starter-kit-lisp
                      starter-kit-bindings
                      color-theme-solarized
                      mustache-mode
                      python
                      pymacs
                      flymake-python-pyflakes
                      flymake-cursor
                      whitespace
                      expand-region
                      ; переход на заданный символ
                      ace-jump-mode
                      ; пометка и редактирование нескольких регионов сразу
                      multiple-cursors
                      ; зависимости для Jedi
                      auto-complete
                      fuzzy
                      iy-go-to-char ;; move to the next occurence of the char
                      py-import-check ;; pip install importchecker, запускать как py-import-check
                      goto-last-change
                      yasnippet)
  "A list of packages to ensure are installed at launch.")

(dolist (p my-packages)
  (when (not (package-installed-p p))
        (package-install p)))


;; el-get initialization
;; Нужно для установки http://tkf.github.io/emacs-jedi/

(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (let (el-get-master-branch)
      (goto-char (point-max))
      (eval-print-last-sexp))))

(el-get 'sync)
;; end of el-get init

(setq browse-url-generic-program "ssh"
      browse-url-generic-args '("back" "open")
      browse-url-browser-function 'browse-url-generic)

(load-theme 'solarized-light t)

(setq custom-file "~/.emacs.d/customizations.el")
(load custom-file)
