;;; 10_dired.el ---

;; diredを2つのウィンドウで開いている時に、デフォルトの移動orコピー先をもう一方のdiredで開いているディレクトリにする
(setq dired-dwim-target t)
;; ディレクトリを再帰的にコピーする
(setq dired-recursive-copies 'always)
;; diredバッファでC-sした時にファイル名だけにマッチするように
(setq dired-isearch-filenames t)

;; .zipで終わるファイルをZキーで展開できるように
(add-to-list 'dired-compress-file-suffixes '("\\.zip\\'" ".zip" "unzip"))
