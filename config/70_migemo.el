(require 'migemo)
(setq migemo-options '("-q" "--emacs"))

;; Set your installed path
(when (eq system-type 'linux)
(setq migemo-command "cmigemo")
  (setq migemo-dictionary "/usr/share/cmigemo/utf-8/migemo-dict")
)
(when (eq system-type 'windows-nt)
  (setq migemo-command "C:/Program Files/cmigemo/cmigemo.exe")
  (setq migemo-options '("-q" "--emacs" "-i" "\a"))
  (setq migemo-dictionary (expand-file-name "~/.emacs.d/windows/cmigemo-default-win64/dict/utf-8/migemo-dict"))
)
(when (eq system-type 'darwin)
  (setq migemo-command "/usr/local/bin/cmigemo")
  (setq migemo-dictionary "/usr/local/share/migemo/utf-8/migemo-dict") ;for mac
)



(setq migemo-user-dictionary nil)
(setq migemo-regex-dictionary nil)
(setq migemo-use-pattern-alist t)
(setq migemo-use-frequent-pattern-alist t)
(setq migemo-pattern-alist-length 1000)
(setq migemo-coding-system 'utf-8)
(load-library "migemo")
(migemo-init)


;; mac completetry action
;; (require 'migemo)
;; (setq migemo-options '("-q" "--emacs"))
;; (setq migemo-dictionary "/usr/local/share/migemo/utf-8/migemo-dict")
;; (setq migemo-user-dictionary nil)
;; (setq migemo-coding-system 'utf-8-unix)
;; (setq migemo-regex-dictionary nil)
;; (load-library "migemo")
;; (migemo-init)
