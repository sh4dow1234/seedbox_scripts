#!/bin/sh
dir1="/home/speedo/dwatch/"
#target2=/home/speedo/temp
#target=/home/speedo/PTP/WorkingDirectory/announcement
script="/home/speedo/scripts/notify.sh"
logfile="/home/speedo/scripts/logs/notify.log"

inotifywait "$dir1" --format '%w%f' --exclude  "(incomplete)" -e create | while read file ;do
	filename=$(basename "$file")
	filenameonly=${filename%.*}
	echo "Starting Script"
	screen -S notify -d -m "$script"
	telegram-send "NEW - $filename"
	echo "$(date "+%d.%m.%Y %T") INFO: $filename  Added." | tee -a "$logfile"
done
