## 0.9.0 (2018-03-22)

Use C-c l to switch windows using ACE.
	

## 0.8.0 (2016-04-08)

* New global bindings: `s-<up>` and `s-<down>` to scroll
  whole window by line down and up respectively.

## 0.7.1 (2016-04-07)

* Now  `C-c g b` calls `magit-blame` instead of `magit-blame-mode`.

## 0.7.0 (2016-04-01)

* Allow to use `dot` and `http` inside `org-babel`.
* Now use `C-c g s` for git status and `C-c g b` for git blame.

## 0.6.0 (2016-02-19)

* Add bindings for magit-status (`C-c g`) and different string replacements (`C-c r s`, `C-c r r`).
* Turn off notification from smart-mode-line about loading a color scheme.
* No more special settings for yasnippets. It works out of the box.

## 0.5.0 (2016-02-12)

* Dynamic org-mode's todo files and some other settings for org-mode.
* Change mode-line to smart-mode-line.
* Added shortcut `C-c m` to switch between js-mode and html-mode.
* No more `M-z` for undo. Now it is zap-to-char again. Use standart `C-/` for undo.

## 0.4.0 (2015-09-07)

* Load yasnippets only from `~/.emacs.d/snippets` directory.
* Commented print in use-package function.
* Use newer solarized theme (it works only in Emacs 24).

## 0.3.0 (2015-03-02)

* Use `C-c C-x C-k` to `(org-cut-subtree)` and not shadow
  `C-x C-k` which by default kills region.
* APPT and DELEGATED statuses were replaced with PAUSED in
  org mode.

## 0.2.0 (2015-02-04)

Add package bm – [visual bookmarks](https://github.com/joodland/bm) with bindings:

* `C-c b` toggles bookmark.
* `C-c <up>` goes to previous bookmark.
* `C-c <down>` goes to next bookmark.

## 0.1.0 (2015-01-14)

Initial release.
