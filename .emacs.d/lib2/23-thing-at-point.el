(use-package mark-thing-at
  :bind-keymap ("C-x m" . mark-thing-at-mode-map)
  :config
  (mark-thing-at-make-functions)
  (mark-thing-at-mode 1))
