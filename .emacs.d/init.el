;; TODO: may be return back
;; (eval-when-compile
;;   (require 'cl))
(require 'package)


(defvar *emacs-config-directory* (file-name-directory load-file-name))

;; (add-to-list 'package-archives
;;              '("marmalade" . "http://marmalade-repo.org/packages/") t)

(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)

;; (setq package-archives '(("elpy" . "https://jorgenschaefer.github.io/packages/")))



;; TODO: replace with use-package
;; (defun package-install-with-refresh (package)
;;   (unless (assq package package-alist)
;;     (package-refresh-contents))
;;   (unless (package-installed-p package)
;;     (package-install package)))


;; (defun require-or-install (package)
;;   (or (require package nil t)
;;       (progn
;;        (package-install-with-refresh package)
;;        (require package))))


;; ;; el-get
;; (defvar *el-get-directory*
;;   (expand-file-name "el-get/el-get" *emacs-config-directory*))

;; (add-to-list 'load-path *el-get-directory*)

;; ;; install el-get
;; (unless (require 'el-get nil t)
;;   (with-current-buffer
;;       (url-retrieve-synchronously
;;        "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
;;     (goto-char (point-max))
;;     (eval-print-last-sexp)))

;; (require 'el-get)


;; (setq el-get-recipe-path
;;       (list (expand-file-name "recipes" *el-get-directory*)
;;             (expand-file-name "el-get/user/recipes" *emacs-config-directory*)))

;; (setq el-get-user-package-directory
;;       (expand-file-name "el-get/user/init-files" *emacs-config-directory*))

;; (el-get 'sync)


;; (package-initialize nil)


;; ;;; Если пакет use-package не установлен, его нужно скачать и
;; ;;; установить
;; (unless (package-installed-p 'use-package)
;;   (message "EMACS install use-package.el")
;;   (package-refresh-contents)
;;   (package-install 'use-package))


;;; Установили, загрузили, указали, что недостающие пакеты нужно
;;; автоматически загружать и устанавливать.
(require 'use-package)
(setq use-package-always-ensure t)


;; (when (not package-archive-contents)
;;   (package-refresh-contents))


;; TODO: remove and use use-package package
;; ;; Add in your own as you wish:
;; (defvar my-packages '(better-defaults
;; 		      color-theme-solarized
;;                       smart-mode-line
;;                       hideshow
;;                       ;; mustache-mode
;;                       ;; python
;;                       ;; pymacs
;;                       ;; whitespace
;;                       ; переход на заданный символ C-c 0
;;                       ace-jump-mode
;;                       ;; ; пометка и редактирование нескольких регионов сразу
;;                       ;; multiple-cursors
;;                       ;; ; зависимости для Jedi

                      
;;                       ;; fuzzy
;;                       ;; переход на строку в которой было последнее редактирование C-c C-\
;;                       goto-chg
;;                       ;; без комментариев
;;                       markdown-mode
;;                       ;; работа с git
;;                       magit
;;                       ;; раскрытие аббревиатур в шаблоны
;;                       yasnippet
;;                       ;; для пометки мест в файле и переходе между ними
;;                       bm
;;                       ;; helm-swoop
;;                       )
;;   "A list of packages to ensure are installed at launch.")

;; (defun use-package (name)
;;   "Install package if it is not installed."
;;   (progn
;;     ;(print (concat "Using package: " (pp-to-string name)))
;;     (when (not (package-installed-p name))
;;       (package-install name))))


;; (defun use-packages (names)
;;   "Install all named packages if they are not already installed"
;;   (mapc 'use-package names))

;; (use-packages my-packages)

;; TODO: move to a separate file
;; ;; better defaults does not work without that
;; (require 'better-defaults)

;; TODO: move to a separate file
;; ; раньше была такая тема
;; ;(load-theme 'solarized-light t)
;; ;; https://github.com/sellout/emacs-color-theme-solarized
;; (load-theme 'solarized t)
;; (setq sml/theme 'respectful)
;; (setq sml/no-confirm-load-theme t)
;; (sml/setup)

(setq custom-file "~/.emacs.d/customizations.el")
(load custom-file)

; Now load all files from ~/.emacs.d/lib
; (mapc 'load (directory-files "~/.emacs.d/lib" t "^[^#].*el$"))

(use-package
 init-loader
 :config
 (setq init-loader-show-log-after-init nil)
 (setq init-loader-default-regexp "\\(?:\\`\\)")
 (init-loader-load
  (expand-file-name "lib2/" *emacs-config-directory*)))

;; TODO: enable later
;; (require-or-install 'init-loader)
;; (init-loader-load
;;  (expand-file-name "lib/" *emacs-config-directory*))


(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

;; Для поддержки лигатур
;; https://www.reddit.com/r/emacs/comments/742jnv/is_ligature_supported_in_emacs/
(if (fboundp 'mac-auto-operator-composition-mode)
    (mac-auto-operator-composition-mode))

;; чтобы swoop не начинал искать по тому слову, на котором случайно оказался курсор
;; (setq helm-swoop-pre-input-function
;;       (lambda ()
;;         nil))

(let ((local-conf (expand-file-name ".local.el")))
  (if (file-exists-p local-conf)
      (load local-conf)))
(put 'narrow-to-region 'disabled nil)

(put 'set-goal-column 'disabled nil)


;; TODO: temprorary disabled, move to a separate file
;; ;; Эти настройки должны сделать редактирование удалённых файлов
;; ;; пошустрее. Взято отсюда:
;; ;; http://gleek.github.io/blog/2017/04/11/editing-remote-code-with-emacs/
;; (setq tramp-auto-save-directory "~/tmp/tramp/")
;; ;; Я проверил скриптом, который в доке про tramp-chunksize, и у меня
;; ;; он останавливался на цифре 1000, что вроде как плохо.
;; (setq tramp-chunksize 900)


;; (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

;; (projectile-global-mode)
;; (setq projectile-completion-system 'helm)

;; ;; Helm is overhelming!
;; (helm-mode)
;; (helm-projectile-on)

