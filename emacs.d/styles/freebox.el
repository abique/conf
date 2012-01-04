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
        (insert "#define " macro "_\n\n")
        (goto-char (point-max))
        (insert "\n#endif /* !" macro "_ */\n")
        )
      )
    )
  )
