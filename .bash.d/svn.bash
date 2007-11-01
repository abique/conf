function svndiff()
{
    $(which svn) diff "$@" | vim -
}

function svnst()
{
    $(which svn) st "$@" | sed '
s/$/'${white}'/g
s/^M/'${blue}'M/g
s/^ M/'${blue}' M/g
s/^!/'${magenta}'!/g
s/^\?/'${yellow}'\?/g
s/^A/'${green}'A/g
s/^D /'${red}'D /g
'
}

function svnup()
{
    $(which svn) up "$@" | sed '
s/revision \([0-9]\+\)\.$/revision '${cyanB}'\1'${white}'\./g
s/^Restored /'${yellow}'Restored /g
s/$/'${white}'/g
s/^U /'${cyan}'U /g
s/^ U /'${cyan}' U /g
s/^C /'${red}'C /g
s/^A /'${green}'A /g
s/^D /'${magenta}'D /g
'
}

function svnadd()
{
    $(which svn) add "$@" | sed '
s/$/'${white}'/g
s/^A /'${green}'A /g
'
}

function svnci()
{
    $(which svn) ci "$@" | sed '
s/revision \([0-9]\+\)\.$/revision '${cyanB}'\1'${white}'\./g
s/$/'${white}'/g
s/^Sending /'${green}'Sending /g
s/^Adding /'${yellow}'Adding /g
s/^Deleting /'${red}'Deleting /g
'
}

function svn()
{
    case $1 in
        st)     shift; svnst "$@";;
        diff)   shift; svndiff "$@";;
        up)     shift; svnup "$@";;
	ci)	shift; svnci "$@";;
        add)    shift; svnadd "$@";;
        *)      $(which svn) "$@";;
    esac
}
