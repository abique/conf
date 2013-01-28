;; -*- mode: Lisp; -*-

;;,--------
;;| Doxygen
;;`--------
(require 'doxymacs)
(add-hook 'c-mode-common-hook 'doxymacs-mode)

(defun my-doxymacs-font-lock-hook ()
  (if (or (eq major-mode 'c-mode) (eq major-mode 'c++-mode))
      (doxymacs-font-lock)))
(add-hook 'font-lock-mode-hook 'my-doxymacs-font-lock-hook)

;;,------
;;| cmake
;;`------
(require 'cmake-mode)

;;,----
;;| Lua
;;`----
(require 'lua-mode)

;;,-----------------
;;| Cedet (load-file
;;`-----------------
;; "/usr/share/emacs/site-lisp/cedet/common/cedet.elc")
;; (global-ede-mode 1) ; Enable the Project management system
;; (semantic-load-enable-code-helpers) ; Enable prototype help and
;; smart completion (global-srecode-minor-mode 1) ; Enable template
;; insertion menu (ede-enable-generic-projects)

;;,-------------------
;;| Archlinux PKGBUILD
;;`-------------------
(require 'pkgbuild-mode)

;;,-------
;;| rebox2
;;`-------
(require 'rebox2)

;;,----
;;| Git
;;`----
(require 'git)

;;,---------
;;| protobuf
;;`---------
(require 'protobuf-mode)
(require 'ninja-mode)

;;,---------------------------
;;| Load my split config files
;;`---------------------------
(load-file "~/.emacs.d/quick.el")
(load-file "~/.emacs.d/compilation.el")
(load-file "~/.emacs.d/c.el")
(load-file "~/.emacs.d/helpers.el")
(load-file "~/.emacs.d/keys.el")
(load-file "~/.emacs.d/snippet.el")

;;,-------------------------
;;| Configure spell checking
;;`-------------------------
(setq ispell-dictionary "english"
      ispell-skip-sgml t)
(autoload 'flyspell-mode "flyspell" "On-the-fly spelling checking" t)
(setq flyspell-default-dictionary "english")
(add-hook 'latex-mode-hook (lambda () (flyspell-mode 1)))

;;,----------------
;;| file auto modes
;;`----------------
(add-to-list 'auto-mode-alist '("PKGBUILD$" . pkgbuild-mode))
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
(add-to-list 'auto-mode-alist '("\\.proto$" . protobuf-mode))

;;,--------------------
;;| loading local stuff
;;`--------------------
(if (file-readable-p "~/.emacs.d/local.el")
    (load "~/.emacs.d/local.el"))

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
 '(diff-added ((t (:inherit diff-changed :foreground "#99e86e"))))
 '(diff-file-header ((t (:weight bold))))
 '(diff-function ((t (:foreground "bisque3" :box (:line-width 1 :color "grey75" :style pressed-button)))))
 '(diff-header ((t (:foreground "tomato"))))
 '(diff-hunk-header ((t (:inherit diff-header :foreground "#e5aa17"))))
 '(diff-removed ((t (:inherit diff-changed :foreground "#e87a6e")))))
