(defun t2m-generate-c-header ()
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

(defun t2m-generate-python-header ()
  (interactive)

  (save-excursion
    (when (buffer-file-name)
      (goto-char (point-min))
      (insert "#! /usr/bin/env python3\n")
      (insert "# -*- coding: utf-8 -*-\n")
      )
    )
  )

(defun t2m-style ()
  (interactive)

  (setq indent-tabs-mode 1)

  (when (memq major-mode '(sh-mode))
    (setq sh-basic-offset 8)
    )

  (when (memq major-mode '(python-mode))
    (setq indent-tabs-mode nil)
    (when (equal (point-min) (point-max))
      (t2m-generate-python-header))
    )

  (when (memq major-mode '(c-mode c++-mode))
    (c-set-style "linux")

    (when (and (string-match ".*\\.hh?" buffer-file-name)
               (equal (point-min) (point-max)))
      (t2m-generate-c-header))
    )
  )
