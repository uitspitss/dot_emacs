;; windows.el before popwin
(setq win:use-frame nil
      win:quick-selection nil
      ;; use a-z as prefix.
      win:base-key ?`
      win:switch-prefix "\C-z"
      win:max-configs 27)
(require 'windows)
(win:startup-with-window)
(define-key win:switch-map ";" 'win-switch-menu)
(define-key ctl-x-map "C" 'see-you-again)
