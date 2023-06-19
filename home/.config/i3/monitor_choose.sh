#!/bin/bash
PS3='Choose your display setting : '
display=("Single" "Double" "Triple_1" "Triple_2" "Quit")
select fav in "${display[@]}"; do
    case $fav in
        "Single")
            echo "You choose $fav display setting"
            xrandr --output eDP --primary --mode 1920x1080 --pos 0x0 --rotate normal --output HDMI-A-0 --off --output DisplayPort-0 --off --output DisplayPort-1 --off --output DisplayPort-2 --off --output DisplayPort-3 --off
            ;;
        "Double")
            echo "You choose $fav display setting"
            xrandr --output eDP --primary --mode 1920x1080 --pos 1920x0 --rotate normal --output HDMI-A-0 --off --output DisplayPort-0 --off --output DisplayPort-1 --mode 1920x1080 --pos 0x0 --rotate normal --output DisplayPort-2 --off --output DisplayPort-3 --off
            ;;
        "Triple_1")
            echo "You choose $fav display setting"
            # xrandr --output eDP --primary --mode 1920x1080 --pos 1080x1080 --rotate normal --output HDMI-A-0 --off --output DisplayPort-0 --off --output DisplayPort-1 --off --output DisplayPort-2 --mode 1920x1080 --pos 0x0 --rotate left --output DisplayPort-3 --mode 1920x1080 --pos 1080x0 --rotate normal
            xrandr --output eDP --primary --mode 1920x1080 --pos 1080x1080 --rotate normal --output HDMI-A-0 --off --output DisplayPort-0 --off --output DisplayPort-1 --off --output DisplayPort-2 --mode 1920x1080 --pos 1080x0 --rotate normal --output DisplayPort-3 --mode 1920x1080 --pos 0x0 --rotate left
	    break
            ;;
        "Triple_2")
            echo "You choose $fav display setting"
            xrandr --output eDP --primary --mode 1920x1080 --pos 1080x1080 --rotate normal --output HDMI-A-0 --off --output DisplayPort-0 --off --output DisplayPort-1 --off --output DisplayPort-2 --mode 1920x1080 --pos 0x0 --rotate left --output DisplayPort-3 --mode 1920x1080 --pos 1080x0 --rotate normal
	    break
            ;;
	"Quit")
	    echo "User requested exit"
	    exit
	    ;;
        *) echo "invalid option $REPLY";;
    esac
done
