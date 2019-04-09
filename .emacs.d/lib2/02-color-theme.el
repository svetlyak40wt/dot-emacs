;; https://github.com/sellout/emacs-color-theme-solarized

(use-package smart-mode-line)

(use-package
 color-theme-solarized
 :init
 (message "Configuring color theme")
 (load-theme 'solarized t)
 (setq sml/theme 'respectful)
 (setq sml/no-confirm-load-theme t)
 (sml/setup))
