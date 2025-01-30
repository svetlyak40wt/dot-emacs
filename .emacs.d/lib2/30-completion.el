(use-package corfu
  ;; Optional customizations
  :custom
  (corfu-cycle t)                       ; Allows cycling through candidates
  (corfu-auto t)                        ; Enable auto completion
  (corfu-auto-prefix 2)
  (corfu-auto-delay 0.5)
  (corfu-popupinfo-delay '(0.5 . 0.2))
  (corfu-preview-current 'insert)       ; Do not preview current candidate
  (corfu-preselect-first t)
  (corfu-on-exact-match nil)            ; Don't auto expand tempel snippets

  ;; Optionally use TAB for cycling, default is `corfu-complete'.
  :bind (:map corfu-map
              ("M-SPC"      . corfu-insert-separator)
              ("TAB"        . corfu-next)
              ([tab]        . corfu-next)
              ("S-TAB"      . corfu-previous)
              ([backtab]    . corfu-previous)
              ("S-<return>" . corfu-insert)
              ("RET"        . corfu-insert))

  :config
  (global-corfu-mode)
  (corfu-history-mode)
  (corfu-echo-mode)
  (corfu-popupinfo-mode)                ; Popup completion info
  (global-set-key (kbd "C-c TAB") 'completion-at-point)
  ;; Probably this config should be in a separate elisp file?
  ;; :config
  ;; (add-hook 'eshell-mode-hook
  ;;           (lambda () (setq-local corfu-quit-at-boundary t
  ;;                             corfu-quit-no-match t
  ;;                             corfu-auto nil)
  ;;             (corfu-mode)))
  )
