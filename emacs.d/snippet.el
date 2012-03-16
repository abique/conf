(add-to-list 'load-path "/usr/share/emacs/site-lisp/yas")
(require 'yasnippet) ;; not yasnippet-bundle
(yas/initialize)
(yas/load-directory "/usr/share/emacs/site-lisp/yas/snippets")
