(setq user-nickname "Alexandre Bique")
(setq user-full-name "Alexandre Bique")

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

(load-file "~/.emacs.d/styles/epita.el")
(load-file "~/.emacs.d/styles/kaneton.el")
(setq c-default-style "kaneton")

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

