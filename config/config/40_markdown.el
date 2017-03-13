(require 'markdown-mode)

(add-hook 'markdown-mode-hook
          '(lambda () (outline-minor-mode t)))

(setq auto-mode-alist
      (append '(("\\.md$" . markdown-mode)
                ("\\.markdown$" . markdown-mode)
                ;; ("\\.txt$" . markdown-mode)
                )
              auto-mode-alist))

;; (add-hook 'markdown-mode-hook
;;   (lambda()
;;     (define-key markdown-mode-map (kbd "C-i") 'markdown-cycle)
;;     (hide-sublevels 3)))
