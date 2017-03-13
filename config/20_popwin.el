;; popwin-el
(require 'popwin)

(setq display-buffer-function 'popwin:display-buffer)
(push '(direx:direx-mode :position left :width 25) popwin:special-display-config)
;; (push '("helm" :regexp t :position bottom :height 0.4) popwin:special-display-config)
(push '("anything" :regexp t :position bottom :height 0.4) popwin:special-display-config)
;; (push '("perldoc" :regexp t :position right :width 0.4) popwin:special-display-config)
(push '("jedi:doc" :regexp t :position right :width 0.4) popwin:special-display-config)
(push '("*Completions*" :height 0.4) popwin:special-display-config)
(push '("*compilation*" :height 0.4 :noselect t :stick t) popwin:special-display-config)
(push '("*Codic Result*" :height 0.2 :noselect t) popwin:special-display-config)
(push '("*Google Maps*" :position right :width 0.4) popwin:special-display-config)
(define-key global-map (kbd "C-c q") 'popwin:display-last-buffer)


;;; import-popwin
(require 'import-popwin)
(global-set-key (kbd "M-g M-i") 'import-popwin)

;; direx
(require 'direx)
(global-set-key (kbd "C-x C-j") 'direx:jump-to-directory-other-window)
(setq direx:leaf-icon "  "
      direx:open-icon "▾ "
      direx:closed-icon "▸ ")
