#!/bin/sh
dir1=/home/speedo/glftpd/site/X264
#target2=/home/speedo/temp
target=/home/speedo/PTP/WorkingDirectory/announcement
#script=/home/speedo/scripts/find.sh
script2=/home/speedo/scripts/X264.sh

inotifywait "$dir1" --format '%w%f' --exclude "(incomplete)" -e create | while read file ;do
	filename=$(basename "$file")
	filenameonly=${filename%.*}
	echo "Starting X264 Script"
	screen -S X264 -d -m "$script2"
	echo "$filename" | mail -s "New-X264" speedoinsane4@gmail.com
	cd "$file"
	echo "Downloading Scene Release"
	while [ ! -f ".message" ];
		do
		echo -ne "\r" [*
		sleep 1;
	done;
	echo "Extracting Rar Files..."
	unrar e *.rar
	echo "Cleaning Directory"
	rm -rf *\(*\)* .message *.r0* *.r1* *.r2* *.r3* *.r4* *.r5* *.r6* *.r7* *.r8* *.r9* *.rar *.sfv *.jpg *.png Proof Sample
	rm -rf *\(*\)* .message *.r0* *.r1* *.r2* *.r3* *.r4* *.r5* *.r6* *.r7* *.r8* *.r9* *.rar *.sfv *.jpg *.png Proof Sample
	echo "Sending File to PTP Watch Folder"
	echo "path=" "$file" > "$target"/[source=file][id=0][title="$filename"]
	echo "File Sent Successfully!"
done
