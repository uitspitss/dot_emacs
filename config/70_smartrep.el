;;; smartrep
(require 'smartrep)

;; git-gutter
(smartrep-define-key
    global-map  "C-x" '(("p" . 'git-gutter:previous-diff)
                        ("n" . 'git-gutter:next-diff)))
;; flycheck
(smartrep-define-key
 global-map "M-g" '(("n" . 'next-error)
                    ("p" . 'previous-error)))

;; select window
(smartrep-define-key
    global-map "C-x" '(("o" . 'other-window)
                       ("O" . (lambda () (interactive) (other-window -1)))))

;; resize window
(smartrep-define-key
    global-map "C-x" '(("<" . 'enlarge-window)
                       ("^" . 'enlarge-window)
                       ("}" . 'enlarge-window-horizontally)
                       ("{" . 'shrink-window-horizontally)
                       ))
