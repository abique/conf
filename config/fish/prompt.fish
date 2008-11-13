function fish_prompt -d "Write the prompt"
    set old_status $status
    if test $old_status != 0
        printf '%s%s ' (set_color red) $old_status
    end
    printf '%s%s@%s:%s%s' (set_color cyan) (whoami) (hostname) (set_color blue) (prompt_pwd)
    printf '%s> ' (set_color yellow)
end
