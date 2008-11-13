;; Compilation
(require 'compile)
(add-to-list
 'compilation-error-regexp-alist
 '("^\\([^ \n]+\\)(\\([0-9]+\\)): \\(?:error\\|.\\|warnin\\(g\\)\\|remar\\(k\\)\\)"
   1 2 nil (3 . 4)))

(setq compilation-window-height 14)
(setq compilation-scroll-output t)

