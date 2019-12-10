(use-package
    helm
    :bind ("C-x C-f" . helm-find-files)
    :init
    (message "Configuring Helm mode")
    (helm-mode))

(use-package
    helm-ag
    :init
  (message "Configuring Helm AG")
  (setq helm-ag-base-command "/usr/local/bin/ag --nocolor --nogroup"))
