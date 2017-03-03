(defun setup-git-commit-mode ()
  ;; turnung off the stupid git commit length limit
  (turn-off-auto-fill)
  (setq git-commit-summary-max-length 200))

(add-hook 'git-commit-setup-hook 'setup-git-commit-mode t)
