;; -*- mode: Lisp; -*-
;; Create my personal style.
(defconst dstyle-c-style
  '((c-tab-always-indent . t)
    (c-comment-only-line-offset . 0)
    (c-hanging-braces-alist . ((substatement-open after)
                               (brace-list-open)))
    (c-hanging-colons-alist . ((member-init-intro before)
                               (inher-intro)
                               (case-label after)
                               (label after)
                               (access-label after)))
    (c-cleanup-list . (scope-operator empty-defun-braces defun-close-semi))
    (c-basic-offset . 4)
    (c-offsets-alist . ((substatement . 4)
			(substatement-open . 0)
                        (case-label . 0)
                        (statement-case-open . 0)
                        (block-open . 4)
                        (brace-list-open . 0)
                        (statement-block-intro . 4)
			(inline-open . 0)
                        (label . 0)
                        ))
    (c-echo-syntactic-information-p . t))
  "D Programming Style")
(c-add-style "dstyle" dstyle-c-style)

(defun dstyle-d-mode-hook ()

  ;; Use the dstyle
  (c-set-style "dstyle")

  ;; UTF-8
  ;; (setq locale-coding-system 'utf-8)
  ;; (set-terminal-coding-system 'utf-8)
  ;; (set-keyboard-coding-system 'utf-8)
  ;; (set-selection-coding-system 'utf-8)
  ;; (prefer-coding-system 'utf-8)

  (setq indent-tabs-mode f) ;; no tabs
  (setq tab-width 4) ;; display tabs as 4 spaces
  )

(add-hook 'd-mode-hook 'dstyle-d-mode-hook)
