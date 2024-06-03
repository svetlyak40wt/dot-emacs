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
  (cond
   ((file-exists-p "~/.nix-profile/bin/ag")
    (setq helm-ag-base-command "~/.nix-profile/bin/ag --nocolor --nogroup"))
   ((file-exists-p "/usr/local/bin/ag")
    (setq helm-ag-base-command "/usr/local/bin/ag --nocolor --nogroup"))
   (t
    (message "Unable to find \"ag\" command. Install it like this: nix-env -i -b silver-searcher"))))
