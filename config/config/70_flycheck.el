;;; flycheck

(dolist (hook '(
                coffee-mode-hook
                css-mode-hook
                ;; emacs-lisp-mode-hook
                go-mode-hook
                haml-mode-hook
                html-mode-hook
                js2-mode-hook
                json-mode-hook
                lua-mode-hook
                cperl-mode-hook
                php-mode-hook
                python-mode-hook
                ruby-mode-hook
                sass-mode-hook
                yatex-mode-hook
                xml-mode-hook
                ))
  (add-hook hook 'flycheck-mode))
