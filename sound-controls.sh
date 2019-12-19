#!/bin/sh

SINK=$(pactl list sinks | grep Name | awk "{print \$2}")

invert_mute() {
  ISMUTE=$(pactl list sinks | grep Mute | awk "{print \$2}")
  if [ $ISMUTE = "yes" ]
  then
    unmute
  else
    mute
  fi
}

mute() {
  pactl set-sink-mute $SINK toggle
}


unmute() {
  pactl set-sink-mute $SINK false
}

case "$1" in
    increase)
        unmute && pactl set-sink-volume $SINK +10%
        ;;
    decrease)
        unmute && pactl set-sink-volume $SINK -10%
        ;;
    mute)
        mute
        ;;
    unmute)
        unmute
        ;;
    invert_mute)
        invert_mute
        ;;
    *)
        echo "Usage: $0 {increase|decrease|mute|invert_mute}"
        exit 1
esac

exit 0
