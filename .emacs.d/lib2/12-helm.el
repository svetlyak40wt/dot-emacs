(use-package
 helm
 :bind ("C-x C-f" . helm-find-files)
 :init
 (message "Configuring Helm mode")
 (helm-mode))
