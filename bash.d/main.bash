#! /usr/local/bin/bash
# Alexandre BIQUE's bashrc <bique.alexandre@gmail.com>

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

complete -d cd
set completion-ignore-case on
set print-completions-horizontally on
set visible-stats on
shopt -s cdspell
shopt -s extglob
umask 0077

my_source /etc/bash_completion
my_source /usr/share/bash-completion/bash_completion
my_source /usr/share/clang/bash-autocomplete.sh
#my_source /etc/profile.d/go.sh
my_source ~/.bash.d/alias.bash
my_source ~/.bash.d/env.bash
my_source ~/.bash.d/colors.bash
my_source ~/.bash.d/prompt2.bash
my_source ~/.bash.d/svn.bash
my_source ~/.bash.d/smartjog.bash
my_source ~/.bash.d/proxy.bash
my_source ~/.bash.d/mobile-phone.bash
my_source ~/.bash.d/local.bash
my_source ~/.bash.d/ssh-agent.bash
