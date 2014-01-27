;; Multiple cursors
;; https://github.com/magnars/multiple-cursors.el
(global-set-key (kbd "C-c m e") 'mc/edit-lines)
(global-set-key (kbd "C-c m >") 'mc/mark-next-like-this)
(global-set-key (kbd "C-c m <") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c m a") 'mc/mark-all-like-this)
(global-set-key (kbd "C-c m t") 'mc/mark-sgml-tag-pair)
