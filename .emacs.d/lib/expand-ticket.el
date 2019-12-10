;; Это кусок биндингов, надо найти основной код, который
;; раскрывал id тикетов в org_mode и превратить его в minor mode
;; (add-hook 'org-ctrl-c-ctrl-c-hook 'expand-ticket-at-point)
;; (define-key org-mode-map (kbd "C-c TAB")
;;   #'(lambda () (interactive) (expand-ticket-at-point t)))

