;; -*- mode: Lisp; -*-
(setq user-nickname "abique")
(setq user-full-name "Alexandre Bique")
(setq user-mail-address "bique.alexandre@gmail.com")

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

(delete-selection-mode t)             ; typing removes highlighted text
(line-number-mode t)                  ; display line number in modeline
(column-number-mode t)                ; display column number in modeline
;;(setq display-time-day-and-date t)  ; display date in modeline
(setq display-time-24hr-format t)     ; european 24h format
(display-time)                        ; display time in modeline
(auto-compression-mode t)             ; open compressed files
;;(mouse-wheel-mode t)                  ; enable mouse wheel
(fset 'yes-or-no-p 'y-or-n-p)         ; y or n will do
(setq ring-bell-function 'ignore)     ; turn the alarm totally off
(setq-default indent-tabs-mode nil)   ; spaces instead of tabs
(setq make-backup-files nil)          ; no backupfile
(setq delete-auto-save-files t)       ; delete unnecessary autosave files
(setq delete-old-versions t)          ; delete oldversion file
(setq next-line-add-newlines nil)     ; prevents new line after eof
;;(setq default_indice_empty_lines t)   ; show lines at end of file
(setq default-indicate-empty-lines t) ; show the end of the file
;;(normal-erase-is-backspace-mode)    ; delete touch work
;;(auto-image-file-mode)              ; to see picture in emacs
;;(dynamic-completion-mode)           ; dynamic completion
(ido-mode t)			      ; good open file
(icomplete-mode)		      ; good M-x
