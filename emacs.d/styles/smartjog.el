;; Create my personal style.
(defconst smartjog-c-style
  '(
    (c-set-offset 'substatement-open 2)   ; change '{' indentation
    (c-set-offset 'case-label '+) ; make each case line indent from switch
    (c-set-offset 'brace-list-open '0)
    (c-set-offset 'statement-case-open '0)
    (c-set-offset 'block-open 2)        ; after '{' indentation
    (c-set-offset 'statement-block-intro 2)
    (setq c-basic-offset 4)
    (c-tab-always-indent . t)
    (c-comment-only-line-offset . 4)
    (c-hanging-braces-alist . ((substatement-open after)
                               (brace-list-open)))
    (c-hanging-colons-alist . ((member-init-intro before)
                               (inher-intro)
                               (case-label after)
                               (label after)
                               (access-label after)))
    (c-cleanup-list . (scope-operator empty-defun-braces defun-close-semi))
    (c-offsets-alist . ((arglist-close . c-lineup-arglist)
                        (substatement-open . 0)
                        (case-label . 4)
                        (block-open . 0)
                        (knr-argdecl-intro . -)))
    (c-echo-syntactic-information-p . t)) "Smartjog Programming Style")
(c-add-style "smartjog" smartjog-c-style)
