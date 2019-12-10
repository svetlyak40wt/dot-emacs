;; (use-package
;;  projectile
;;  :init
;;  (projectile-mode +1)
;;  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
;;  (setq projectile-completion-system 'helm)
;;  (helm-projectile-on))
(use-package
    projectile
    :ensure t
    :config
    (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
    (projectile-mode +1)
    (setq projectile-completion-system 'helm)
    (helm-projectile-on))
