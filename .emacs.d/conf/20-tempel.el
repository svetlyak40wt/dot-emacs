(use-package tempel
  :ensure t
  :bind (("M-=" . tempel-complete) ;; Alternative tempel-expand
         ("M-+" . tempel-insert))
  :init
  (setf tempel-path
        "~/.emacs.d/templates/*.eld"))
