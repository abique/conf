function svndiff()
{
    $(which svn) diff $* | vim -
}

function svnst()
{
    $(which svn) st $* | sed '
s/$/'${white}'/g
s/^M/'${blue}'M/g
s/^ M/'${blue}' M/g
s/^!/'${red}'!/g
s/^\?/'${yellow}'\?/g
s/^A/'${green}'A/g
'
}

function svnup()
{
    $(which svn) up $* | sed '
s/revision \([0-9]\+\)\.$/revision '${cyan}'\1'${white}'\./g
s/$/'${white}'/g
s/^U/'${cyan}'U/g
s/^C/'${red}'C/g
'
}

function svn()
{
    case $1 in
        st)     shift; svnst $*;;
        diff)   shift; svndiff $*;;
        up)     shift; svnup $*;;
        *)      $(which svn) $*;;
    esac
}
