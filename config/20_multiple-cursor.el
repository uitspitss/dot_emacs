;;; multiple-cursors
(require 'multiple-cursors)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
;; (global-set-key (kbd "C-C C-C") 'mc/edit-lines)
;; (global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
