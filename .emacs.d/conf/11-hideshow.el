(use-package
 hideshow
 :bind (("C-c <up>" . hs-hide-block)
        ("C-c <down>" . hs-show-block)
        ("C-c C-x <up>" . hs-hide-all)
        ("C-c <up>" . hs-hide-block))
 :init
 ;; This snippet expands hide/show block when cursor is
 ;; moved via goto-line or search (which uses goto-line under the hood).
 ;; Take from https://www.emacswiki.org/emacs/HideShow
 (defadvice goto-line (after expand-after-goto-line
                             activate compile)
   "hideshow-expand affected block when using goto-line in a collapsed buffer"
   (save-excursion
     (hs-show-block)))

 (defadvice goto-char (after expand-after-goto-line
                             activate compile)
   "hideshow-expand affected block when using goto-line in a collapsed buffer"
   (save-excursion
     (hs-show-block)))

 (defadvice helm-ag-mode-jump (after expand-after-helm-ag-mode-jump
                                     activate compile)
   "hideshow-expand affected block when using helm-ag-mode-jump in a collapsed buffer"
   (save-excursion
     (hs-show-block))))
