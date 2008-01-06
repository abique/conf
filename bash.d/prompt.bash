function prompt_babali()
{
    RET=$?

    system=$(uname -s)
    tmp="${system} ${USER}@${HOSTNAME}:${PWD}"
    promptsize=${#tmp}
    fillsize=$((${COLUMNS} - ((${promptsize} + 5) % ${COLUMNS})))
    fill=""
    # Make the filler if prompt isn't as wide as the terminal:
    while [[ ${fillsize} -gt "0" ]]
    do
	fill="${fill} "
   # The A with the umlaut over it (it will appear as a long dash if
   # you're using a VGA font) is \304, but I cut and pasted it in
   # because Bash will only do one substitution - which in this case is
   # putting $fill in the prompt.
	let fillsize=${fillsize}-1
    done

    if [ $RET -eq 0 ] ; then
	PS1="\[\033[0;0m\]\[\033[1;33m\]${system} "\
"\[\033[1;36m\]\u@\H:\[\033[1;34m\]${PWD}"\
"\[\033[1;33m\]${fill}$(date +%H:%M)\n"\
"\[\033[1;34m\][\[\033[1;32m\]OK\[\033[1;34m\]]"\
"\[\033[1;34m\][jobs:\[\033[1;36m\]\j\[\033[1;34m\]]"\
"\[\033[0;0m\]\[\033[0;32m\]>>\[\033[0;0m\]"
    else
	PS1="\[\033[0;0m\]\[\033[1;33m\]${system} "\
"\[\033[1;36m\]\u@\H:\[\033[1;34m\]${PWD}"\
"\[\033[1;31m\]${fill}$(date +%H:%M)\n"\
"\[\033[1;34m\][\[\033[1;31m\]$RET\[\033[1;34m\]]"\
"\[\033[1;34m\][jobs:\[\033[1;36m\]\j\[\033[1;34m\]]"\
"\[\033[0;0m\]\[\033[0;32m\]>>\[\033[0;0m\]"
    fi

# Change the window title of X terminals
    case $TERM in
	*xterm*|*rxvt*|Eterm)
	    echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/$HOME/~}\007"
	    ;;
	screen)
	    echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/$HOME/~}\033\\"
	    ;;
    esac
}

PROMPT_COMMAND="prompt_babali"
