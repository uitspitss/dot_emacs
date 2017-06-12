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


(setenv "PYTHONPATH" ":/Users/john/.anyenv/envs/pyenv/versions/2.6.9/lib/python2.6/site-packages:/Users/john/.anyenv/envs/pyenv/versions/2.7.11/lib/python2.7/site-packages:/Users/john/.anyenv/envs/pyenv/versions/2.7.12/lib/python2.7/site-packages:/Users/john/.anyenv/envs/pyenv/versions/2.7.6/lib/python2.7/site-packages:/Users/john/.anyenv/envs/pyenv/versions/2.7.8/lib/python2.7/site-packages:/Users/john/.anyenv/envs/pyenv/versions/3.2.5/lib/python3.2/site-packages:/Users/john/.anyenv/envs/pyenv/versions/3.4.3/lib/python3.4/site-packages:/Users/john/.anyenv/envs/pyenv/versions/3.5.2/lib/python3.5/site-packages:/Users/john/.anyenv/envs/pyenv/versions/3.6.0/lib/python3.6/site-packages:/Users/john/.anyenv/envs/pyenv/versions/3.6.1/lib/python3.6/site-packages:/Users/john/.anyenv/envs/pyenv/versions/TensorFlow/lib/python3.5/site-packages:/Users/john/.anyenv/envs/pyenv/versions/captcha/lib/python3.5/site-packages:/Users/john/.anyenv/envs/pyenv/versions/cui_clock/lib/python3.6/site-packages:/Users/john/.anyenv/envs/pyenv/versions/django/lib/python3.5/site-packages:/Users/john/.anyenv/envs/pyenv/versions/flask-lesson/lib/python3.5/site-packages:/Users/john/.anyenv/envs/pyenv/versions/flask-planetarium/lib/python3.5/site-packages:/Users/john/.anyenv/envs/pyenv/versions/learning/lib/python3.6/site-packages:/Users/john/.anyenv/envs/pyenv/versions/mysql/lib/python3.5/site-packages:/Users/john/.anyenv/envs/pyenv/versions/recaptcha/lib/python3.6/site-packages:/Users/john/.anyenv/envs/pyenv/versions/session/lib/python3.6/site-packages:/Users/john/.anyenv/envs/pyenv/versions/test/lib/python3.6/site-packages:/Users/john/.anyenv/envs/pyenv/versions/tf/lib/python3.6/site-packages:/Users/john/.anyenv/envs/pyenv/versions/tf-ocr/lib/python3.6/site-packages")

(defun my/python-mode-hook ()
  (add-to-list 'company-backends 'company-jedi))
(add-hook 'python-mode-hook 'my/python-mode-hook)

(require 'py-autopep8)
(setq py-autopep8-options '("--max-line-length=200"))
(add-hook 'python-mode-hook 'py-autopep8-enable-on-save)

;; ;; pyenv-mode + pyenv-mode-auto
;; (pyenv-mode)
;; (require 'pyenv-mode-auto)

;; ;; jedi:*を呼ぶとauto-complete版のjedi.elが読み込まれるみたいなのでCO 2017-5-13(Sat)
;; (require 'jedi-core)
;; (add-hook 'python-mode-hook 'jedi:setup)
;; (setq jedi:complete-on-dot t)
;; (setq jedi:use-shortcuts t)

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
(define-key python-mode-map (kbd "C-M->") 'python-indent-shift-right)
(define-key python-mode-map (kbd "C-M-<") 'python-indent-shift-left)
(define-key python-mode-map (kbd "C-m") 'newline)


;; (defun load-pythonpath ()
;;   (shell-command "source ~/.zshrc")
;;   (setenv "PYTHONPATH" (shell-command-to-string "echo_pythonpath"))
;;   )
;; (load-pythonpath)

;; (defun reload-pythonpath ()
;;   (interactive)
;;   (setq versions (concat (shell-command-to-string "echo $HOME") "/.anyenv/envs/pyenv/versions/"))
;;   (setq local
;;         (string= (replace-regexp-in-string "\n+$" "" (shell-command-to-string "pyenv local"))
;;                  "pyenv: no local version configured for this directory"))
;;   (setq pyenv
;;         (replace-regexp-in-string
;;          "\n+$" ""
;;          (if local
;;              (shell-command-to-string "pyenv global")
;;            (shell-command-to-string "pyenv local"))))
;;   (string= local "pyenv: no local version configured for this directory")
;;   (setq envdir (file-symlink-p (concat versions pyenv)))
;;   (if envdir
;;       (setenv "PYTHONPATH" (concat envdir "/lib/python"
;;                                    (substring (elt (split-string envdir "/") (- (length (split-string envdir "/")) 3)) 0 3)
;;                                    "/site-packages"
;;                                    ))
;;     (setenv "PYTHONPATH" (concat versions pyenv "/lib/" (substring pyenv 0 3) "/site-packages"))
;;     )
;;   )


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
