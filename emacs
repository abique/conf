;; -*- mode: Lisp; -*-

(autoload 'cmake-mode "cmake-mode" "Major mode for cmake" 1)
(autoload 'lua-mode "lua-mode" "Major mode for LUA" 1)
(autoload 'pkgbuild-mode "pkgbuild-mode" "Major mode for PKGBUILD" 1)
(autoload 'protobuf-mode "protobuf-mode" "Major mode for protocol buffer" 1)
(autoload 'ninja-mode "ninja-mode" "Major mode for ninja" 1)
(autoload 'go-mode "go-mode" "Major mode for go" 1)
(autoload 'yaml-mode "yaml-mode" "Major mode for yaml" 1)
(autoload 'rust-mode "rust-mode" "Major mode for rust" 1)
(require 'compile)

;;,---------------------------
;;| Load my split config files
;;`---------------------------
(load-file "~/.emacs.d/quick.el")
(load-file "~/.emacs.d/c.el")
(load-file "~/.emacs.d/helpers.el")
(load-file "~/.emacs.d/keys.el")

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
(add-to-list 'auto-mode-alist '("\\.h$" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.y$" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.l$" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.doch$" . c++-mode))
(add-to-list 'auto-mode-alist '("mordor/.*\\.h$" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.nsi$" . nsi-mode))
(add-to-list 'auto-mode-alist '("\\.proto$" . protobuf-mode))
(add-to-list 'auto-mode-alist '("\.yml\'" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.rs$" . rust-mode))

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
 '(compilation-scroll-output t)
 '(compilation-window-height 10)
 '(css-indent-offset 2)
 '(default-major-mode (quote text-mode) t)
 '(font-lock-maximum-decoration t)
 '(font-lock-maximum-size 512000)
 '(frame-title-format "<[ %b ]>" t)
 '(global-font-lock-mode t)
 '(graphviz-dot-auto-indent-on-braces t)
 '(graphviz-dot-toggle-completions t)
 '(graphviz-dot-view-edit-command nil)
 '(inhibit-startup-buffer-menu t)
 '(inhibit-startup-screen t)
 '(inverse-video nil)
 '(js-indent-level 2)
 '(menu-bar-mode nil)
 '(org-fontify-done-headline t)
 '(org-log-done (quote time) nil nil "time")
 '(org-modules
   (quote
    (org-bbdb org-bibtex org-gnus org-info org-jsinfo org-irc org-mew org-mhe org-rmail org-vm org-wl org-w3m org-mouse org-choose)))
 '(org-time-stamp-custom-formats (quote ("<%Y-%m-%d>" . "<%Y-%m-%d %H:%M:%S %z>")))
 '(org-time-stamp-rounding-minutes (quote (0 0)))
 '(scroll-bar-mode nil)
 '(scroll-step 1)
 '(show-paren-mode t)
 '(size-indication-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "black" :foreground "grey" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 111 :width normal :foundry "unknown" :family "dina"))))
 '(cursor ((t (:background "dark orange"))))
 '(diff-added ((t (:inherit diff-changed :foreground "#99e86e"))))
 '(diff-file-header ((t (:weight bold))))
 '(diff-function ((t (:foreground "bisque3" :box (:line-width 1 :color "grey75" :style pressed-button)))))
 '(diff-header ((t (:foreground "tomato"))))
 '(diff-hunk-header ((t (:inherit diff-header :foreground "#e5aa17"))))
 '(diff-removed ((t (:inherit diff-changed :foreground "#e87a6e"))))
 '(region ((t (:background "NavajoWhite3" :foreground "gtk_selection_fg_color"))))
 '(rst-level-1-face ((t (:foreground "light coral"))) t)
 '(rst-level-2-face ((t (:foreground "chartreuse"))) t)
 '(rst-level-3-face ((t (:foreground "sandy brown"))) t)
 '(rst-level-4-face ((t nil)) t))
