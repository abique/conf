SMS_DEVICE=/dev/ttyACM0

function send_sms()
(
    tel="$1"
    shift
    msg="$@"

    cat "$SMS_DEVICE" & PID=$!
    {
        printf "AT\r"
        sleep .3
        printf "AT+CMGF=1\r"
        sleep .3
        printf "AT+CMGS=\"$tel\"\r"
        sleep .3
        printf "$msg\x1a"
        sleep 2
    } >"$SMS_DEVICE"
    kill -15 $PID
    printf "\n-- DONE\n"
)
