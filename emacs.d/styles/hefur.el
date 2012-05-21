;; Hefur emacs configuration

(defun hefur-generate-namespace (nmspc indent)
  (insert (concat indent "namespace " (car nmspc)))
  (newline)
  (insert (concat indent "{"))
  (newline)
  (if (cdr nmspc)
      (hefur-generate-namespace (cdr nmspc) (concat indent "  ")))
  (insert (concat indent "}"))
  (newline)
  )

(defun hefur-generate-top-guard (guard)
  (insert (concat "#ifndef " hefur-hdr-guard "_HH"))
  (newline)
  (insert (concat "# define " hefur-hdr-guard "_HH"))
  (newline)(newline)
  )

(defun hefur-generate-bottom-guard (guard)
  (newline)
  (insert (concat "#endif /* !" hefur-hdr-guard  "_HH */"))
  (newline)
  )

(defun hefur-include-header ()
  (goto-line 1)
  (insert (concat "#include \""
                  (replace-regexp-in-string "^.*/\\([^/]*\\)\\.cc$" "\\1.hh"
                                              buffer-file-name)
                  "\""))
  (newline)
  (newline)
  )

(defun hefur-generate-header ()
  (interactive)

  (set 'hefur-path (replace-regexp-in-string "^.*/hefur/\\(hefur/.*\\)\\.\\(hh\\|cc\\|hxx\\)$" "\\1"
                                              buffer-file-name))
  (set 'hefur-hdr-guard (upcase (replace-regexp-in-string "[./-]" "_" hefur-path)))
  (set 'hefur-nmspc (split-string (replace-regexp-in-string "[.-]" "_" hefur-path) "/"))

  (goto-char (point-min))

  (if (string-match "\\.hh$" buffer-file-name)
      (hefur-generate-top-guard hefur-hdr-guard))

  (hefur-generate-namespace (butlast hefur-nmspc) "")

  (if (string-match "\\.hh$" buffer-file-name)
      (hefur-generate-bottom-guard hefur-hdr-guard))

  (if (and (string-match "\\.cc$" buffer-file-name)
           (file-exists-p (replace-regexp-in-string "\\.cc$" ".hh" buffer-file-name)))
      (hefur-include-header))
  )

(defun hefur-style ()
  (interactive)

  (when (memq major-mode '(c-mode c++-mode))
    (c-set-style "epita")

    (when (equal (point-min) (point-max))
      (hefur-generate-header))
    )
  )
