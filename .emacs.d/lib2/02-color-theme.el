;; https://github.com/sellout/emacs-color-theme-solarized

(use-package smart-mode-line)

;; Also need to set default frame in customizations to:
;; '(default (;; (t (:inherit nil :stipple nil :background "#fcf4dc" :foreground "#52676f" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 200 :width normal :foundry "nil" :family "PragmataPro"))
;;             (t (:inherit nil :stipple nil :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 200 :width normal :foundry "nil" :family "PragmataPro"))))

;; (use-package
;;     color-theme-solarized
;;     :init
;;   (message "Configuring color theme")
;;   (load-theme 'solarized t)
;;   (setq sml/theme 'respectful)
;;   (setq sml/no-confirm-load-theme t)
;;   (sml/setup))


;; https://github.com/bbatsov/solarized-emacs
(use-package
  solarized-theme
  :config
  (message "Configuring color theme")
  ;; Прежде использовал такую тему:
  ;;  (load-theme 'solarized-light t)
  
  ;; Использовал эту тему чтобы код норм выглядел на PocketBook
  ;; (load-theme 'whiteboard t)
  
  ;; This theme is more suitable when working in the dark room
  ;;  (load-theme 'solarized-wombat-dark t)
  (load-theme 'wombat t)
  (setq sml/theme 'respectful)
  (setq sml/no-confirm-load-theme t)
  (sml/setup))
