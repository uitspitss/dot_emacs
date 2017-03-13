;;; 99_fina.el ---

(load-theme 'material t)
;; (load-theme 'aurora t)
(global-rainbow-delimiters-mode)

;; ;; theme-modern
;; (load-theme 'aalto-dark t t)
;; (enable-theme 'aalto-dark)

;; japanese
(set-language-environment "Japanese")

;; coding utf-8
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(prefer-coding-system 'utf-8)
(setq file-name-coding-system 'utf-8)
