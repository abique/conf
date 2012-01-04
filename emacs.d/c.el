(load-file "~/.emacs.d/styles/mimosa.el")
(load-file "~/.emacs.d/styles/bluegitf.el")
(load-file "~/.emacs.d/styles/freebox.el")

;; Auto insert C/C++ header guard
(add-hook 'find-file-hooks
          (lambda ()
            (when (and (memq major-mode '(c-mode c++-mode))
                       (equal (point-min) (point-max)))

              (when (string-match "/mimosa/" buffer-file-name)
                (mimosa-generate-header))

              (when (string-match "/bluegitf/" buffer-file-name)
                (bluegitf-generate-header))

              (when (string-match "fbx" buffer-file-name)
                (setq indent-tabs-mode 1)
                (c-set-style "linux")
                (freebox-generate-header))

              (if (string-match ".*\\.hh?" buffer-file-name)
                  (insert-header-guard))

              )))

;; Start code folding mode in C/C++ mode
;; (add-hook 'c-mode-common-hook (lambda () (hs-minor-mode 1) (hs-hide-all)))
;; Highlight trailing withespaces
(add-hook 'c-mode-common-hook (lambda () (highlight-regexp " +$" "hi-pink")))
(add-hook 'c-mode-common-hook (lambda () (highlight-regexp "FIXME" "hi-red-b")))
(add-hook 'c-mode-common-hook (lambda () (highlight-regexp "XXX" "hi-red-b")))
(add-hook 'c-mode-common-hook (lambda () (highlight-regexp "TODO" "hi-red-b")))
(add-hook 'c-mode-common-hook 'subword-mode)

;(add-hook 'c-mode-hook 'rm-trailing-spaces-always)
(add-hook 'c-mode-hook 'cwarn-mode)
;(add-hook 'c++-mode-hook 'rm-trailing-spaces-always)
(add-hook 'c++-mode-hook 'cwarn-mode)

(setq c-mode-hook
      '(lambda()
	 (local-set-key (kbd "<return>") 'newline-and-indent)))

(load-file "~/.emacs.d/styles/epita.el")
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
