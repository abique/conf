;; Doxygen
(require 'doxymacs)
(add-hook 'c-mode-common-hook 'doxymacs-mode)
;; uncomment this line if you want the comment for the C++-style;
;;(setq doxymacs-doxygen-style "C++")
;; comment with the C mode style
(setq doxymacs-doxygen-style "JavaDoc")
;; If you want Doxygen keywords fontified use M-x doxymacs-font-lock.
(defun my-doxymacs-font-lock-hook ()
     (if (or (eq major-mode 'c-mode) (eq major-mode 'c++-mode))
         (doxymacs-font-lock)))
   (add-hook 'font-lock-mode-hook 'my-doxymacs-font-lock-hook)
