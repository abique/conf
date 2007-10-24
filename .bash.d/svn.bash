function svndiff()
{
    $(which svn) diff $* | vim -
}

function svnst()
{
    $(which svn) st $* |
    sed 's/^\(M.*\)/'$(echo -en '\e[0;34m')'\1'$(echo -en '\e[m')'/g' |
    sed 's/^\( M.*\)/'$(echo -en '\e[0;34m')'\1'$(echo -en '\e[m')'/g' |
    sed 's/^\(!.*\)/'$(echo -en '\e[0;31m')'\1'$(echo -en '\e[m')'/g' |
    sed 's/^\(\?.*\)/'$(echo -en '\e[0;33m')'\1'$(echo -en '\e[m')'/g' |
    sed 's/^\(A.*\)/'$(echo -en '\e[0;32m')'\1'$(echo -en '\e[m')'/g'
}

function svn()
{
    if [[ $1 = "st" ]] ; then
        shift
        svnst $@
    elif [[ $1 = "diff" ]] ; then
        shift
        svndiff
    else
        $(which svn) $*
    fi
}
