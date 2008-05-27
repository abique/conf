;; -*- mode: Lisp; -*-
;; Load gentoo site
;; (if (file-readable-p "/usr/share/emacs/site-lisp/site-gentoo.el")
;;     (load "/usr/share/emacs/site-lisp/site-gentoo"))
;; (if (file-readable-p "/usr/share/emacs/site-lisp/debian-startup.el")
;;     (load "/usr/share/emacs/site-lisp/debian-startup"))

(load-file "~/.emacs.d/quick.el")

;; Our own modes repository
(setq load-path (cons "~/.emacs.d/" load-path))
(setq load-path (cons "~/.emacs.d/modes" load-path))
(setq load-path (cons "~/.emacs.d/modes/color-theme" load-path))

(setq ispell-dictionary "francais"
      ispell-skip-sgml t)
(autoload 'flyspell-mode "flyspell" "On-the-fly spelling checking" t)
(setq flyspell-default-dictionary "francais")
(add-hook 'latex-mode-hook (lambda () (flyspell-mode 1)))

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
(add-hook 'sh-mode-common-hook (lambda () (highlight-regexp " +$" "hi-pink")))

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


;; C mode
(add-hook `c-mode-hook `rm-trailing-spaces-always)
(add-hook `c-mode-hook `cwarn-mode)

(load-file "~/.emacs.d/styles/babali.el")

;; Theme
(set-mouse-color "DarkSalmon")
(set-cursor-color "DarkOrange3")

;; COLOR THEME
(require 'color-theme)
(if (fboundp 'color-theme-initialize) (color-theme-initialize))
;;(color-theme-charcoal-black)
;;(color-theme-late-night)

(if window-system
    (color-theme-dark-blue2)
  (color-theme-hober))
;;(color-theme-subtle-hacker)
;;(color-theme-comidia)
;;(color-theme-taylor)
;;(color-theme-classic)
;;(color-theme-billw)
;;(color-theme-dark-blue2)
;;(color-theme-clarity)

(defun insert-header-guard ()
  (interactive)
  (save-excursion
    (when (buffer-file-name)
        (let*
            (
             (name (file-name-nondirectory buffer-file-name))
             (macro (replace-regexp-in-string
                     "\\." "_"
                     (replace-regexp-in-string
                      "-" "_"
                      (upcase name))))
             )
          (goto-char (point-min))
          (insert "#ifndef " macro "\n")
          (insert "# define " macro "\n\n")
          (goto-char (point-max))
          (insert "\n#endif\n")
          )
      )
    )
  )



(defun beginning-of-line-context (&optional n)
  "Go to the first column of the text depending on context.
With optional argument, move forward N-1 lines first."
  (interactive "p")
  (let ((prev-point (point)))
    (beginning-of-line-text n)
    (when (<= prev-point (point))
      (beginning-of-line))))

;; Doxygen
(require 'doxymacs)
(add-hook 'c-mode-common-hook 'doxymacs-mode)
;; uncomment this line if you want the comment for the C++-style;
;;(setq doxymacs-doxygen-style "C++")
;; comment with the C mode style
(setq doxymacs-doxygen-style "JavaDoc")
;; If you want Doxygen keywords fontified use M-x doxymacs-font-lock.
(defun my-doxymacs-font-lock-hook ()
     (if (or (eq major-mode 'c-mode) (eq major-mode 'c++-mode))
         (doxymacs-font-lock)))
   (add-hook 'font-lock-mode-hook 'my-doxymacs-font-lock-hook)

;; code folding
(add-hook 'c-mode-common-hook
            (lambda () (hs-minor-mode 1)))

(add-hook 'hs-minor-mode-hook
            (lambda () (local-set-key "\C-cs" 'hs-show-block)))
(add-hook 'hs-minor-mode-hook
            (lambda () (local-set-key "\C-ch" 'hs-hide-block)))
(add-hook 'hs-minor-mode-hook
            (lambda () (local-set-key "\C-cS" 'hs-show-all)))
(add-hook 'hs-minor-mode-hook
            (lambda () (local-set-key "\C-cH" 'hs-hide-all)))

;; key bindings
(global-set-key [f2] 'indent-buffer)
(global-set-key [f3] 'delete-trailing-whitespace)
(global-set-key [f4] 'kill-this-buffer)
(global-set-key [f5] 'compile)
(global-set-key [f6] 'recompile)
(global-set-key [f7] 'kill-compilation)
(global-set-key [f8] 'next-error)
(global-set-key [f9] 'revert-buffer)
(global-set-key [f12] (lambda () (interactive) (manual-entry (current-word))))
(global-set-key "\C-a" 'beginning-of-line-context)
(global-set-key "" 'backward-delete-char)
(global-set-key "" 'compile)
(global-set-key "" 'goto-line)

;; Navigation
(global-set-key [M-left] 'windmove-left)   ; move to left windnow
(global-set-key [M-right] 'windmove-right) ; move to right window
(global-set-key [M-up] 'windmove-up)       ; move to upper window
(global-set-key [M-down] 'windmove-down)
(global-set-key [?\C-9] 'windmove-left)  ; move to left windnow
(global-set-key [?\C-0] 'windmove-right) ; move to right window
(global-set-key [?\C-=] 'windmove-up)    ; move to upper window
(global-set-key [?\C--] 'windmove-down)
(global-set-key [(control tab)] 'next-buffer) ; Ctrl-Tab = Next buffer
(global-set-key [(control backtab)] 'prev-buffer) ; Ctrl-Tab = Next buffer

(defun indent-buffer()
  (interactive)
  (indent-region (point-min)(point-max) nil))

;; Compilation
(setq compilation-window-height 14)
(setq compilation-scroll-output t)


;; gnus
(setq gnus-summary-line-format "%U%R%z%3t: %-25B%(%-23,23t%) %s\n")

;; elisp functions
(defun yic-ignore (str)
  (or
   (string-match "\\*Buffer List\\*" str)
   (string-match "\\*scratch\\*" str)
   (string-match "^TAGS" str)
   (string-match "^\\*Messages\\*$" str)
   (string-match "^\\*Completions\\*$" str)
   (string-match "^ " str)
   (memq str
         (mapcar
          (lambda (x)
            (buffer-name
             (window-buffer
              (frame-selected-window x))))
          (visible-frame-list)))
   ))

(defun yic-next (ls)
  (let* ((ptr ls)
	 bf bn go
	 )
    (while (and ptr (null go))
      (setq bf (car ptr)  bn (buffer-name bf))
      (if (null (yic-ignore bn))
	  (setq go bf)
	(setq ptr (cdr ptr))
	)
      )
    (if go
	(switch-to-buffer go))))

(defun yic-prev-buffer ()
  (interactive)
  (yic-next (reverse (buffer-list))))

(defun yic-next-buffer ()
  (interactive)
  (bury-buffer (current-buffer))
  (yic-next (buffer-list)))


(add-hook 'c-mode-hook 'fp-c-mode-routine)
(defun fp-c-mode-routine ()
  (local-set-key "\M-q" 'rebox-comment))
(autoload 'rebox-comment "rebox" nil t)
(autoload 'rebox-region "rebox" nil t)

(defun do_insert_time ()
  (interactive)
 (insert (current-time-string)))

;; Our own modes repository
(setq load-path (cons "~/.emacs.d/" load-path))

;; d-mode
(load-file "~/.emacs.d/modes/d-mode.el")
(require 'compile)
(add-to-list
 'compilation-error-regexp-alist
 '("^\\([^ \n]+\\)(\\([0-9]+\\)): \\(?:error\\|.\\|warnin\\(g\\)\\|remar\\(k\\)\\)"
   1 2 nil (3 . 4)))

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(ecb-auto-expand-tag-tree (quote all))
 '(ecb-compile-window-height 10)
 '(ecb-compile-window-temporally-enlarge (quote after-selection))
 '(ecb-compile-window-width (quote edit-window))
 '(ecb-layout-name "left3")
 '(ecb-options-version "2.32")
 '(ecb-source-path (quote (("/home/babali/develop/netsoul/libdesoul" "libdesoul") ("/home/babali/develop/netsoul/soulmebaby" "soulmebaby"))))
 '(ecb-tree-expand-symbol-before t)
 '(ecb-windows-width 45)
 '(speedbar-default-position (quote left))
 '(speedbar-frame-parameters (quote ((minibuffer) (width . 42) (border-width . 0) (menu-bar-lines . 0) (tool-bar-lines . 0) (unsplittable . t) (left-fringe . 0))))
 '(highlight-current-line-globally t nil (highlight-current-line)))

(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(highlight-current-line-face ((t (:background "#032333" :inverse-video nil)))))
