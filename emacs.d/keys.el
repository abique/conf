;; code folding
;; (add-hook 'c-mode-common-hook
;;             (lambda () 
;;               ((hs-minor-mode)
;;                (local-set-key "\C-cs" 'hs-show-block)
;;                (local-set-key "\C-ch" 'hs-hide-block)
;;                (local-set-key "\C-cS" 'hs-show-all)
;;                (local-set-key "\C-cH" 'hs-hide-all))))

;; key bindings
(global-set-key [f2] 'indent-buffer)
(global-set-key [f3] 'delete-trailing-whitespace)
(global-set-key [f4] 'kill-this-buffer)
(global-set-key [f5] 'compile)
(global-set-key [f6] 'recompile)
(global-set-key [f7] 'kill-compilation)
(global-set-key [S-f8] 'previous-error)
(global-set-key [f8] 'next-error)
(global-set-key [f9] 'revert-buffer)
(global-set-key [f10] 'kill-compilation)
(global-set-key [f12] (lambda () (interactive) (manual-entry (current-word))))
(global-set-key "\C-a" 'beginning-of-line-context)
(global-set-key "" 'backward-delete-char)
(global-set-key "" 'compile)
(global-set-key "" 'goto-line)

;; Navigation
(global-set-key [M-left] 'windmove-left)   ; move to left window
(global-set-key [M-right] 'windmove-right) ; move to right window
(global-set-key [M-up] 'windmove-up)       ; move to upper window
(global-set-key [M-down] 'windmove-down)   ; move to bottom window
  ; move to left windnow
;(global-set-key "\C-" 'windmove-left)
(global-set-key [?\C-9] 'windmove-left)
(global-set-key [?\C-0] 'windmove-right) ; move to right window
(global-set-key [?\C-=] 'windmove-up)    ; move to upper window
(global-set-key [?\C--] 'windmove-down)
(global-set-key [M-9] 'windmove-left)
(global-set-key [M-0] 'windmove-right) ; move to right window
