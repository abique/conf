;; -*- mode: Lisp; -*-
;; SmartJog style
(defconst smartjog-c-style
  '(
    (c-tab-always-indent . t)
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
    (c-offsets-alist . ((substatement-open . 2)
                        (case-label . +)
                        (statement-case-open . 0)
                        (block-open . 2)
                        (brace-list-open . 0)
                        (statement-block-intro . 2)
                        ))
    (c-echo-syntactic-information-p . t)) "Smartjog Programming Style")
(c-add-style "smartjog" smartjog-c-style)
