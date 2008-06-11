#! /usr/local/bin/bash
# BabaLi's bashrc <bique.alexandre@gmail.com>

# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
    # Shell is non-interactive.  Be done now!
    return
fi

function my_source()
{
    if test -r "$1" ; then
	source "$1"
    fi
}

# Enable colors for ls, etc.  Prefer ~/.dir_colors #64489
if which dircolors >/dev/null ; then
    eval `dircolors -b`
fi

if [[ $TERM = "linux" ]] ; then
    unicode_start
fi

my_source /etc/bash_completion
my_source ~/.bash.d/alias.bash
my_source ~/.bash.d/env.bash
my_source ~/.bash.d/colors.bash
my_source ~/.bash.d/prompt.bash
my_source ~/.bash.d/svn.bash
my_source ~/.bash.d/smartjog.bash
my_source ~/.bash.d/proxy.bash
my_source ~/.bash.d/local.bash

complete -d cd
set completion-ignore-case on
set print-completions-horizontally on
set visible-stats on
umask 0077

~/.bash.d/xtiff.pl
