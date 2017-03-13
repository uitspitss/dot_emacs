(require 'markdown-mode)

(add-hook 'markdown-mode-hook
          '(lambda () (outline-minor-mode t)))

(setq auto-mode-alist
      (append '(("\\.md$" . markdown-mode)
                ("\\.markdown$" . markdown-mode)
                ;; ("\\.txt$" . markdown-mode)
                )
              auto-mode-alist))

