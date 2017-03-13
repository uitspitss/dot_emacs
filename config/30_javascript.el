;;; 30_javascript.el ---
(setq auto-mode-alist
      (append '(("\\.js$" . js2-mode)
                ("\\.es6$" . js2-mode))
              auto-mode-alist))

(setq js-indent-level 2)
(setq js2-strict-missing-semi-warning nil)

;; tern
(add-hook 'js2-mode-hook 'tern-mode)
(add-to-list 'company-backends 'company-tern)
