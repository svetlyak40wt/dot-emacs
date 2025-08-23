;; https://github.com/yoshiki/yaml-mode
(use-package yaml-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode)))


;; https://github.com/krzysztof-magosa/flycheck-yamllint
;(use-package flycheck-yamllint
;  :ensure t)
