;; ddskk
(require 'skk)
(require 'skk-autoloads)
(require 'skk-hint)
(require 'skk-study)
(require 'context-skk)
(require 'skk-tut)
;; (setq skk-tut-file "~/.emacs.d/plugins/ddskk-15.1/etc/SKK.tut")
(setq skk-large-jisyo "~/.emacs.d/SKK-JISYO.L")

(global-set-key (kbd "C-x j") 'skk-mode)
(setq skk-sticky-key ";")

(setq skk-server-prog "/Users/john/.anyenv/envs/rbenv/shims/google-ime-skk") ; google-ime-skkの場所
(setq skk-server-inhibit-startup-server nil) ; 辞書サーバが起動していなかったときに Emacs からプロセスを立ち上げる
(setq skk-server-host "localhost") ; サーバー機能を利用
(setq skk-server-portnum 55100)     ; ポートはgoogle-ime-skk
(setq skk-share-private-jisyo t)   ; 複数 skk 辞書を共有

;; 日本語表示しない
(setq skk-japanese-message-and-error nil)
;; メニューを日本語にしない
(setq skk-show-japanese-menu nil)
;; 注釈の表示
(setq skk-show-annotation nil)
;; インジケータを左端に.
(setq skk-status-indicator 'left)
;; skk モードの表示のカスタマイズ
(setq skk-latin-mode-string "[aa]")
(setq skk-hiragana-mode-string "[jj]")
(setq skk-katakana-mode-string "[qq]")
(setq skk-jisx0208-latin-mode-string "[AA]")
(setq skk-jisx0201-mode-string "[QQ]")
(setq skk-indicator-use-cursor-color nil)
(setq skk-show-inline 'vertical)
(when skk-show-inline
  (if (boundp 'skk-inline-show-face)
      (setq
       skk-inline-show-background-color "#78909c")))

;; ;; カーソルには色をつけない
;; (setq skk-use-color-cursor nil)

;; ;; 半角カナを入力
;; (setq skk-use-jisx0201-input-method t)
;; Enter で改行しない
(setq skk-egg-like-newline t)
;;"「"を入力したら"」"も自動で挿入
(setq skk-auto-insert-paren t)
;; 句読点変換ルール
(setq skk-kuten-touten-alist
  '(
    (jp . ("。" . "、" ))
    (en . ("." . ","))
    ))

(setq skk-kutouten-type 'jp)
;; 全角記号の変換
(setq skk-rom-kana-rule-list
      (append skk-rom-kana-rule-list
              '(("!" nil "!")
                (":" nil ":")
                (";" nil ";")
                ("?" nil "?")
                ("z " nil "　")
                ("\\" nil "\\")
                )))
;; 全角英語モードで U+FF0D, U+FF5E を入力する?
;; (when (not (string< mule-version "6.0"))
;;   (aset skk-jisx0208-latin-vector ?- (string #xFF0D))
;;   (aset skk-jisx0208-latin-vector ?~ (string #xFF5E)))
;; @で挿入する日付表示を西暦&半角に
(setq skk-date-ad t)
(setq skk-number-style nil)
;; 送り仮名が厳密に正しい候補を優先
(setq skk-henkan-strict-okuri-precedence t)
;; ;; 辞書の共有
;; (setq skk-share-private-jisyo t)

;; ddskk 起動時のみ, インクリメンタルサーチを使用
;;; Isearch setting.
(add-hook 'isearch-mode-hook
          #'(lambda ()
              (when (and (boundp 'skk-mode)
                         skk-mode
                         skk-isearch-mode-enable)
                (skk-isearch-mode-setup))))
(add-hook 'isearch-mode-end-hook
          #'(lambda ()
              (when (and (featurep 'skk-isearch)
                         skk-isearch-mode-enable)
                (skk-isearch-mode-cleanup))))
;; migemo を使うので skk-isearch にはおとなしくしていて欲しい
(setq skk-isearch-start-mode 'latin)
(add-hook 'isearch-mode-hook 'skk-isearch-mode-setup)
(add-hook 'isearch-mode-hook 'skk-isearch-mode-cleanup)


;; commentout 2014-9-27(Sat), because past setting
;; (setq skk-dcomp-activate t)
;; (setq skk-auto-insert-paren t)
;; (setq skk-henkan-strict-okuri-precedence t)
;; (setq skk-show-annotation t)
;; (setq skk-rom-kana-rule-list
;;       (nconc skk-rom-kana-rule-list
;;              '((";" nil nil)
;;                (":" nil nil)
;;                ("?" nil nil)
;;                ("!" nil nil))))

;; ;; skk-mode
;; (global-set-key (kbd "<convert>") 'skk-j-mode)
;; (global-set-key (kbd "<non-convert>") 'skk-latin-mode)
