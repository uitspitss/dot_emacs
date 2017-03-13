;; yatex
;; old key binding
(setq YaTeX-inhibit-prefix-letter nil)
(add-hook ' yatex-mode-hook
 '(
    lambda () (auto-fill-mode -1)
  )
)
(setq auto-mode-alist
      (cons (cons "\\.tex$" 'yatex-mode) auto-mode-alist))
(autoload 'yatex-mode "yatex" "Yet Another LaTeX mode" t)
;;TeX typeset
(setq tex-command "platex")
;;dvi preview
(setq dvi2-command "xdvi -watch 5 -bg whitesmoke -paper a4 -geometry 680x720+680+0 -mousemode 2")
;; Kanji code
;;;   1=Shift JIS
;;;   2=JIS
;;;   3=EUC
;;;   4=UTF-8
(setq YaTeX-kanjicode nil)
;;use LaTeX2e and AMS-LaTeX
(setq YaTeX-use-LaTeX2e t)
(setq YaTeX-use-AMS-LaTeX t)
;;font latex hook
;(add-hook 'yatex-mode-hook
;         '(lambda () (require 'font-latex)
;            (font-latex-setup)))
;;RefTeX mode
;(add-hook 'yatex-mode-hook '(lambda () (reftex-mode t)))
;;dictionary  only use user's dictionary
(setq YaTeX-nervous nil)
;;color
(setq YaTeX-use-font-lock t)

;; dvi -> pdf
(setq dviprint-command-format "dvipdfmx %s")

;; latexmk
; (setq tex-command "latexmk -dvi")

;;mendex
(setq makeindex-command "mendex")

;; template
(setq YaTeX-template-file "~/Dropbox/Templates/latex/report.tex")

;; section color
;; (setq YaTeX-hilit-sectioning-face '(when light version, forecolor/backcolor when dark version, forecolor/backcolor))
(setq YaTeX-hilit-sectioning-face '(white/snow3 snow1/snow3))
;; (add-hook 'yatex-mode-hook
;; '(lambda () (require 'font-latex)
;;             (font-latex-setup)
;;             (progn
;;               (modify-syntax-entry ?% "<" (syntax-table))
;;               (modify-syntax-entry 10 ">" (syntax-table))
;;               (make-variable-buffer-local 'outline-level)
;;               (setq outline-level 'latex-outline-level)
;;               (make-variable-buffer-local 'outline-regexp)
;;               (setq outline-regexp
;;                     (concat "[  \t]*\\\\\\(documentstyle\\|documentclass\\|chapter\\|"
;;                            "section\\|subsection\\|subsubsection\\|paragraph\\)"
;;                             "\\*?[ \t]*[[{]")
;;                     ))))
(setq
      YaTeX-default-pop-window-height 7 ; window height when typeset
      YaTeX-skip-default-reader  t ; non-display minibuffer
      YaTeX-latex-message-code 'utf-8
;      YaTeX::ref-labeling-section-level 3 ; labeling level
      )

;;; begin type define key
(setq yatex-mode-load-hook
      '(lambda()
         (YaTeX-define-begend-key "be" "eqnarray")
         (YaTeX-define-begend-key "bE" "eqnarray*")
         (YaTeX-define-begend-key "ba" "align")
         (YaTeX-define-begend-key "bA" "align*")
         (YaTeX-define-begend-key "bg" "gather")
         (YaTeX-define-begend-key "bf" "figure")
         (YaTeX-define-begend-key "bF" "frame")
	 ))

(add-hook 'yatex-mode-hook
          '(lambda ()
             ;; (require 'yatexprc)
             (turn-off-auto-fill) ; 勝手に改行しない
             ;; (define-key YaTeX-mode-map [?\s-t] 'YaTeX-typeset-buffer)
             ;; (define-key YaTeX-mode-map [?\s-b] 'YaTeX-typeset-buffer)
             ;; (define-key YaTeX-mode-map [?\s-P] 'YaTeX-preview)
             ;; (define-key YaTeX-mode-map [?\s-R] 'skim-forward-search)
             ;; (define-key YaTeX-mode-map (kbd "C-c s") 'skim-forward-search)
             ;; (define-key YaTeX-mode-map [?\s-B]
             ;;   (lambda 	() (interactive)
             ;; 	 (YaTeX-call-builtin-on-file "BIBTEX" bibtex-command)))
             ;; (define-key YaTeX-mode-map [?\s-I]
             ;;   (lambda 	() (interactive)
             ;; 	 (YaTeX-call-builtin-on-file "MAKEINDEX" makeindex-command)))
             ;; (define-key YaTeX-mode-map "\t" 'latex-indent-command)
             ;; (define-key YaTeX-mode-map (kbd "C-c TAB") 'latex-indent-region-command)
             ;; (define-key YaTeX-mode-map [?\s-_] 'MyTeX-insert-subscript_rm)
             ;; (define-key YaTeX-mode-map [?\C-\s-J] 'YaTeX-goto-corresponding-*)
             ;; (define-key YaTeX-mode-map (kbd "C-c d") 'MyTeX-latexmk-cleanup)
             ;; (define-key YaTeX-mode-map (kbd "C-c j") 'MyTeX-jump-to-next)
             ;; (define-key YaTeX-mode-map [?\s-H] 'YaTeX-display-hierarchy)
             ;; (define-key YaTeX-mode-map [?\s-1] 'YaTeX-visit-main)
             ;; (define-key YaTeX-mode-map [?\s-2] 'MyTeX-switch-to-previousbuffer)
             ;; (define-key YaTeX-mode-map [?\M-\s-B] 'MyTool-open-bibdesk)
             ;; (define-key YaTeX-mode-map [?\s-ı] 'MyTool-open-bibdesk)
             ;; (define-key YaTeX-mode-map [?\M-\s-P] 'MyTeX-open-PreviewApp)
             ;; (define-key YaTeX-mode-map [?\s-∏] 'MyTeX-open-PreviewApp)
             ;; (define-key YaTeX-mode-map [?\s-\)] 'MyTeX-speech-region)
             ;; (define-key YaTeX-mode-map [?\s-C] 'MyTeX-open-article)
             ;; (ac-set-trigger-key "\C-TAB")
	     ))

;; add math-sign
(setq
YaTeX-math-sign-alist-private
'(
  ("q"         "Q"          "(Q)")
  ("z"         "Z"          "ZZ")
  ("t""text""text")
  ("qu"        "quad"         "__")
  ("qq"        "qquad"         "____")
  ("ls"        "varlimsup"     "___\nlim")
  ("li"        "varliminf"     "lim\n---")
  ("il"        "varinjlim"     "lim\n-->")
  ("pl"        "varprojlim"    "lim\n<--")
  ("st"        "text{ s.t. }" "s.t.")
  ("bigop"     "bigoplus"      "_\n(+)~")
  ("bigot"     "bigotimes"     "_\n(x)\n ~")
  ))
