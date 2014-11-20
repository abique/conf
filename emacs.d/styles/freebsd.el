(defun freebox-generate-c-header ()
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
        (insert "#ifndef _" macro "\n")
        (insert "# define _" macro "\n\n")
        (goto-char (point-max))
        (insert "\n#endif /* !_" macro " */\n")
        )
      )
    )
  )

(defun freebsd-style ()
  (interactive)

  (setq indent-tabs-mode 1)

  (when (memq major-mode '(c-mode c++-mode))
    (c-set-style "linux")

    (when (and (string-match ".*\\.hh?" buffer-file-name)
               (equal (point-min) (point-max)))
      (freebsd-generate-c-header))
    )
  )
