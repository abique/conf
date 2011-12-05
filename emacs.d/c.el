;; Auto insert C/C++ header guard
(add-hook 'find-file-hooks
          (lambda ()
            (when (and (memq major-mode '(c-mode c++-mode)) 
                       (equal (point-min) (point-max)) 
                       (string-match ".*\\.hh?" (buffer-file-name)))
              (insert-header-guard)
              (goto-line 3)
              (insert "\n"))
            ))

;; Start code folding mode in C/C++ mode
;; (add-hook 'c-mode-common-hook (lambda () (hs-minor-mode 1) (hs-hide-all)))
;; Highlight trailing withespaces
(add-hook 'c-mode-common-hook (lambda () (highlight-regexp " +$" "hi-pink")))
(add-hook 'c-mode-common-hook (lambda () (highlight-regexp "FIXME" "hi-red-b")))
(add-hook 'c-mode-common-hook (lambda () (highlight-regexp "XXX" "hi-red-b")))
(add-hook 'c-mode-common-hook (lambda () (highlight-regexp "TODO" "hi-red-b")))
(add-hook 'c-mode-common-hook 'subword-mode)

(add-hook 'c-mode-hook 'rm-trailing-spaces-always)
(add-hook 'c-mode-hook 'cwarn-mode)
(add-hook 'c++-mode-hook 'rm-trailing-spaces-always)
(add-hook 'c++-mode-hook 'cwarn-mode)

(setq c-mode-hook
      '(lambda()
	 (local-set-key (kbd "<return>") 'newline-and-indent)))

(load-file "~/.emacs.d/styles/epita.el")
(load-file "~/.emacs.d/styles/kaneton.el")
(load-file "~/.emacs.d/styles/d-style.el")
(load-file "~/.emacs.d/styles/gostai.el")
(load-file "~/.emacs.d/styles/arora.el")
(load-file "~/.emacs.d/styles/qemu.el")
(setq c-default-style "epita")

(setq c-font-lock-extra-types
      (append
       '("t_\\sw+")
       '("s_\\sw+")
       '("u_\\sw+")
       '("f_\\sw+")
       '("e_\\sw+")
       '("i_\\sw+")
       '("\\sw+_t")
       '("\\sw+_s")
       '("\\sw+_u")
       '("\\sw+_f")
       '("\\sw+_e")
       '("\\sw+_i")
       c-font-lock-extra-types))

(add-to-list 'auto-mode-alist '("twenga.*\\.h$" . c++-mode))
