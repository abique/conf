;; Scissy emacs configuration

(defun scissy-generate-namespace (nmspc indent)
  (insert (concat indent "namespace " (car nmspc)))
  (newline)
  (insert (concat indent "{"))
  (newline)
  (if (cdr nmspc)
      (scissy-generate-namespace (cdr nmspc) (concat indent "  ")))
  (insert (concat indent "}"))
  (newline)
  )

(defun scissy-generate-top-guard (guard)
  (insert (concat "#ifndef " scissy-hdr-guard "_HH"))
  (newline)
  (insert (concat "# define " scissy-hdr-guard "_HH"))
  (newline)(newline)
  )

(defun scissy-generate-bottom-guard (guard)
  (newline)
  (insert (concat "#endif /* !" scissy-hdr-guard  "_HH */"))
  (newline)
  )

(defun scissy-include-header ()
  (goto-line 1)
  (insert (concat "#include \""
                  (replace-regexp-in-string "^.*/\\([^/]*\\)\\.cc$" "\\1.hh"
                                              buffer-file-name)
                  "\""))
  (newline)
  (newline)
  )

(defun scissy-generate-header ()
  (interactive)

  (set 'scissy-path (replace-regexp-in-string "^.*/scissy/\\(scissy/.*\\)\\.\\(hh\\|cc\\|hxx\\)$" "\\1"
                                              buffer-file-name))
  (set 'scissy-hdr-guard (upcase (replace-regexp-in-string "[./-]" "_" scissy-path)))
  (set 'scissy-nmspc (split-string (replace-regexp-in-string "[.-]" "_" scissy-path) "/"))

  (goto-char (point-min))

  (if (string-match "\\.hh$" buffer-file-name)
      (scissy-generate-top-guard scissy-hdr-guard))

  (scissy-generate-namespace (butlast scissy-nmspc) "")

  (if (string-match "\\.hh$" buffer-file-name)
      (scissy-generate-bottom-guard scissy-hdr-guard))

  (if (and (string-match "\\.cc$" buffer-file-name)
           (file-exists-p (replace-regexp-in-string "\\.cc$" ".hh" buffer-file-name)))
      (scissy-include-header))
  )

(defun scissy-style ()
  (interactive)

  (when (memq major-mode '(c-mode c++-mode))
    (c-set-style "epita")

    (when (equal (point-min) (point-max))
      (scissy-generate-header))
    )
  )
