;; quickrun
(require 'quickrun)

(global-set-key (kbd "C-c r") 'quickrun)
(global-set-key (kbd "C-c R") 'quickrun-region)
(global-set-key (kbd "C-c s") 'quickrun-shell)
(global-set-key (kbd "C-c a") 'quickrun-with-arg)

(setq quickrun-focus-p nil)
(setq quickrun-timeout-seconds -1)

(push '("*quickrun*" :position right :width 0.2 :noselect t :stick t) popwin:special-display-config)
(push '("*eshell-quickrun*" :position bottom :height 0.2 :stick t) popwin:special-display-config)
