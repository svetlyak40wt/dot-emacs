(defun 40wt/toggle-mode ()
  (interactive)
  (if (eq major-mode 'js-mode)
      (html-mode)
    (js-mode)))

(global-set-key (kbd "C-c m") '40wt/toggle-mode)
