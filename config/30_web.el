(require 'web-mode)

(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.css?\\'" . web-mode))


(setq web-mode-markup-indent-offset 2)
(setq web-mode-css-indent-offset 2)
(setq web-mode-code-indent-offset 2)
(setq web-mode-attr-indent-offset 2)

(setq web-mode-comment-style 2)

(setq web-mode-enable-css-colorization t)

(setq web-mode-enable-current-column-highlight t)
(setq web-mode-enable-current-element-highlight t)

(setq web-mode-enable-engine-detection t)
(setq web-mode-engines-alist
      '(("django"    . "\\.html\\'"))
)
(add-hook
 'web-mode-hook
 (lambda ()
   (setq-local electric-pair-inhibit-predicate
               `(lambda (c)
                  (if (char-equal c ?{) t (,electric-pair-inhibit-predicate c))))))


(define-key web-mode-map (kbd "C-;") nil)
(define-key web-mode-map (kbd "C-c C-;")
  'web-mode-comment-or-uncomment)

;; zencoding -> emmet 2013/11/07
(require 'emmet-mode)
(add-hook 'web-mode-hook 'emmet-mode)
(add-hook 'css-mode-hook  'emmet-mode) ;; CSSにも使う
(add-hook 'emmet-mode-hook (lambda () (setq emmet-indentation 2))) ;; indent はスペース2個
(eval-after-load "emmet-mode"
  '(define-key emmet-mode-keymap (kbd "C-j") nil)) ;; C-j は newline のままにしておく

(keyboard-translate ?\C-i ?\H-i) ;;C-i と Tabの被りを回避
(define-key emmet-mode-keymap (kbd "H-i") 'emmet-expand-line)



;; ;; php
;; (autoload 'php-mode "php-mode")
;; (setq auto-mode-alist
;;       (cons '("\\.php\\'" . php-mode) auto-mode-alist))
;; (setq php-mode-force-pear t)
;; (add-hook 'php-mode-user-hook
;;   '(lambda ()
;;      (setq php-manual-path "/usr/local/share/php/doc/html")
;;      (setq php-manual-url "http://www.phppro.jp/phpmanual/")

;;      (require 'php-completion)
;;      (php-completion-mode t)
;;      (define-key php-mode-map (kbd "C-M-/") 'phpcmp-complete)
;;      (make-local-variable 'ac-sources)
;;      (setq ac-sources '(
;;                         ac-source-words-in-same-mode-buffers
;;                         ac-source-php-completion
;;                         ac-source-filename
;;                         ))))

;; ;; css
;; (autoload 'css-mode "css-mode")
;; (setq auto-mode-alist
;;       (cons '("\\.css\\'" . css-mode) auto-mode-alist))
;; (setq cssm-indent-function #'cssm-c-style-indenter)

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
