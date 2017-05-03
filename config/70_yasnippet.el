 ;; helm-yasnippet
(require 'yasnippet)
(setq yas-snippet-dirs
      '("~/.dotfiles/.emacs.d/mysnippets"  ;; 自作スニペット
        yas-installed-snippets-dir         ;; package に最初から含まれるスニペット
        ))
(require 'helm-c-yasnippet)
(setq helm-yas-space-match-any-greedy t)
;; (global-set-key (kbd "C-c y") 'helm-yas-complete)
(global-set-key (kbd "C-c y") 'company-yasnippet)
(push '("emacs.+/snippets/" . snippet-mode) auto-mode-alist)
(yas-global-mode 1)
