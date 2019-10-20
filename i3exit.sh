#!/bin/sh

I3_SCRIPTS_FOLDER=$HOME/dev/i3-scripts
lock() {
    # $HOME/dev/i3-scripts/lockandblur.sh
    i3lock -i $($I3_SCRIPTS_FOLDER/random-wallpaper/target/release/random-wallpaper)
}

case "$1" in
    lock)
        lock
        ;;
    logout)
        i3-msg exit
        ;;
    suspend)
        lock && systemctl suspend
        ;;
    hibernate)
        lock && systemctl hibernate
        ;;
    reboot)
        systemctl reboot
        ;;
    shutdown)
        systemctl poweroff
        ;;
    *)
        echo "Usage: $0 {lock|logout|suspend|hibernate|reboot|shutdown}"
        exit 2
esac

exit 0
