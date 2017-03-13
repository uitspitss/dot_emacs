;; helm
(when (require 'helm-config nil t)
  (global-set-key (kbd "C-;") 'helm-mini)
  (global-set-key (kbd "M-r") 'helm-resume)
  (global-set-key (kbd "M-y") 'helm-show-kill-ring)
  (global-set-key (kbd "C-x b") 'helm-for-files)
  (global-set-key (kbd "C-x C-r") 'helm-recentf)
  ;; (global-set-key (kbd "C-x C-f") 'helm-find-files)

  ;; (when (require 'gist nil t)
  ;;   (when (require 'helm-gist nil t)
  ;;     )
  ;;   )
  ;; (when (require 'helm-git nil t)
  ;;   (global-set-key (kbd "C-x C-g") 'helm-git-find-files)
  ;;   )
  ;; (when (require 'helm-ls-git nil t)
  ;;   )
  ;; (when (require 'helm-themes nil t)
  ;;   )
  ;; (when (require 'helm-c-moccur nil t)
  ;;   (global-set-key (kbd "M-o") 'helm-c-moccur-occur-by-moccur)
  ;;   (global-set-key (kbd "C-M-o") 'helm-c-moccur-dmoccur)
  ;;   ;; (global-set-key (kbd "C-M-s") 'helm-c-moccur-isearch-forward)
  ;;   ;; (global-set-key (kbd "C-M-r") 'helm-c-moccur-isearch-backward)
  ;;   )
  ;; (when (require 'helm-descbinds nil t)
  ;;   (helm-descbinds-install)
  ;;   )
  (when (require 'helm-migemo nil t)
    (define-key global-map [(control ?:)] 'helm-migemo)
    )
  )

(eval-after-load 'helm
  '(progn
     (define-key helm-map (kbd "C-h") 'delete-backward-char)
     ))

;; helm-alc
(defun helm-alc:init ()
  (with-current-buffer (helm-candidate-buffer 'global)
    (let ((ret (call-process-shell-command "look ." nil t)))
      (unless (zerop ret)
        (error "Failed look ")))))

(defun helm-alc:action (word)
  (loop for marked in (helm-marked-candidates)
        for url = (format "http://eow.alc.co.jp/%s/UTF-8/?ref=sa" marked)
        do
        (browse-url url)))

(defvar helm-c-source-alc
  '((name . "alc")
    (init . helm-alc:init)
    (candidates-in-buffer)
    (candidate-number-limit . 100)
    (action . helm-alc:action)
    (requires-pattern . 2)))

(defun helm-alc ()
  (interactive)
  (helm :sources '(helm-c-source-alc) :buffer "*helm alc*"))


;;; Enable helm-gtags-mode
(require 'helm-gtags)
(add-hook 'c-mode-hook 'helm-gtags-mode)
(add-hook 'c++-mode-hook 'helm-gtags-mode)
(add-hook 'python-mode-hook 'helm-gtags-mode)
(add-hook 'ruby-mode-hook 'helm-gtags-mode)
(add-hook '-mode-hook 'helm-gtags-mode)

;; customize
(custom-set-variables
 '(helm-gtags-path-style 'relative)
 '(helm-gtags-ignore-case t)
 '(helm-gtags-auto-update t))

;; key bindings
(eval-after-load "helm-gtags"
  '(progn
     (define-key helm-gtags-mode-map (kbd "M-t") 'helm-gtags-find-tag)
     (define-key helm-gtags-mode-map (kbd "M-r") 'helm-gtags-find-rtag)
     (define-key helm-gtags-mode-map (kbd "M-s") 'helm-gtags-find-symbol)
     (define-key helm-gtags-mode-map (kbd "M-g M-p") 'helm-gtags-parse-file)
     (define-key helm-gtags-mode-map (kbd "C-c <") 'helm-gtags-previous-history)
     (define-key helm-gtags-mode-map (kbd "C-c >") 'helm-gtags-next-history)
     (define-key helm-gtags-mode-map (kbd "M-,") 'helm-gtags-pop-stack)))

;; helm-pydoc
(require 'helm-pydoc)

;; disalble auto_comp for path
(custom-set-variables '(helm-ff-auto-update-initial-value nil))
;; TAB comp
(define-key helm-c-read-file-map (kbd "TAB") 'helm-execute-persistent-action)
