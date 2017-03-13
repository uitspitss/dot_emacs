;; c-mode, c++-mode
(add-hook 'c-mode-common-hook
          '(lambda ()
             (c-set-style "bsd")
             (setq indent-tabs-mode nil)
             (setq c-basic-offset 4)
             ))

(setq auto-mode-alist
      (append
       '(("\\.c$" . c-mode))
       '(("\\.h$" . c++-mode))
       '(("\\.cpp$" . c++-mode))
       auto-mode-alist))

(require 'irony)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'c++-mode-hook 'irony-mode)
(add-to-list 'company-backends 'company-irony)
