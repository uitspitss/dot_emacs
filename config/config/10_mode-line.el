;; display funcition on mode-line
(which-function-mode 1)

;; mode-line style
(defvar mode-line-cleaner-alist
  '( ;; For minor-mode, first char is 'space'
    (anzu-mode . "")
    (yas-minor-mode . " Ys")
    (paredit-mode . " Pe")
    (eldoc-mode . "")
    (abbrev-mode . "")
    (undo-tree-mode . " Ut")
    (elisp-slime-nav-mode . " EN")
    (helm-gtags-mode . " HG")
    (flymake-mode . " Fm")
    (flycheck-mode . " Fc")
    (helm-mode . " He")
    (git-gutter-mode . " Gg")
    (auto-complete-mode . " AC")
    (company-mode . " Com")
    (perl-completion-mode . " PC")
    (smartparens-mode . "()")
    ;; Major modes
    (lisp-interaction-mode . "Li")
    (python-mode . "Py")
    (ruby-mode   . "Rb")
    (cperl-mode . "Pl")
    (emacs-lisp-mode . "El")
    (js2-mode . "JS2")
    (java-mode . "Ja")
    (markdown-mode . "Md")))

(defun clean-mode-line ()
  (interactive)
  (loop for (mode . mode-str) in mode-line-cleaner-alist
        do
        (let ((old-mode-str (cdr (assq mode minor-mode-alist))))
          (when old-mode-str
            (setcar old-mode-str mode-str))
          ;; major mode
          (when (eq mode major-mode)
            (setq mode-name mode-str)))))

(add-hook 'after-change-major-mode-hook 'clean-mode-line)


;; power-line
(require 'powerline)
(powerline-default-theme)

;; (setq powerline-arrow-shape 'curve)

(set-face-attribute 'mode-line          nil :box nil)
(set-face-attribute 'mode-line-inactive nil :box nil)



;; ;; smart-mode-line
;; (setq sml/theme 'dark)
;; (sml/setup)
