#!/usr/bin/env bash

chosen=$(printf "  Power Off\n  Restart\n  Suspend\n  Hibernate\n  Log Out\n  Lock" | rofi -dmenu -i -theme '~/.config/rofi/nord2.rasi')

case "$chosen" in
	"  Power Off") poweroff ;;
	"  Restart") reboot ;;
	"  Suspend") systemctl suspend-then-hibernate ;;
	"  Hibernate") systemctl hibernate ;;
	"  Log Out") hyprctl dispatch exit ;;
	"  Lock") hyprlock ;;
	*) exit 1 ;;
esac
