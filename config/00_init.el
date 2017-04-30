;; -*- Mode: Emacs-Lisp; Coding: utf-8 -*-

;; (setq initial-frame-alist
;;       (append (list
;; 	       '(top . 0)
;; 	       '(left . 2)
;; 	       '(width . 83)
;; 	       '(height . 43)
;; 	       )
;; 	      initial-frame-alist))
;; (setq default-frame-alist initial-frame-alist)

;; disable beep
(setq ring-bell-function 'ignore)

;; transparency
(set-frame-parameter (selected-frame) 'alpha '(100 90))

;; dialog style
(fset 'yes-or-no-p 'y-or-n-p)

;; server start for emacs-client
(require 'server)
(unless (server-running-p)
  (server-start))

;; ;; session
;; (desktop-load-default)
;; (desktop-read)

;; ;; 以下の書式に従ってモードラインに日付・時刻を表示する
;; (setq display-time-string-forms
;;       '((format "%s/%s/%s(%s) %s:%s" year month day dayname 24-hours minutes)))
;; ;; display date before time
;; (setq display-time-kawakami-form t)
;; ;; 24 hours style
;; (setq display-time-24hr-format t)
;; ;; display time on mode-line
;; (display-time)

(electric-pair-mode +1)

;; ;; M-(
;; (custom-set-variables
;;  '(parens-require-spaces nil))

;; (defun my/insert-parentheses (arg)
;;   (interactive "P")
;;   (insert-parentheses (or arg 1)))
;; (global-set-key (kbd "M-(") 'my/insert-parentheses)

;; (defun my/insert-box-brackets (arg)
;;   (interactive "P")
;;   (insert-pair arg ?[ ?]))
;; (global-set-key (kbd "M-[") 'my/insert-box-brackets)

;; title bar
(setq frame-title-format (format "%%f"))

;; non-display start-up page
(setq inhibit-startup-message t)

;; japanese
(set-language-environment "Japanese")

(global-unset-key "\C-\\")

;; coding utf-8
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(prefer-coding-system 'utf-8)

;; escape sequence on shell-mode
(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;; common clipboard X11
(setq x-select-enable-clipboard t)

;; tab-width -> 4
(setq-default tab-width 4)

;; character tab -> space
(setq-default indent-tabs-mode nil)

;; enable tramp
(require 'tramp)

;; truncate on right of window
(setq truncate-partial-width-windows nil)

;; locale
(set-locale-environment nil)

;; key binding
(define-key global-map (kbd "C-h") 'delete-backward-char) ; delete
(define-key global-map (kbd "M-?") 'help-for-help)        ; help
(define-key global-map (kbd "C-c i") 'indent-region)      ; indent
(define-key global-map (kbd "C-c C-i") 'hippie-expand)    ; completion by abbrev_defs
(define-key global-map (kbd "C-c ;") 'comment-dwim)       ; commentout
(define-key global-map (kbd "M-C-g") 'grep)               ; grep
(define-key global-map (kbd "C-[ M-C-g") 'goto-line)      ; goto-line

(global-set-key (kbd "M-SPC") 'cycle-spacing)

;; normal search,replace -> regexp search,replace
;; (global-set-key (kbd "C-s") 'isearch-forward-regexp)
;; (global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "M-%") 'query-replace-regexp)

;; (global-set-key (kbd "C-M-s") 'isearch-forward)
;; (global-set-key (kbd "C-M-r") 'isearch-backward)
(global-set-key (kbd "C-M-%") 'query-replace)

(define-key global-map [?¥] [?\\])

;; (setq transient-mark-mode t)
(delete-selection-mode t)

(defun backward-kill-word-or-kill-region ()
  (interactive)
  (if (or (not transient-mark-mode) (region-active-p))
      (kill-region (region-beginning) (region-end))
    (backward-kill-word 1)))
(global-set-key "\C-w" 'backward-kill-word-or-kill-region)


;; recursive grep
(require 'grep)
(setq grep-command-before-query "grep -nH -r -e ")
(defun grep-default-command ()
  (if current-prefix-arg
      (let ((grep-command-before-target
             (concat grep-command-before-query
                     (shell-quote-argument (grep-tag-default)))))
        (cons (if buffer-file-name
                  (concat grep-command-before-target
                          " *."
                          (file-name-extension buffer-file-name))
                (concat grep-command-before-target " ."))
              (+ (length grep-command-before-target) 1)))
    (car grep-command)))
(setq grep-command (cons (concat grep-command-before-query " .")
                         (+ (length grep-command-before-query) 1)))

;; ;; isearch at point of word
;; (defvar isearch-initial-string nil)
;; (defun isearch-set-initial-string ()
;;   (remove-hook 'isearch-mode-hook 'isearch-set-initial-string)
;;   (setq isearch-string isearch-initial-string)
;;   (isearch-search-and-update))
;; (defun isearch-forward-at-point (&optional regexp-p no-recursive-edit)
;;   "Interactive search forward for the symbol at point."
;;   (interactive "P\np")
;;   (if regexp-p (isearch-forward regexp-p no-recursive-edit)
;;     (let* ((end (progn (skip-syntax-forward "w_") (point)))
;;            (begin (progn (skip-syntax-backward "w_") (point))))
;;       (if (eq begin end)
;;           (isearch-forward regexp-p no-recursive-edit)
;;         (setq isearch-initial-string (buffer-substring begin end))
;;         (add-hook 'isearch-mode-hook 'isearch-set-initial-string)
;;         (isearch-forward regexp-p no-recursive-edit)))))
;; (define-key isearch-mode-map "\C-w" 'isearch-forward-at-point)

(auto-image-file-mode t)
(menu-bar-mode -1)
(tool-bar-mode -1)
;; scroll step compete quickrun
(scroll-bar-mode -1)
(blink-cursor-mode 0)
(setq eval-expression-print-length nil)
(show-paren-mode 1)
(setq show-paren-style 'mixed)
(setq-default show-trailing-whitespace t)
(global-hl-line-mode t)
(column-number-mode t)
(line-number-mode t)
(setq kill-whole-line t)
(setq require-final-newline t)
(setq next-line-add-newlines nil)
(setq backup-inhibited t)
(setq delete-auto-save-files t)
(setq completion-ignore-case t)
(setq read-file-name-completion-ignore-case t)
(icomplete-mode 1)
(setq history-length 10000)
(savehist-mode 1)
(auto-compression-mode t)

(recentf-mode)
(setq recentf-max-saved-items 10000)
;; ;; recentf-ext
;; (when (require 'recentf-ext nil t)
;;   (setq recentf-max-saved-items 2000)
;;   (setq recentf-exclude '(".recentf"))
;;   (setq recentf-auto-cleanup 10)
;;   (setq recentf-auto-save-timer (run-with-idle-timer 30 t 'recentf-save-list))
;;   (recentf-mode 1))

;; ;; recentf-ext start-up
;; (add-hook 'after-init-hook (lambda()
;;     (recentf-open-files)
;;     ))

;; ;; キーバインド
;; (global-set-key (kbd "C-x C-r") 'recentf-open-files)



;; delete duplicate of history
(require 'cl)
(defun minibuffer-delete-duplicate ()
  (let (list)
    (dolist (elt (symbol-value minibuffer-history-variable))
      (unless (member elt list)
        (push elt list)))
    (set minibuffer-history-variable (nreverse list))))
(add-hook 'minibuffer-setup-hook 'minibuffer-delete-duplicate)


;; delete space at end of line when save file -> 10_whitespace.el
;; (add-hook 'before-save-hook 'delete-trailing-whitespace)


;; display function name
(which-function-mode 1)

;;; time stamp on headder
;;;   Time-stamp: <> or Time-stamp: " " in less than 9 lines
(require 'time-stamp)
(defun time-stamp-with-locale-c ()
  (let ((system-time-locale "C"))
    (time-stamp)
    nil))
(if (not (memq 'time-stamp-with-locale-c write-file-hooks))
    (add-hook 'write-file-hooks 'time-stamp-with-locale-c))
(setq time-stamp-format "%3a %3b %02d %02H:%02M:%02S %Z %:y")

;; ; other window [C-tab] [C-S-tab]
;; (define-key global-map[C-S-iso-lefttab] 'other-window)
;; (define-key global-map[C-tab] 'other-window)
;; (define-key global-map [C-S-iso-lefttab] (lambda () (interactive) (other-window -1)))

;; circular move window
(setq windmove-wrap-around t)
;; C-M-{h,j,k,l} windmove
(define-key global-map (kbd "C-M-k") 'windmove-up)
(define-key global-map (kbd "C-M-j") 'windmove-down)
(define-key global-map (kbd "C-M-l") 'windmove-right)
(define-key global-map (kbd "C-M-h") 'windmove-left)

(global-set-key (kbd "C-M-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "C-M-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "C-M-<down>") 'shrink-window)
(global-set-key (kbd "C-M-<up>") 'enlarge-window)

;; save cursor location
;; (require 'saveplace)
;; (setq-default save-place t)
(save-place-mode 1)

;; if file's name competition, add direcotry name
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)

;; kill pre-region [C-w] on minibuffer
(define-key minibuffer-local-completion-map (kbd "C-w") 'backward-kill-word)

;; close all buffers
(defun close-all-buffers ()
  (interactive)
  (mapc 'kill-buffer (buffer-list)))

;; revert all buffers
(defun revert-all-buffers ()
  (interactive)
  (let ((cbuf (current-buffer)))
    (dolist (buf (buffer-list))
      (if (not (buffer-file-name buf)) ;only the file which visit on path
          nil
        (switch-to-buffer buf)
        (revert-buffer t t)))
    (switch-to-buffer cbuf)
    ))

;; swap buffers
(defun swap-screen()
  "Swap two screen,leaving cursor at current window."
  (interactive)
  (let ((thiswin (selected-window))
        (nextbuf (window-buffer (next-window))))
    (set-window-buffer (next-window) (window-buffer))
    (set-window-buffer thiswin nextbuf)))
(defun swap-screen-with-cursor()
  "Swap two screen,with cursor in same buffer."
  (interactive)
  (let ((thiswin (selected-window))
        (thisbuf (window-buffer)))
    (other-window 1)
    (set-window-buffer thiswin (window-buffer))
    (set-window-buffer (selected-window) thisbuf)))
(global-set-key (kbd "C-x w") 'swap-screen)

;; (require 'package)
;; (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
;; ;; (add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)
;; (package-initialize)

;;; don't erase *scratch* buffer
(defun my-make-scratch (&optional arg)
  (interactive)
  (progn
    (set-buffer (get-buffer-create "*scratch*"))
    (funcall initial-major-mode)
    (erase-buffer)
    (when (and initial-scratch-message (not inhibit-startup-message))
      (insert initial-scratch-message))
    (or arg (progn (setq arg 0)
                   (switch-to-buffer "*scratch*")))
    (cond ((= arg 0) (message "*scratch* is cleared up."))
          ((= arg 1) (message "another *scratch* is created")))))

(add-hook 'kill-buffer-query-functions
          (lambda ()
            (if (string= "*scratch*" (buffer-name))
                (progn (my-make-scratch 0) nil)
              t)))

(add-hook 'after-save-hook
          (lambda ()
            (unless (member (get-buffer "*scratch*") (buffer-list))
              (my-make-scratch 1))))

;;; ispell
(require 'ispell)
(setq-default ispell-program-name "aspell")
(eval-after-load "ispell"
  '(add-to-list 'ispell-skip-region-alist '("[^\000-\377]+")))
;; flyspell
(autoload 'flyspell-mode "flyspell" "spell checking at runtime")

;; load environment variables
;; (let ((envs '("PATH" "VIRTUAL_ENV" "GOROOT" "GOPATH" "path")))
;;   (exec-path-from-shell-copy-envs envs))

(exec-path-from-shell-initialize)

;; (defun set-exec-path-from-shell-PATH ()
;;   "Set up Emacs' `exec-path' and PATH environment variable to match that used by the user's shell.

;; This is particularly useful under Mac OSX, where GUI apps are not started from a shell."
;;   (interactive)
;;   (let ((path-from-shell (replace-regexp-in-string "[ \t\n]*$" "" (shell-command-to-string "$SHELL --login -i -c 'echo $PATH'"))))
;;     (setenv "PATH" path-from-shell)
;;     (setq exec-path (split-string path-from-shell path-separator))))

;; (set-exec-path-from-shell-PATH)

