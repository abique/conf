;; Theme
(set-mouse-color "DarkSalmon")
(set-cursor-color "DarkOrange3")

;; COLOR THEME
(require 'color-theme)
(if (fboundp 'color-theme-initialize) (color-theme-initialize))
;;(color-theme-charcoal-black)
;;(color-theme-late-night)

(if window-system
    (color-theme-taylor)
  (color-theme-clarity))
;;(color-theme-subtle-hacker)
;;(color-theme-comidia)
;;(color-theme-taylor)
;;(color-theme-classic)
;;(color-theme-billw)
;;(color-theme-dark-blue2)
;;(color-theme-hober)
;;(color-theme-ld-dark)
