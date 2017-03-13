;;; 30_perl.el ---

(defalias 'perl-mode 'cperl-mode)

(add-hook 'cperl-mode-hook
          '(lambda ()
             (setq cperl-set-style "PerlStyle")

             (require 'perl-completion)
             (perl-completion-mode t)

             (add-to-list 'ac-sources 'ac-source-perl-completion)
             (local-set-key (kbd "C-c d") 'plcmp-cmd-show-doc-at-point)

             (setq woman-use-own-frame nil)
             (setq woman-manpath '("/usr/bin/man"))
             ))
