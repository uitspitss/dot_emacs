;; auto-insert template
(setq auto-insert-directory "~/.emacs.d/templates/")
(auto-insert-mode t)
(setq auto-insert-query nil)
(setq auto-insert-alist
      (append
       '(
         ( python-mode . "python/plain.py" )
         ( c-mode . "c/plain.c" )
         ( coffee-mode . "coffee/plain.coffee" )
         ( c++-mode . "cpp/plain.cpp" )
         ;;	 ( yatex-mode . "latex/report.tex" )
         )
       auto-insert-alist))
(put 'upcase-region 'disabled nil)
