;; -*- mode: Lisp; -*-

;; Doxygen
(require 'doxymacs)
(add-hook 'c-mode-common-hook 'doxymacs-mode)

(defun my-doxymacs-font-lock-hook ()
  (if (or (eq major-mode 'c-mode) (eq major-mode 'c++-mode))
      (doxymacs-font-lock)))
(add-hook 'font-lock-mode-hook 'my-doxymacs-font-lock-hook)

;; Lua
(if (file-readable-p "/usr/share/emacs/site-lisp/lua-mode.el")
    (load "/usr/share/emacs/site-lisp/lua-mode"))

;; Cedet
(if (file-readable-p "/usr/share/emacs/site-lisp/cedet/common/cedet.el")
    (load-file "/usr/share/emacs/site-lisp/cedet/common/cedet.el"))
(global-ede-mode 1)                      ; Enable the Project management system
(semantic-load-enable-code-helpers)      ; Enable prototype help and smart completion 
(global-srecode-minor-mode 1)            ; Enable template insertion menu

(autoload 'pkgbuild-mode "pkgbuild-mode.el" "PKGBUILD mode." t)
(setq auto-mode-alist (append '(("/PKGBUILD$" . pkgbuild-mode)) auto-mode-alist))

;; Our own modes repository
(setq load-path (cons "~/.emacs.d/" load-path))
(setq load-path (cons "~/.emacs.d/modes" load-path))
(setq load-path (cons "~/.emacs.d/modes/color-theme" load-path))

(load-file "~/.emacs.d/quick.el")
(load-file "~/.emacs.d/compilation.el")
(load-file "~/.emacs.d/c.el")
(load-file "~/.emacs.d/infinit.el")
(load-file "~/.emacs.d/helpers.el")
(load-file "~/.emacs.d/keys.el")
(load-file "~/.emacs.d/modes/graphviz-dot-mode.el")

(autoload 'nsi-mode "nsi-mode" "nsi editing mode." t)
(load-file "~/.emacs.d/modes/cmake-mode.el")
(load-file "~/.emacs.d/modes/llvm-mode.el")
(load-file "~/.emacs.d/modes/tablegen-mode.el")
(load-file "~/.emacs.d/modes/protobuf-mode.el")

(autoload 'pkgbuild-mode "pkgbuild-mode.el" "PKGBUILD mode." t)
(setq auto-mode-alist (append '(("/PKGBUILD$" . pkgbuild-mode)) auto-mode-alist))

;; (add-to-list 'load-path "~/develop/go/misc/emacs/" t)
;; (require 'go-mode-load)

(setq ispell-dictionary "francais"
      ispell-skip-sgml t)
(autoload 'flyspell-mode "flyspell" "On-the-fly spelling checking" t)
(setq flyspell-default-dictionary "francais")
(add-hook 'latex-mode-hook (lambda () (flyspell-mode 1)))

;; cmake mode

;; pabbrev & completion mode
;;(require 'company-mode)
;;(require 'company-bundled-completions)
;;(company-install-bundled-completions-rules)
;;(load-file "~/.emacs.d/modes/pabbrev.el")
;;(global-pabbrev-mode)

;; file extensions
(add-to-list 'auto-mode-alist '("\\.d$" . d-mode))
(add-to-list 'auto-mode-alist '("\\.di$" . d-mode))
(add-to-list 'auto-mode-alist '("\\.apd$" . d-mode))
(add-to-list 'auto-mode-alist '("\\.pro$" . sh-mode)) ;; Qt .pro files
(add-to-list 'auto-mode-alist '("CMakeLists.txt$" . cmake-mode))
(add-to-list 'auto-mode-alist '("\\.cmake$" . cmake-mode))
(add-to-list 'auto-mode-alist '("\\.y$" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.l$" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.doch$" . c++-mode))
(add-to-list 'auto-mode-alist '("mordor/.*\\.h$" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.nsi$" . nsi-mode))

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(graphviz-dot-auto-indent-on-braces t)
 '(graphviz-dot-toggle-completions t)
 '(graphviz-dot-view-edit-command nil)
 '(org-fontify-done-headline t)
 '(org-log-done (quote time) nil nil "time")
 '(org-modules (quote (org-bbdb org-bibtex org-gnus org-info org-jsinfo org-irc org-mew org-mhe org-rmail org-vm org-wl org-w3m org-mouse org-choose)))
 '(org-time-stamp-custom-formats (quote ("<%Y-%m-%d>" . "<%Y-%m-%d %H:%M:%S %z>")))
 '(org-time-stamp-rounding-minutes (quote (0 0))))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )