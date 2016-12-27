(defconst bitwig-c-style
  '((c-tab-always-indent . t)
    (c-comment-only-line-offset . 0)
    (c-hanging-braces-alist . ((substatement-open after)
                               (brace-list-open)))
    (c-hanging-colons-alist . ((member-init-intro before)
                               (inher-intro)
                               (case-label after)
                               (label 0)
                               (access-label after)))
    (c-cleanup-list . (scope-operator empty-defun-braces defun-close-semi))
    (c-basic-offset . 3)
    (c-offsets-alist . ((substatement . +)
			(substatement-open . 0)
                        (case-label . 0)
                        (statement-case-open . 0)
                        (block-open . 0)
                        (brace-list-open . 0)
                        (inline-open . 0)
                        (statement-block-intro . +)
                        (statement-case-open . +)
                        ))
    (c-echo-syntactic-information-p . t))
  "Bitwig Programming Style")
(c-add-style "bitwig" bitwig-c-style)

(defun bitwig-style ()
  (interactive)

  (setq indent-tabs-mode nil)
  (setq tab-width 8)

  (when (memq major-mode '(sh-mode))
    (setq sh-basic-offset 3)
    )

  (when (or (memq major-mode '(js-mode)) (memq major-mode '(javascript-mode)))
    (setq sh-basic-offset 3)
    )

  (when (memq major-mode '(python-mode))
    (setq indent-tabs-mode nil))

  (when (memq major-mode '(c-mode c++-mode))
    (c-set-style "bitwig")

	(when (and (string-match ".*\\.hh?" buffer-file-name)
               (equal (point-min) (point-max)))
      (freebox-generate-c-header))
  )
)
