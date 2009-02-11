#! /bin/bash

exec emacs -Q -nw -eval "(setq make-backup-files nil)(setq delete-auto-save-files t)(setq delete-old-versions t)" "$@"
