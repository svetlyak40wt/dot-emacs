(use-package helm
  :defer 5
  
  :bind ("C-x C-f" . helm-find-files)
  :custom
  (helm-buffer-max-length 40)
  :config
  (message "Configuring Helm mode")
  (setf helm-buffer-max-length 40)
  (helm-mode))


(use-package helm-ag
  :after helm
  :config
  (message "Configuring Helm AG")
  (cond
   ((file-exists-p "~/.nix-profile/bin/ag")
    (setq helm-ag-base-command "~/.nix-profile/bin/ag --nocolor --nogroup"))
   ((file-exists-p "/usr/local/bin/ag")
    (setq helm-ag-base-command "/usr/local/bin/ag --nocolor --nogroup"))
   (t
    (message "Unable to find \"ag\" command. Install it like this: nix-env -i -b silver-searcher"))))
