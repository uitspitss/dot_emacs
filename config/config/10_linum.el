;; linum-mode
(require 'linum)
(setq linum-format "%4d")
(set-face-attribute 'linum nil
                    :foreground "powder blue")

;; (global-linum-mode)
(add-hook 'prog-mode 'linum-mode)
