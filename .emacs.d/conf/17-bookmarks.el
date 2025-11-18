(use-package bm
  :bind (("C-c b" . bm-toggle)
        ("C-c <up>" . bm-previous)
        ("C-c <down>" . bm-next))
  :config (set-face-attribute 'bm-face nil :overline nil :background "#3FF"))
