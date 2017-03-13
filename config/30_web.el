(require 'web-mode)

(setq auto-mode-alist
      (append
       '(("\\.html$" . web-mode))
       '(("\\.tpl$" . web-mode))
       auto-mode-alist))

(setq web-mode-markup-indent-offset 2)
(setq web-mode-css-indent-offset 2)
(setq web-mode-code-indent-offset 2)
(setq web-mode-attr-indent-offset 2)

(setq web-mode-comment-style 2)

(setq web-mode-enable-css-colorization t)

(setq web-mode-enable-current-column-highlight t)
(setq web-mode-enable-current-element-highlight t)

(setq web-mode-enable-engine-detection t)

(define-key web-mode-map (kbd "C-;") nil)
(define-key web-mode-map (kbd "C-c C-;")
  'web-mode-comment-or-uncomment)


;; php
(autoload 'php-mode "php-mode")
(setq auto-mode-alist
      (cons '("\\.php\\'" . php-mode) auto-mode-alist))
(setq php-mode-force-pear t)
(add-hook 'php-mode-user-hook
  '(lambda ()
     (setq php-manual-path "/usr/local/share/php/doc/html")
     (setq php-manual-url "http://www.phppro.jp/phpmanual/")

     (require 'php-completion)
     (php-completion-mode t)
     (define-key php-mode-map (kbd "C-M-/") 'phpcmp-complete)
     (make-local-variable 'ac-sources)
     (setq ac-sources '(
                        ac-source-words-in-same-mode-buffers
                        ac-source-php-completion
                        ac-source-filename
                        ))))

;; css
(autoload 'css-mode "css-mode")
(setq auto-mode-alist
      (cons '("\\.css\\'" . css-mode) auto-mode-alist))
(setq cssm-indent-function #'cssm-c-style-indenter)

;; ;; mmm-mode
;; (require 'mmm-auto)
;; (setq mmm-global-mode 'maybe)
;; (set-face-background 'mmm-default-submode-face nil) ;背景色が不要な場合
;; (mmm-add-classes
;;  '((embedded-css
;;     :submode css-mode
;;     :front "<style[^>]*>"
;;     :back "</style>")))
;; (mmm-add-mode-ext-class nil "\\.html\\'" 'embedded-css)

;; ;; mmm-mode in php
;; (require 'mmm-mode)
;; (setq mmm-global-mode 'maybe)
;; (mmm-add-mode-ext-class nil "\\.php?\\'" 'html-php)
;; (mmm-add-classes
;;  '((html-php
;;     :submode php-mode
;;     :front "<\\?\\(php\\)?"
;;     :back "\\?>")))
;; (add-to-list 'auto-mode-alist '("\\.php?\\'" . xml-mode))

;; zencoding -> emmet 2013/11/07
(require 'emmet-mode)
(add-hook 'web-mode-hook 'emmet-mode)
(add-hook 'css-mode-hook  'emmet-mode) ;; CSSにも使う
(add-hook 'emmet-mode-hook (lambda () (setq emmet-indentation 2))) ;; indent はスペース2個
(define-key emmet-mode-keymap (kbd "C-i") 'emmet-expand-line)
(eval-after-load "emmet-mode"
  '(define-key emmet-mode-keymap (kbd "C-j") nil)) ;; C-j は newline のままにしておく

;; (keyboard-translate ?\C-i ?\H-i) ;;C-i と Tabの被りを回避
;; (define-key emmet-mode-keymap (kbd "H-i") 'emmet-expand-line) ;; C-i で展開

;; ;; zencoding
;; (require 'zencoding-mode)
;; ;; (add-hook 'sgml-mode-hook 'zencoding-mode)
;; ;; (add-hook 'html-mode-hook 'zencoding-mode)
;; (add-hook 'web-mode-hook 'zencoding-mode)
;; ;; (add-hook 'php-mode-hook 'zencoding-mode)
;; (define-key zencoding-mode-keymap (kbd "C-M-/") 'zencoding-expand-line)
;; (define-key zencoding-mode-keymap (kbd "C-j") 'newline-and-indent)


;; (setq zencoding-indentation 2)

;; (setq zencoding-block-tags
;;       (append (list
;;                "article"
;;                "section"
;;                "aside"
;;                "nav"
;;                "figure"
;;                "address"
;;                "header"
;;                "footer")
;;               zencoding-block-tags))
;; (setq zencoding-inline-tags
;;       (append (list
;;                "textarea"
;;                "small"
;;                "time" "del" "ins"
;;                "sub"
;;                "sup"
;;                "i" "s" "b"
;;                "ruby" "rt" "rp"
;;                "bdo"
;;                "iframe" "canvas"
;;                "audio" "video"
;;                "ovject" "embed"
;;                "map"
;;                )
;;               zencoding-inline-tags))
;; (setq zencoding-self-closing-tags
;;       (append (list
;;                "wbr"
;;                "object"
;;                "source"
;;                "area"
;;                "param"
;;                "option"
;;                )
;;               zencoding-self-closing-tags))
