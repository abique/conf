;; Bluegitf emacs configuration

(defun bluegitf-generate-namespace (nmspc indent)
  (insert (concat indent "namespace " (car nmspc)))
  (newline)
  (insert (concat indent "{"))
  (newline)
  (if (cdr nmspc)
      (bluegitf-generate-namespace (cdr nmspc) (concat indent "  ")))
  (insert (concat indent "}"))
  (newline)
  )

(defun bluegitf-generate-top-guard (guard)
  (insert (concat "#ifndef " bluegitf-hdr-guard "_HH"))
  (newline)
  (insert (concat "# define " bluegitf-hdr-guard "_HH"))
  (newline)(newline)
  )

(defun bluegitf-generate-bottom-guard (guard)
  (newline)
  (insert (concat "#endif /* !" bluegitf-hdr-guard  "_HH */"))
  (newline)
  )

(defun bluegitf-include-header ()
  (goto-line 1)
  (insert (concat "#include \""
                  (replace-regexp-in-string "^.*/\\([^/]*\\)\\.cc$" "\\1.hh"
                                              buffer-file-name)
                  "\""))
  (newline)
  (newline)
  )

(defun bluegitf-generate-header ()
  (interactive)

  (set 'bluegitf-path (replace-regexp-in-string "^.*/bluegitf/\\(bluegitf/.*\\)\\.\\(hh\\|cc\\|hxx\\)$" "\\1"
                                              buffer-file-name))
  (set 'bluegitf-hdr-guard (upcase (replace-regexp-in-string "[./-]" "_" bluegitf-path)))
  (set 'bluegitf-nmspc (split-string (replace-regexp-in-string "[.-]" "_" bluegitf-path) "/"))

  (goto-char (point-min))

  (if (string-match "\\.hh$" buffer-file-name)
      (bluegitf-generate-top-guard bluegitf-hdr-guard))

  (bluegitf-generate-namespace (butlast bluegitf-nmspc) "")

  (if (string-match "\\.hh$" buffer-file-name)
      (bluegitf-generate-bottom-guard bluegitf-hdr-guard))

  (if (and (string-match "\\.cc$" buffer-file-name)
           (file-exists-p (replace-regexp-in-string "\\.cc$" ".hh" buffer-file-name)))
      (bluegitf-include-header))
  )

(defun mimosa-style ()
  (interactive)
  (c-set-style "epita")

  (when (and (memq major-mode '(c-mode c++-mode))
             (equal (point-min) (point-max)))
    (mimosa-generate-header))
  )