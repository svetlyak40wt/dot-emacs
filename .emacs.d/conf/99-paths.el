;; Make emacs find jq and other utilities when Emacs is started in GUI mode
(when (file-directory-p "/opt/homebrew/bin")
  (add-to-list 'exec-path "/opt/homebrew/bin"))


;; Emacs started from command line and as a GUI app will inherit
;; different PATH, and changing exec-path in elisp files will
;; not affect PATH inherited by subprocesses of emacs.
;; To make changing exec-path affect subprocesses, we need
;; to set this envvar.
;; More info is here:
;; https://emacs.stackexchange.com/questions/550/exec-path-and-path
(setenv "PATH"
        (string-join exec-path ":"))

