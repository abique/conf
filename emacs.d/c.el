;; Auto insert C/C++ header guard
(add-hook 'find-file-hooks
          (lambda ()
            (when (and (memq major-mode '(c-mode c++-mode)) (equal (point-min) (point-max)) (string-match ".*\\.hh?" (buffer-file-name)))
              (insert-header-guard)
              (goto-line 3)
              (insert "\n"))))

;; Start code folding mode in C/C++ mode
;; (add-hook 'c-mode-common-hook (lambda () (hs-minor-mode 1) (hs-hide-all)))
;; Highlight trailing withespaces
(add-hook 'c-mode-common-hook (lambda () (highlight-regexp " +$" "hi-pink")))
(add-hook 'c-mode-common-hook (lambda () (highlight-regexp "FIXME" "hi-red-b")))
(add-hook 'c-mode-common-hook (lambda () (highlight-regexp "TODO" "hi-red-b")))
(add-hook `c-mode-common-hook `rm-trailing-spaces-always)
(add-hook `c-mode-common-hook `cwarn-mode)
