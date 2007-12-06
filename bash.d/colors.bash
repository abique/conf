red=$(echo -ne "\e[0;31m")
green=$(echo -ne "\e[0;32m")
yellow=$(echo -ne "\e[0;33m")
blue=$(echo -ne "\e[0;34m")
magenta=$(echo -ne "\e[0;35m")
cyan=$(echo -ne "\e[0;36m")
white=$(echo -ne "\e[m")

redB=$(echo -ne "\e[1;31m")
greenB=$(echo -ne "\e[1;32m")
yellowB=$(echo -ne "\e[1;33m")
blueB=$(echo -ne "\e[1;34m")
magentaB=$(echo -ne "\e[1;35m")
cyanB=$(echo -ne "\e[1;36m")
whiteB=$(echo -ne "\e[1m")

function color()
{
    sed s/"\($2\)"/$(eval echo -n \$$1)'\1'$(echo -en "\e[m")/g
}
