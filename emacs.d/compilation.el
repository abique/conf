;; Compilation
(require 'compile)

;; (add-to-list
;;  'compilation-error-regexp-alist
;;  '("^\\([^ \n]+\\)(\\([0-9]+\\)): \\(?:error\\|.\\|warnin\\(g\\)\\|remar\\(k\\)\\)"
;;    1 2 nil (3 . 4)))

(setq compilation-window-height 10)
(setq compilation-scroll-output t)
;; (setq compilation-finish-function
;;       (lambda (buf str)
;;         (if (string-match "exited abnormally" str)

;;             ;;there were errors
;;             (message "compilation errors, press C-x ` to visit")

;;           ;;no errors, make the compilation window go away in 0.5 seconds
;;           ;;(run-at-time 0.5 nil 'delete-windows-on buf)
;;           (run-at-time 0.5 nil 'kill-buffer buf)
;;           (message "compilation succeed"))))