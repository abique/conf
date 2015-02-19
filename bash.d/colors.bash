black=$'\e[0;30m'
red=$'\e[0;31m'
green=$'\e[0;32m'
yellow=$'\e[0;33m'
blue=$'\e[0;34m'
magenta=$'\e[0;35m'
cyan=$'\e[0;36m'
grey=$'\e[0;37m'
white=$'\e[m'

blackB=$'\e[1;30m'
redB=$'\e[1;31m'
greenB=$'\e[1;32m'
yellowB=$'\e[1;33m'
blueB=$'\e[1;34m'
magentaB=$'\e[1;35m'
cyanB=$'\e[1;36m'
greyB=$'\e[1;37m'
whiteB=$'\e[1m'

function color()
{
    sed s/"\($2\)"/$(eval echo -n \$$1)'\1'$'\e[m'/g
}
