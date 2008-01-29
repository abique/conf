;; Load gentoo site
(if (file-readable-p "/usr/share/emacs/site-lisp/site-gentoo.el")
    (load "/usr/share/emacs/site-lisp/site-gentoo"))
(if (file-readable-p "/usr/share/emacs/site-lisp/debian-startup.el")
    (load "/usr/share/emacs/site-lisp/debian-startup"))

;; Our own modes repository
(setq load-path (cons "~/.emacs.d/" load-path))
(setq load-path (cons "~/.emacs.d/modes" load-path))

;; UTF-8
(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
;; END OF UTF-8 :p

;;============================
;; Emacs customization script
;;============================

(setq inhibit-startup-message t)      ; don't show the GNU splash screen
(scroll-bar-mode nil)                 ; no scroll bar
(menu-bar-mode -1)                    ; no menu bar
(tool-bar-mode -1)                    ; no tool bar
(setq frame-title-format "<[ %b ]>")  ; titlebar shows buffer's name
(global-font-lock-mode t)             ; syntax highlighting
(setq font-lock-maximum-decoration t) ; maximum decoration for all modes
(show-paren-mode t)                   ; show opposing paren while hovering
(setq scroll-step 1)                  ; smooth scrolling
(delete-selection-mode t)             ; typing removes highlighted text
(line-number-mode t)                  ; display line number in modeline
(column-number-mode t)                ; display column number in modeline
;;(setq display-time-day-and-date t)  ; display date in modeline
(setq display-time-24hr-format t)     ; european 24h format
(display-time)                        ; display time in modeline
(auto-compression-mode t)             ; open compressed files
(mouse-wheel-mode t)                  ; enable mouse wheel
(fset 'yes-or-no-p 'y-or-n-p)         ; y or n will do
(setq default-major-mode 'text-mode)  ; change default major mode to text
(setq ring-bell-function 'ignore)     ; turn the alarm totally off
(setq-default indent-tabs-mode nil)   ; spaces instead of tabs
(setq make-backup-files nil)          ; no backupfile
(setq delete-auto-save-files t)       ; delete unnecessary autosave files
(setq delete-old-versions t)          ; delete oldversion file
(setq next-line-add-newlines nil)     ; prevents new line after eof
(setq default_indice_empty_lines t)   ; show lines at end of file
;;(normal-erase-is-backspace-mode)    ; delete touch work
(auto-image-file-mode)                ; to see picture in emacs
(dynamic-completion-mode)             ; dynamic completion
(when (string-match "^22." emacs-version)
  (ido-mode t))
(when (string-match "^23." emacs-version)
  (ido-mode t))
(icomplete-mode)

;; C/C++ HL mode
;;(add-hook 'c-mode-common-hook (lambda () (highline-local-mode 1)))

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
(add-to-list 'auto-mode-alist '("\\.pro$" . sh-mode)) ;; Qt .pro files
(add-to-list 'auto-mode-alist '("CMakeLists.txt$" . cmake-mode))


;; C mode
(add-hook `c-mode-hook `rm-trailing-spaces-always)

;;; (c-set-offset 'substatement-open 2)   ; change '{' indentation
;;; (c-set-offset 'case-label '+)         ; make each case line indent from switch
;;; (c-set-offset 'brace-list-open '0)
;;; (c-set-offset 'statement-case-open '0)
;;; (c-set-offset 'block-open 2)          ; after '{' indentation
;;; (c-set-offset 'statement-block-intro 2)
;;; (setq c-basic-offset 4)
(if (string-equal (system-name) "dhcp-17.rep.sj")
    (progn (load-file "~/.emacs.d/styles/smartjog.el")
	   (setq c-default-style "smartjog"))
  (progn (load-file "~/.emacs.d/styles/babali.el")
	 (setq c-default-style "babali")))

(setq default-indicate-empty-lines t) ; show the end of the file
(setq c-font-lock-extra-types
      (append
       '("t_\\sw+")
       '("s_\\sw+")
       '("u_\\sw+")
       '("f_\\sw+")
       '("e_\\sw+")
       '("\\sw+_t")
       '("\\sw+_s")
       '("\\sw+_u")
       '("\\sw+_f")
       '("\\sw+_e")
       c-font-lock-extra-types))
(setq c-mode-hook
      '(lambda()
	 (local-set-key (kbd "<return>") 'newline-and-indent)))

;; Java mode
(setq java-basic-offset 4)

(add-to-list 'load-path "~/.emacs.d")
(add-to-list 'load-path "~/.emacs.d/modes")

;; Theme
(set-mouse-color "DarkSalmon")
(set-cursor-color "DarkOrange3")

;; COLOR THEME
(add-to-list 'load-path "~/.emacs.d/color-theme")
(require 'color-theme)
(if (fboundp 'color-theme-initialize) (color-theme-initialize))
;;(color-theme-charcoal-black)
;;(color-theme-late-night)
;;(color-theme-comidia)
(color-theme-taylor)
;;(color-theme-classic)
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
(global-set-key [f1] 'indent-buffer)
(global-set-key [f2] 'delete-trailing-whitespace)
(global-set-key [f4] 'kill-this-buffer)
(global-set-key [f5] 'compile)
(global-set-key [f6] 'recompile)
(global-set-key [f7] 'kill-compilation)
(global-set-key [f8] 'next-error)
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
;;
;; Programation modes
;;
(setq user-nickname "Alexandre Bique")
(setq user-full-name "Alexandre Bique")
;(load-file "~/.emacs.d/modes/div.el")

;; Our own modes repository
(setq load-path (cons "~/.emacs.d/" load-path))

;; F6100
;;; (if (file-exists-p "~/.emacs.d/modes/f6100_mode.el")
;;;     (load-file "~/.emacs.d/modes/f6100_mode.el"))

;; Tiger
;;; (autoload 'tiger-mode "tiger-mode" "tiger editing mode." t)
;;; (add-to-list 'auto-mode-alist '("\\.tig$" . tiger-mode))

;; Flex
;;; (autoload 'flex-mode "flex-mode" "flex editing mode." t)
;;; (add-to-list 'auto-mode-alist '("\\.l$" . flex-mode))
;;; (add-to-list 'auto-mode-alist '("\\.ll$" . flex-mode))

;;; ;; Bison
;;; (autoload 'bison-mode "bison-mode" "bison editing mode." t)
;;; (add-to-list 'auto-mode-alist '("\\.y$" . bison-mode))
;;; (add-to-list 'auto-mode-alist '("\\.yy$" . bison-mode))

;;; ;; XML and traces
;;; (setq auto-mode-alist
;;;       (cons '("\\.trace$" . sgml-mode) auto-mode-alist))
;;; (setq auto-mode-alist
;;;       (cons '("\\.xml" . sgml-mode) auto-mode-alist))

;(load "~/.emacs.d/modes/d-mode.el")
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
 '(ecb-source-path (quote ("/home/babali/epita/yaka/Chess2009/work/ref" "/home/babali/develop/netsoul")))
 '(ecb-tree-expand-symbol-before t)
 '(ecb-windows-width 45)
 '(highlight-current-line-globally t nil (highlight-current-line)))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(highlight-current-line-face ((t (:background "#032333" :inverse-video nil)))))
