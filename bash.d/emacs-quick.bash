#! /bin/bash

exec emacs -Q -nw -eval '(load-file "~/.emacs.d/quick.el")' "$@"
