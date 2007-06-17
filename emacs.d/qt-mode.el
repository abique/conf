;; syntax-highlighting for Qt
;; (based on work by Arndt Gulbrandsen, Troll Tech)
(defun jk/c-mode-common-hook ()
  "Set up c-mode and related modes.

 Includes support for Qt code (signal, slots and alikes)."

  ;; base-style
  (c-set-style "stroustrup")
  ;; set auto cr mode
  (c-toggle-auto-hungry-state 1)

  ;; qt keywords and stuff ...
  ;; set up indenting correctly for new qt kewords
  (setq c-protection-key (concat "\\<\\(public\\|public slot\\|protected"
				 "\\|protected slot\\|private\\|private slot"
				 "\\)\\>")
	c-C++-access-key (concat "\\<\\(signals\\|public\\|protected\\|private"
				 "\\|public slots\\|protected slots\\|private slots"
				 "\\)\\>[ \t]*:"))
  (progn
    ;; modify the colour of slots to match public, private, etc ...
    (font-lock-add-keywords 'c++-mode
			    '(("\\<\\(slots\\|signals\\)\\>" . font-lock-type-face)))
    ;; make new font for rest of qt keywords
    (make-face 'qt-keywords-face)
    (set-face-foreground 'qt-keywords-face "BlueViolet")
    ;; qt keywords
    (font-lock-add-keywords 'c++-mode
			    '(("\\<Q_OBJECT\\>" . 'qt-keywords-face)))
    (font-lock-add-keywords 'c++-mode
			    '(("\\<SIGNAL\\|SLOT\\>" . 'qt-keywords-face)))
    (font-lock-add-keywords 'c++-mode
			    '(("\\<Q[A-Z][A-Za-z]*" . 'qt-keywords-face)))
    ))
(add-hook 'c-mode-common-hook 'jk/c-mode-common-hook)


;; Other things I like are, for example,

;; cc-mode
(require 'cc-mode)

;; automatic indent on return in cc-mode
(define-key c-mode-base-map [RET] 'newline-and-indent)

;; Do not check for old-style (K&R) function declarations;
;; this speeds up indenting a lot.
(setq c-recognize-knr-p nil)

;; Switch fromm *.<impl> to *.<head> and vice versa
(defun switch-cc-to-h ()
  (interactive)
  (when (string-match "^\\(.*\\)\\.\\([^.]*\\)$" buffer-file-name)
    (let ((name (match-string 1 buffer-file-name))
          (suffix (match-string 2 buffer-file-name)))
      (cond ((string-match suffix "c\\|cc\\|C\\|cpp")
             (cond ((file-exists-p (concat name ".h"))
                    (find-file (concat name ".h")))
                   ((file-exists-p (concat name ".hh"))
                    (find-file (concat name ".hh")))))
            ((string-match suffix "h\\|hh")
             (cond ((file-exists-p (concat name ".cc"))
                    (find-file (concat name ".cc"))
		    )
                   ((file-exists-p (concat name ".C"))
                    (find-file (concat name ".C"))
		    )
                   ((file-exists-p (concat name ".cpp"))
                    (find-file (concat name ".cpp"))
		    )
                   ((file-exists-p (concat name ".c"))
                    (find-file (concat name ".c")))))))))
