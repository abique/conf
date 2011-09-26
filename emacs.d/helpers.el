(defun insert-time ()
  (interactive)
  (insert (current-time-string)))

(defun indent-buffer()
  (interactive)
  (indent-region (point-min)(point-max) nil))

(defun insert-header-guard ()
  (interactive)
  (save-excursion
    (when (buffer-file-name)
      (let* ((name (file-name-nondirectory buffer-file-name))
             (macro (replace-regexp-in-string
                     "\\." "_"
                     (replace-regexp-in-string
                      "-" "_"
                      (upcase name)))))
        (goto-char (point-min))
        (insert "#ifndef " macro "\n")
        (insert "# define " macro "\n\n")
        (goto-char (point-max))
        (insert "\n#endif /* !" macro " */\n")
        )
      )
    )
  )

(defun beginning-of-line-context (&optional n)
  "Go to the first column of the text depending on context.
With optional argument, move forward N-1 lines first."
  (interactive "p")
  (let ((prev-point (point)))
    (beginning-of-line-text n)
    (when (<= prev-point (point))
      (beginning-of-line))))
