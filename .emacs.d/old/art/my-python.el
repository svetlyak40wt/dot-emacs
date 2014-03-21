(eval-after-load 'python
  `(progn
     (defun python-config ()
       (local-set-key (kbd "RET") 'newline-and-indent)
  
       ;; Snippets
       (yas-minor-mode)
       (yas/load-directory "~/.emacs.d/snippets")

       (setq jedi:setup-keys t)
       (require 'auto-complete)
       (auto-complete-mode)
       (highlight-lines-matching-regexp "pdb\.set_trace" "hi-blue")
       (jedi:setup))

       (add-hook 'python-mode-hook 'python-config)))
