;;; 20_company.el ---

(require 'company)

(global-company-mode +1)

(custom-set-variables
 '(company-idle-delay nil)
 '(company-minimum-prefix-length 1)
 '(company-selection-wrap-around t))


(set-face-attribute 'company-tooltip nil
                    :foreground "black" :background "lightgrey")
(set-face-attribute 'company-tooltip-common nil
                    :foreground "black" :background "lightgrey")
(set-face-attribute 'company-tooltip-common-selection nil
                    :foreground "white" :background "steelblue")
(set-face-attribute 'company-tooltip-selection nil
                    :foreground "black" :background "steelblue")
(set-face-attribute 'company-preview-common nil
                    :background nil :foreground "lightgrey" :underline t)
(set-face-attribute 'company-scrollbar-fg nil
                    :background "orange")
(set-face-attribute 'company-scrollbar-bg nil
                    :background "gray40")

(global-set-key (kbd "M-/") 'company-complete)
(global-set-key (kbd "C-M-/") 'company-dabbrev-code)
(global-set-key (kbd "C-M-i") 'company-ispell)

;; C-n, C-pで補完候補を次/前の候補を選択
(define-key company-active-map (kbd "C-n") 'company-select-next)
(define-key company-active-map (kbd "C-p") 'company-select-previous)
(define-key company-search-map (kbd "C-n") 'company-select-next)
(define-key company-search-map (kbd "C-p") 'company-select-previous)

(define-key company-active-map (kbd "C-h") 'delete-backward-char)
(define-key company-search-map (kbd "C-h") 'delete-backward-char)

;; C-sで絞り込む
(define-key company-active-map (kbd "C-s") 'company-filter-candidates)

;; TABで候補を設定
(define-key company-active-map (kbd "<tab>") 'company-complete-selection)

;; company-quickhelp
(company-quickhelp-mode +1)
(eval-after-load 'company
  '(define-key company-active-map (kbd "C-c h") #'company-quickhelp-manual-begin))

;; ;; 各種メジャーモードでも M-iで company-modeの補完を使う
;; (define-key emacs-lisp-mode-map (kbd "M-/") 'company-complete)


;; 大文字、小文字を考慮した補完
(defvar my/company-cmake-prefix nil)
(defun my/company-completion-started (unused)
  (let ((prefix (company-grab-symbol)))
    (setq my/company-cmake-prefix (and (not (string-empty-p prefix)) (string= prefix (upcase prefix))))))

(defun my/company-completion-finished (result)
  (when my/company-cmake-prefix
    (delete-char (- (length result)))
    (insert (upcase result))))

(defun my/cmake-mode-hook ()
  (add-hook 'company-completion-started-hook #'my/company-completion-started nil t)
  (add-hook 'company-completion-finished-hook #'my/company-completion-finished nil t))
(add-hook 'cmake-mode-hook #'my/cmake-mode-hook)
