;; Mimosa emacs configuration

(defun mimosa-generate-namespace (nmspc indent)
  (insert (concat indent "namespace " (car nmspc)))
  (newline)
  (insert (concat indent "{"))
  (newline)
  (if (cdr nmspc)
      (mimosa-generate-namespace (cdr nmspc) (concat indent "  ")))
  (insert (concat indent "}"))
  (newline)
  )

(defun mimosa-generate-top-guard (guard)
  (insert (concat "#ifndef " mimosa-hdr-guard "_HH"))
  (newline)
  (insert (concat "# define " mimosa-hdr-guard "_HH"))
  (newline)(newline)
  )

(defun mimosa-generate-bottom-guard (guard)
  (newline)
  (insert (concat "#endif /* !" mimosa-hdr-guard  "_HH */"))
  (newline)
  )

(defun mimosa-generate-header ()
  (interactive)

  (set 'mimosa-path (replace-regexp-in-string "^.*/mimosa/\\(mimosa/.*\\)\\.\\(hh\\|cc\\|hxx\\)$" "\\1"
                                              (buffer-file-name)))
  (set 'mimosa-hdr-guard (upcase (replace-regexp-in-string "[./-]" "_" mimosa-path)))
  (set 'mimosa-nmspc (split-string (replace-regexp-in-string "[.-]" "_" mimosa-path) "/"))

  (goto-char (point-min))

  (if (string-match "\\.hh$" buffer-file-name)
      (mimosa-generate-top-guard mimosa-hdr-guard))

  (mimosa-generate-namespace mimosa-nmspc "")

  (if (string-match "\\.hh$" buffer-file-name)
      (mimosa-generate-bottom-guard mimosa-hdr-guard))
  )
