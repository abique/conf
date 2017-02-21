unalias -a

case `uname -s` in
    FreeBSD|Darwin) alias ls="ls -GhF" ;;
    Linux) alias ls="ls --color=auto -hF" ;;
esac
alias la='ls -a'
alias l='ls -l'
alias lt='l -t'
alias ll='la -l'
alias llt='ll -t'
alias lhc='l *.[hc]'

alias pcd='cd -P'
alias m='make'
alias c='cat'
alias ce='cat -e'
alias cn='cat -n'
alias df='df -h'
alias du='du -h --max-depth=1'
alias reload="source ~/.bashrc"
alias tx="bsdtar -xf"
alias txv="bsdtar -xvvvf"
alias v='vim'
alias e='~/.bash.d/emacs-quick.bash'
alias em='emacs -nw'
alias gdb='gdb --quiet'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias .......='cd ../../../../../..'
alias ........='cd ../../../../../../..'
alias grep="grep --color --exclude='*.svn*' --exclude='*.o' --exclude=TAGS"
alias valgrind_mleak='valgrind --leak-check=full --leak-resolution=high --show-reachable=yes --track-fds=yes'
alias pwgen='pwgen --symbols --secure --num-passwords=5 --capitalize -C --ambiguous 16'

alias p='sudo pacman'
alias pu='p -Syu'

alias rns='~/local/rns/renoise'

function ssh_vnc_tunnel()
{
    if [[ $# -eq 0 ]] ; then
	return
    fi
    ssh -L5901:localhost:5901 root@"$1" -N &
    vncviewer localhost:1
    wait $!
}

function b16b64()
{
    if [[ $# -eq 0 ]] ; then
	read HASH
	HASH=$(echo -n "${HASH}" | cut -f 1 -d ' ')
    else
	HASH="$1"
    fi

    python <<EOF
import base64
print base64.b64encode(base64.b16decode('${HASH}', True))
EOF
}

function b64b16()
{
    python <<EOF
import base64
print base64.b16encode(base64.b64decode('$1'))
EOF
}

function b64d()
{
    python <<EOF
import base64
print(base64.b64decode('$1'))
EOF
}

function x-ssh-agent()
{
    ssh-agent >~/.bash.d/ssh-agent.bash
    eval "$(<~/.bash.d/ssh-agent.bash)"
    ssh-add
}

function tg()
{
    "$@" >/dev/null 2>/dev/null
}

function lr()
{
    "$@" 2>&1 | less -R
}

function check_colors()
{
    for i in $(seq 30 37)
    do
        echo -e $((i - 30)): "\e[0;${i}mbande\e[m", "\e[1;${i}mbande\e[m", \
            "\e[3;${i}mbande\e[m", "\e[4;${i}mbande\e[m", \
            "\e[5;${i}mbande\e[m", "\e[7;${i}mbande\e[m"
    done
}

function aur_get()
{
    git clone https://aur.archlinux.org/"$1".git
    cd "$1"
}

function _kmtrace()
{
    LD_PRELOAD=/usr/lib/libktrace.so MALLOC_TRACE=ktrace.out "$@"
}

function emacs-byte-compile()
{
    for i in "$@"
    do
        emacs -batch -f batch-byte-compile "$i"
    done
}

function xxx()
{
    find . -name '*.c' -o -name '*.h' -o -name '*.cc' -o \
        -name '*.cpp' -o -name '*.hh' -o -name '*.hxx' | \
        xargs grep -inC5 '\(XXX\|todo\)'
}

function paste-binouse-send()
(
    host="$1"
    src="$2"
    temp=0

    if [[ -z "$src" || "$src" = "-" ]] ; then
        src=$(mktemp)
        cat >"$src"
        temp=1
    fi

    if [[ ! -r "$src" ]] ; then
        return
    fi

    mime_type=$(file --mime-type "$src" | cut -f 2 -d ' ')
    hdr=$(mktemp)
    curl -D "$hdr" --data-urlencode "content-type=${mime_type}" \
        --data-urlencode "content@${src}" "$host"

    echo "$host"$(sed -n 's/location: \(.*\)/\1/p' "$hdr")
    rm -rf "$hdr"
    if [[ $temp -eq 1 ]] ; then
        rm -f "$src"
    fi
)

alias u-he-pb="paste-binouse-send http://archear.u-he:11013/"
alias vader1="ssh bique@dslab-vader1.epfl.ch"
alias luke2="ssh bique@dslab-luke2.epfl.ch"
alias htop="htop -u $USER"

fix-clock-skew() {
    touch ___currtime___
    find . -cnewer ./___currtime___ -print0 | xargs -0 touch
    rm ___currtime___
}

find-sources() {
  if [[ "$1" = "" ]] ; then
    DIR=.
  else
    DIR="$1"
  fi

  find "$DIR" -name '*.h' -o -name '*.hh' -o -name '*.hxx' -o -name '*.cpp' -o -name '*.cc' -o -name '*.cpp' -o -name '*.C' -o -name '*.c' -o -name '*.mm'
}

find-includes() {
  find . -name include -type d
  find . -name model-include -type d
  echo float/pluginhost/lib/src/main/vst/
}

find-audio() {
    find . -iname '*.mp3' -o -iname '*.wav' -o -name '*.flac' -o \
         -name '*.aac' -o -name '*.ogg'
}

my-aac() (
    in="$1"
    out="$2"

    if [[ -z "$out" ]] ; then
        out=$(echo "$in" | sed 's/^\(.*\)\.\(wav\|flac\|ogg\|mp3\|mp4\)$/\1.aac/g')
    fi

    ffmpeg -i "$in" -c:a aac -b:a 320k -strict -2 "$out"
)

my-mp4() {
  in="$1"
  out="$2"

  if [[ -z "$out" ]] ; then
    out=$(echo "$in" | sed 's/^\(.*\)\.\(AVI\|avi\|MPG\|mpg\)$/\1.aac/g')
  fi

  ffmpeg -i "$in" -c:v libx265 -preset slow -x265-params crf=18 -c:a aac -strict experimental -b:a 128k "$out"
}

fix-video() {
  in="$1"
  out="fixed-$in"
  ffmpeg -i "$in" -c copy "$out"
}

bw-clear-nitro() {
    rm -rf ~/.BitwigStudio/cache/nitro
}

bw-install() (
    oldpwd="$PWD"

    suffix="$2"
    if [[ ! -z "$suffix" ]] ; then
      suffix="-$suffix"
    fi

    instdir="$HOME/local/bitwig${suffix}"

    mkdir -p "$instdir" &&
    cd "$instdir" &&
    if [[ -e "$1" ]] ; then
      ln -s "$1" bw.deb
    elif [[ -e "$oldpwd/$1" ]] ; then
      ln -sf "$oldpwd/$1" bw.deb
    else
      wget "$1" -O bw.deb
      md5sum bw.deb
    fi &&
    \bsdtar xf bw.deb &&
    \bsdtar xf data.tar.gz &&
    rm bw.deb &&
    rm data.tar.gz
)

start-jack() {
    /usr/bin/jackd -dalsa -dhw:USB -r44100 -p256 -n2 -s -Xseq -P &
    sleep 2
    pactl load-module module-jack-sink channels=2
    pactl load-module module-jack-source channels=2
    pacmd set-default-sink jack_out
    pacmd set-default-source jack_in
    fg
}

make-readable() {
  find . -type d -exec chmod go+rx {} \;
  find . -type f -exec chmod go+r {} \;
}

# evil
alias reaper='cd ~/.wine/drive_c/Program\ Files/REAPER\ \(x64\)/ && wine reaper.exe'
alias ableton='cd ~/.wine/drive_c/users/Public/Application\ Data/Ableton/Live\ 9\ Suite/Program/ && wine Ableton\ Live\ 9\ Suite.exe'
alias diablo3='cd ~/.wine/drive_c/Program\ Files\ \(x86\)/Diablo\ III/ && setarch i386 -3 -L -B -R wine Diablo\ III.exe -launch -opengl'
alias bnet='cd ~/.wine/drive_c/Program\ Files\ \(x86\)/Battle.net/ && setarch i386 -3 -L -B -R wine Battle.net\ Launcher.exe -launch -opengl'
alias hos='cd ~/.wine/drive_c/Program\ Files\ \(x86\)/Heroes\ of\ the\ Storm/ && setarch i386 -3 -L -B -R wine Heroes\ of\ the\ Storm.exe -launch -opengl'
