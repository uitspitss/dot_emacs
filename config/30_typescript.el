;;; 30_typescript.el ---

(add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-mode))

(require 'tide)
(add-hook 'typescript-mode-hook
          (lambda ()
            (tide-setup)
            (flycheck-mode t)
            (setq flycheck-check-syntax-automatically '(save mode-enabled))
            (eldoc-mode t)
            (company-mode-on)))
