(use-package undo-tree
  :ensure t
  :config
  (global-undo-tree-mode t)
  ;; To not clutter my projects with
  ;; .*.~undo-tree~ files:
  (setf undo-tree-history-directory-alist
        '((".*" . ".emacs.d/undo-history/"))))
