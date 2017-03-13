(require 'python)

(setq auto-mode-alist
      (append
       '(("\\.py$" . python-mode))
       auto-mode-alist))

(add-hook 'python-mode-hook
          '(lambda ()
             (setq indent-tabs-mode nil)
             (setq indent-level 4)
             (setq python-indent 4)
             (setq tab-width 4)))

(add-hook 'python-mode-hook 'highlight-indentation-current-column-mode)

(require 'jedi-core)
(setq jedi:complete-on-dot t)
(setq jedi:use-shortcuts t)
(add-hook 'python-mode 'jedi:setup)
(add-to-list 'company-backends 'company-jedi)

(add-hook 'python-mode-hook
          '(lambda ()
             (jedi-mode t)))

(require 'py-autopep8)
(setq py-autopep8-options '("--max-line-length=200"))
(setq flycheck-flake8-maximum-line-length 200)
(py-autopep8-enable-on-save)

;; docstring comment
(defun python-docstring-comment()
  (interactive)
  (let* ((begin-point (point-at-bol))
         (end-point (point-at-eol))
         (function-line (buffer-substring begin-point end-point))
         (space (format "    %s" (replace-regexp-in-string "def.*" "" function-line))))
    (goto-char end-point)
    (insert "\n")
    (insert (format "%s\"\"\"\n" space))
    (when (string-match ".*(\\(.+\\)):" function-line)
      (dolist (arg (split-string (match-string 1 function-line) ","))
        (if (not (equal arg "self"))
            (insert (format "%s:param TYPE %s:\n" space (replace-regexp-in-string "^\\s-+\\|\\s-+$" "" arg))))))
    (insert (format "%s:rtype: TYPE\n" space))
    (insert (format "%s\"\"\"" space))))

(define-key python-mode-map (kbd "C-c d") 'python-docstring-comment)


;; ;; mod 2015/07/15 auto-complete + jedi -> company + jedi
;; ;; epc
;; (require 'epc)

;; ;; jedi
;; (add-hook 'python-mode-hook 'jedi:setup)
;; (setq jedi:complete (kbd "C-M-/"))
;; (setq jedi:related-names (kbd "C-c l"))
;; (require 'jedi)




;; ;; not use 2014/06/01 , lazy
;; ;; (setq jedi:complete-on-dot t)

;; ;; (if (eq system-type 'gnu/linux) (setenv "PYTHONPATH" "/usr/local/lib/python2.7/site-packages")) ;for linux


;; (define-key global-map [c-m/tab] 'jedi:complete)

;; (setq jedi:tooltip-method 'nil)
;; (set-face-attribute 'jedi:highlight-function-argument nil
;;                     :foreground "green")


;; ;; python-mode affection
;; (define-key global-map [C-tab] 'other-window)
;; (define-key global-map [C-S-iso-lefttab] (lambda () (interactive) (other-window -1)))


;; ;; Complete the closing pair
;; (defun electric-pair ()
;;   "Insert character pair without sournding spaces"
;;   (interactive)
;;   (let (parens-require-spaces)
;;     (insert-pair)))

;; ;; ;; python.el
;; ;; (add-hook
;; ;;  'python-mode-hook
;; ;;  '(lambda ()
;; ;;     (define-key python-mode-map "\C-m" 'newline-and-indent)
;; ;;     (define-key python-mode-map "\M-\"" 'electric-pair)
;; ;;     (define-key python-mode-map "\M-\'" 'electric-pair)
;; ;;     (define-key python-mode-map "\M-[" 'electric-pair)
;; ;;     (define-key python-mode-map "\M-{" 'electric-pair)
;; ;;     (define-key python-mode-map "\M-(" 'electric-pair)
;; ;;     (define-key inferior-python-mode-map "\t" 'python-complete-symbol)
;; ;;     ))

;; (defun python-back-indent ()
;;   (interactive)
;;   (let ((current-pos (point))
;;         (regexp-str (format " +\\{%d\\}" python-indent)))
;;    (save-excursion
;;      (beginning-of-line)
;;      (when (re-search-forward regexp-str current-pos t)
;;        (beginning-of-line)
;;        (delete-char python-indent)))))
;; (define-key python-mode-map (kbd "<backtab>") 'python-back-indent)
