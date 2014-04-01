(eval-after-load 'python
  `(progn
     (defun python-config ()
       (local-set-key (kbd "RET") 'newline-and-indent)
       (local-set-key (kbd "C-c n") 'flymake-goto-next-error)
  
       ;; Snippets
       (yas-minor-mode)
       (yas/load-directory "~/.emacs.d/snippets")

       (setq jedi:setup-keys t)
       (require 'auto-complete)
       (auto-complete-mode)
       (highlight-lines-matching-regexp "pdb\.set_trace" "hi-blue")
       (jedi:setup)

       ;; Turn on automatic syntax checker
       ;; https://github.com/purcell/flymake-python-pyflakes
       (require 'flymake-python-pyflakes)
       (flymake-python-pyflakes-load))

     
     (add-hook 'python-mode-hook 'python-config)))
