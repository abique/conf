;; -*- mode: Lisp; -*-

;; Load gentoo site
;; (if (file-readable-p "/usr/share/emacs/site-lisp/site-gentoo.el")
;;     (load "/usr/share/emacs/site-lisp/site-gentoo"))

(if (file-readable-p "/usr/share/emacs/site-lisp/lua-mode.el")
    (load "/usr/share/emacs/site-lisp/lua-mode"))

;; (if (file-readable-p "/usr/share/emacs/site-lisp/debian-startup.el")
;;     (load "/usr/share/emacs/site-lisp/debian-startup"))

;; Our own modes repository
(setq load-path (cons "~/.emacs.d/" load-path))
(setq load-path (cons "~/.emacs.d/modes" load-path))
(setq load-path (cons "~/.emacs.d/modes/color-theme" load-path))

(load-file "~/.emacs.d/quick.el")
(load-file "~/.emacs.d/compilation.el")
(load-file "~/.emacs.d/c.el")
(load-file "~/.emacs.d/helpers.el")
(load-file "~/.emacs.d/keys.el")
(load-file "~/.emacs.d/color-theme.el")
(load-file "~/.emacs.d/doxygen.el")

;; d-mode
(load-file "~/.emacs.d/modes/d-mode.el")

(require 'company-mode)
(require 'company-bundled-completions)
(company-install-bundled-completions-rules)
(setq ispell-dictionary "francais"
      ispell-skip-sgml t)
(autoload 'flyspell-mode "flyspell" "On-the-fly spelling checking" t)
(setq flyspell-default-dictionary "francais")
(add-hook 'latex-mode-hook (lambda () (flyspell-mode 1)))

;; cmake mode
(load-file "~/.emacs.d/modes/cmake-mode.el")
;; pabbrev mode
;;(load-file "~/.emacs.d/modes/pabbrev.el")
;;(global-pabbrev-mode)

;; file extensions
(add-to-list 'auto-mode-alist '("\\.l$" . flex-mode))
(add-to-list 'auto-mode-alist '("\\.y$" . bison-mode))
(add-to-list 'auto-mode-alist '("\\.d$" . d-mode))
(add-to-list 'auto-mode-alist '("\\.di$" . d-mode))
(add-to-list 'auto-mode-alist '("\\.apd$" . d-mode))
(add-to-list 'auto-mode-alist '("\\.pro$" . sh-mode)) ;; Qt .pro files
(add-to-list 'auto-mode-alist '("CMakeLists.txt$" . cmake-mode))

;; gnus
(setq gnus-summary-line-format "%U%R%z%3t: %-25B%(%-23,23t%) %s\n")
