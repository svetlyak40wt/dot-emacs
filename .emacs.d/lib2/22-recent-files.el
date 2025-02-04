;; This tracks opened files and allows them to be found
;; after emacs restart.

(use-package recentf
  :ensure t
  :custom
  (recentf-max-saved-items 1000)
  :init
  (recentf-mode 1))

