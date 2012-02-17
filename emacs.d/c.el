(load-file "~/.emacs.d/styles/mimosa.el")
(load-file "~/.emacs.d/styles/bluegitf.el")
(load-file "~/.emacs.d/styles/freebox.el")
(load-file "~/.emacs.d/styles/epita.el")
(setq c-default-style "epita")

;; Auto insert C/C++ header guard
(add-hook 'find-file-hooks
          (lambda ()
            (when (string-match "/mimosa/" buffer-file-name)
              (mimosa-style))

            (when (string-match "/bluegitf/" buffer-file-name)
              (bluegitf-style))

            (when (string-match "fbx" buffer-file-name)
              (freebox-style))

            (if (and (string-match ".*\\.hh?" buffer-file-name)
                     (memq major-mode '(c-mode c++-mode))
                     (equal (point-min) (point-max)))
                (insert-header-guard))
            ))

;; Start code folding mode in C/C++ mode
;; (add-hook 'c-mode-common-hook (lambda () (hs-minor-mode 1) (hs-hide-all)))
(add-hook 'c-mode-common-hook
          (lambda ()
            (highlight-regexp "[\t ]+$" "hi-pink")
            (highlight-regexp "FIXME" "hi-red-b")
            (highlight-regexp "XXX" "hi-red-b")
            (highlight-regexp "TODO" "hi-red-b")
            (highlight-regexp "PTR" "hi-green-b")
            (highlight-regexp "ADDR" "hi-green-b")
            (highlight-regexp "SBRK" "hi-green-b")
            (subword-mode)
            (cwarn-mode)
            (hs-minor-mode)
            (hs-show-all)))

(setq c-mode-hook
      '(lambda()
	 (local-set-key (kbd "<return>") 'newline-and-indent)))

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
