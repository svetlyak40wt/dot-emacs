(use-package better-defaults)

;; Put all backups aside
;; better-defaults sets this variable,
;; but I've added it here explicitly
(setq backup-directory-alist `(("." . ,(concat user-emacs-directory
                                               "backups"))))

;; Don't put #some-file# into the same directory as the file.
(let ((autosave-dir (concat user-emacs-directory
                            "autosaves/")))
  (if (not (file-exists-p autosave-dir))
      (make-directory autosave-dir t))

  (setq auto-save-file-name-transforms
        (append auto-save-file-name-transforms
                (list (list ".*" autosave-dir t)))))


(setq auto-save-timeout 15)


;; Probably need to set this,
;; to not create .#some-file symlinks
;; (setq create-lockfiles nil)
