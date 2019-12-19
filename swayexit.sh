#!/bin/sh

I3_SCRIPTS_FOLDER=$HOME/dev/i3-scripts
lock() {
    # $I3_SCRIPTS_FOLDER/lockandblur.sh
    swaylock -i $($I3_SCRIPTS_FOLDER/random-wallpaper/target/release/random-wallpaper)
}

case "$1" in
    lock)
        lock
        ;;
    logout)
        swaymsg exit
        ;;
    suspend)
        systemctl suspend
        ;;
    hibernate)
        lock && dbus-send --system --print-reply --dest=org.freedesktop.login1 /org/freedesktop/login1 "org.freedesktop.login1.Manager.Hibernate" boolean:true
        ;;
    reboot)
        dbus-send --system --print-reply --dest=org.freedesktop.login1 /org/freedesktop/login1 "org.freedesktop.login1.Manager.Reboot" boolean:true
        ;;
    shutdown)
        systemctl poweroff
        ;;
    *)
        echo "Usage: $0 {lock|logout|suspend|hibernate|reboot|shutdown}"
        exit 2
esac

exit 0
