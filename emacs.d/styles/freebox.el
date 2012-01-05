(defun freebox-generate-header ()
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
        (insert "#ifndef " macro "_\n")
        (insert "# define " macro "_\n\n")
        (goto-char (point-max))
        (insert "\n#endif /* !" macro "_ */\n")
        )
      )
    )
  )

(defun freebox-style ()
  (interactive)

  (when (memq major-mode '(sh-mode))
    (setq indent-tabs-mode 1)
    (setq sh-basic-offset 8)
    )

  (when (memq major-mode '(c-mode c++-mode))
    (setq indent-tabs-mode 1)
    (c-set-style "linux")

    (when (and (string-match ".*\\.hh?" buffer-file-name)
               (equal (point-min) (point-max)))
      (freebox-generate-header))
    )
  )
