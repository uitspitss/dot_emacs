;; -*- Mode: Emacs-Lisp; Coding: utf-8 -*-



;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

(when load-file-name
  (setq user-emacs-directory (file-name-directory load-file-name)))

(add-to-list 'load-path (locate-user-emacs-file "el-get/el-get"))
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

;; init
(el-get-bundle init-loader)

;; company
(el-get-bundle company-mode)
(el-get-bundle expez/company-quickhelp)
(el-get-bundle pos-tip)

;; helm
(el-get-bundle helm)
(el-get-bundle helm-swoop)
(el-get-bundle helm-gtags)
(el-get-bundle helm-pydoc)

;; japanese
(el-get-bundle ddskk)
(el-get-bundle migemo)

;; programming
(el-get-bundle flycheck)
(el-get-bundle highlight-indentation)

;; c/c++
(el-get-bundle company-irony :depends (company-mode))

;; shader
(el-get-bundle glsl-mode)

;; python
(el-get-bundle elpa:jedi-core)
(el-get-bundle company-jedi :depends (company-mode))
(el-get-bundle py-autopep8)

;; (el-get-bundle rejeep/f.el)
;; (el-get-bundle pythonic)
;; (el-get-bundle proofit404/pyenv-mode)
;; (el-get-bundle ssbb/pyenv-mode-auto)

;; (el-get-bundle virtualenvwrapper)
;; (el-get-bundle robert-zaremba/auto-virtualenvwrapper.el)
;; (el-get-bundle marcwebbie/auto-virtualenv :depends(pyvenv))

;; javascript
(el-get-bundle js2-mode)
(el-get-bundle company-tern :depends (company-mode))

;; php
(el-get-bundle ac-php)
(el-get-bundle stesie/company-php)

;; lua
(el-get-bundle lua-mode)

;; markdown
(el-get-bundle markdown-mode)

;; git
(el-get-bundle magit)
(el-get-bundle git-gutter)

;; ;; yatex
;; (el-get-bundle yatex)

;; json
(el-get-bundle json-mode)

;; quickrun
(el-get-bundle quickrun)

;; rainbow
(el-get-bundle rainbow-delimiters)

;; web
(el-get-bundle emmet-mode)
(el-get-bundle web-mode)
(el-get-bundle yaml-mode)

;; misc
(el-get-bundle smartrep)
(el-get-bundle openwith)
(el-get-bundle popup)
(el-get-bundle popwin)
(el-get-bundle yasnippet)
(el-get-bundle helm-c-yasnippet)
(el-get-bundle anzu)
(el-get-bundle windows)
(el-get-bundle multiple-cursors)
(el-get-bundle open-junk-file)
(el-get-bundle google-translate)


;; material-theme
(el-get-bundle material-theme)



;; ----------------------------------------------------

;; init-loader
(require 'init-loader)
(setq init-loader-show-log-after-init nil)
(init-loader-load "~/.emacs.d/config")


;; linux setting
(if (eq system-type 'gnu/linux)
    (progn))

;; windows setting
(if (eq system-type 'windows-nt)
    (progn
      (custom-set-variables
       '(initial-frame-alist
         (quote
          ((vertical-scroll-bars)
           (top  . 0)
           (left . 959)
           (width . 116)
           (height . 51)))))))

;; for mac
(when (eq system-type 'darwin)
  ;; CmdとOptの入れ替え
  (setq ns-command-modifier (quote meta))

  (custom-set-variables
   '(initial-frame-alist
     (quote
      ((vertical-scroll-bars)
       (top . 28)
       (left . 797)
       (width . 77)
       (height . 44))))))

;; GUI setting
(when window-system (progn))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 ;; '(anzu-deactivate-region t)
 ;; '(anzu-mode-lighter "")
 ;; '(anzu-replace-to-string-separator "")
 ;; '(anzu-search-threshold 1000)
 ;; '(anzu-use-migemo nil)
 ;; '(company-idle-delay nil)
 ;; '(company-minimum-prefix-length 1)
 ;; '(company-selection-wrap-around t)
 ;; '(custom-safe-themes nil)
 ;; '(helm-gtags-auto-update t)
 ;; '(helm-gtags-ignore-case t)
 ;; '(helm-gtags-path-style (quote relative))
 '(initial-frame-alist
   (quote
    ((vertical-scroll-bars)
     (top . 28)
     (left . 797)
     (width . 77)
     (height . 44))))
 ;; '(package-selected-packages
 ;;   (quote
 ;;    (material-theme google-translate open-junk-file multiple-cursors anzu helm-c-yasnippet yasnippet popwin openwith smartrep yaml-mode web-mode emmet-mode rainbow-delimiters quickrun json-mode yatex git-gutter magit markdown-mode lua-mode js2-mode virtualenvwrapper py-autopep8 jedi-core glsl-mode highlight-indentation flycheck migemo ddskk helm-pydoc helm-gtags helm-swoop helm)))
 '(safe-local-variable-values (quote ((engine . django))))
 )
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)
