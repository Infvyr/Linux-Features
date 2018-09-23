#!/bin/bash

# Bash script based on youtube-dl and ffmpeg tools

# Insert copied link and do next:
# 1. List all available format
# 2. Choose format and download
# 3. List your current directory
# 4. Extract MP3 audio track from video
# 5. Convert MP4 video to MP3 audio
# 6. Convert MP4 video to 0GG aPaste the URLo
# 7. Convert MP3 audio to OGG audio
# ============================================
clear
# check if on your system was installed multimedia players
# like vlc,mpv,clementine,smplayer,mplayer,xplayer,deadbeef,banshee
function program_is_installed {
  # set to 1 initially
  local return_=1
  # set to 0 if not found
  type $1 >/dev/null 2>&1 || { local return_=0; }
  # return value
  echo "$return_"
}

function echo_fail {
  # echo first argument in red
  printf "\e[31m✘ ${1}"
  # reset colours back to normal
  echo "\033[0m"
}

function echo_pass {
  # echo first argument in green
  printf "\e[32m✔ ${1}"
  # reset colours back to normal
  echo "\033[0m"
}

function echo_if {
  if [ $1 == 1 ]; then
    echo_pass $2
  else
    echo_fail $2
  fi
}

# main script
printf "\e[33mPaste the copied link here: "; read link
printf "\033[0m"
while :
do	  
echo -e "\n***********************"
printf "\tM E N U\n"
echo "***********************"
echo -e "youtube-dl commands..."
echo "[0] - Paste the URL"
echo "[1] - List all available format for your link"
echo "[2] - Download link"
echo "[3] - Extract MP3 audio track"
echo -e "******************************"
echo "***************************************************"
echo "[4] - View files in current directory"
echo "***************************************************"
echo -e "\nFFMPEG commands..."
printf "\e[33mTo convert video format to audio format\nyou must have installed on your system FFMPEG"
printf "\033[0m\n"
echo "[5] - Convert MP4 video to MP3 audio"
echo "[6] - Convert MP4 video to OGG audio"
echo "[7] - Convert MP3 audio to OGG audio"
echo -e "************************************"
echo "[8] - Open audio/video file"
echo "[9] - Exit Script"
echo -e "***************************\n"
read -r -p "Enter your choice [0-9]: " c

# c = 1,2,3 ...
case $c in
0)
	printf "\e[33mPaste the copied link here: "; 
	read link;
	printf "\033[0m";;

1) 
	youtube-dl -F $link;;

2) 	printf "Choose the URL's code for downloading: "
	read formatCode
	youtube-dl -f $formatCode --ignore-config --restrict-filenames --youtube-skip-dash-manifest --console-title -o '%(title)s.%(ext)s' $link;;

3)
	youtube-dl -x --audio-format mp3 --audio-quality 0 --restrict-filenames --youtube-skip-dash-manifest --console-title -o '%(title)s.%(ext)s' --ignore-config $link;;

4) 	echo -e "\nYour Current Directory is:\n"; pwd
	echo -e "\nYour multimedia files are next:\n"
	ls -shF1 | egrep '\.mp4$|\.mp3$|\.ogg$|\.webm$|\.exe$';;

5)
	echo -e "\nYou are here: "; pwd
	echo -e "\nAnd your multimedia files are next:" ; ls -shF1 | egrep '\.mp4$|\.mp3$|\.ogg$|\.webm$|\.exe$'
	printf "\n1.Source MP4 file name (ex. video.mp4)\n"
	read sourceFile
	printf "2.Output MP3 file name (ex. output.mp3)\n"
	read outputFile
	ffmpeg -y -i $sourceFile -vn -acodec libmp3lame -ac 2 -b:a 320k $outputFile;;

6)
	echo -e "\nYou are here: "; pwd
	echo -e "\nAnd your multimedia files are next:"; ls -shF1 | egrep '\.mp4$|\.mp3$|\.ogg$|\.webm$|\.exe$'
	printf "\n1.Source MP4 file name (ex. video.mp4):\n"
	read sourceFile
	printf "2.Output OGG file name (ex. output.ogg):\n"
	read outputFile
	ffmpeg -y -i $sourceFile -vn -acodec libvorbis -ac 2 -b:a 320k $outputFile;;

7)
	echo -e "\nYou are here: "; pwd
	echo -e "\nAnd your multimedia files are next:"; ls -shF1 | egrep '\.mp4$|\.mp3$|\.ogg$|\.webm$|\.exe$'
	printf "\n1.Source MP3 file name (ex. initial.mp3):\n"
	read sourceFile
	printf "2.Output OGG file name (ex. final.ogg):\n"
	read outputFile
	ffmpeg -y -i $sourceFile -vn -acodec libvorbis -ac 2 -b:a 320k $outputFile;;

8) 	
	while :
	do
	echo -e "[a] -> cvlc $(echo_if $(program_is_installed cvlc))"
	echo -e "[b] -> mpv $(echo_if $(program_is_installed mpv))"
	echo -e "[c] -> xplayer $(echo_if $(program_is_installed xplayer))"
	echo -e "[d] -> smplayer $(echo_if $(program_is_installed smplayer))"
	echo -e "[e] -> mplayer $(echo_if $(program_is_installed mplayer))"
	echo -e "[f] -> Clementine $(echo_if $(program_is_installed clementine))"
	echo -e "[g] -> Deadbeef $(echo_if $(program_is_installed deadbeef))"
	echo -e "[h] -> Banshee $(echo_if $(program_is_installed banshee))"
	echo -e "[0] -> Exit"
	read -r -p "Choose your favourite player which is installed in system: " players

		case $players in
			a) 
				ls -shF1 | egrep '\.mp4$|\.mp3$|\.ogg$|\.webm$|\.exe$'
				printf "Open file: " 
				read -r file2open
				cvlc $file2open;
				break;;
			b) 	
				ls -shF1 | egrep '\.mp4$|\.mp3$|\.ogg$|\.webm$|\.exe$'
				printf "Open file: " 
				read -r file2open
				mpv $file2open;
				break;;
			c) 	
				ls -shF1 | egrep '\.mp4$|\.mp3$|\.ogg$|\.webm$|\.exe$'
				printf "Open file: " 
				read -r file2open
				xplayer $file2open;
				break;;
			d) 	
				ls -shF1 | egrep '\.mp4$|\.mp3$|\.ogg$|\.webm$|\.exe$'
				printf "Open file: " 
				read -r file2open
				smplayer $file2open;
				break;;
			e) 	
				ls -shF1 | egrep '\.mp4$|\.mp3$|\.ogg$|\.webm$|\.exe$'
				printf "Open file: " 
				read -r file2open
				mplayer $file2open;
				break;;
			f) 	
				ls -shF1 | egrep '\.mp4$|\.mp3$|\.ogg$|\.webm$|\.exe$'
				printf "Open file: " 
				read -r file2open
				clementine $file2open;
				break;;
			g) 	
				ls -shF1 | egrep '\.mp4$|\.mp3$|\.ogg$|\.webm$|\.exe$'
				printf "Open file: " 
				read -r file2open
				deadbeef $file2open;
				break;;
			h) 	
				ls -shF1 | egrep '\.mp4$|\.mp3$|\.ogg$|\.webm$|\.exe$'
				printf "Open file: " 
				read -r file2open
				banshee $file2open;
				break;;
			0) 	break;;
			*) 	echo 'Command not found!'
		esac
	done
#break;;
continue;;
9) exit;;
*) echo "Select between 0 to 9 only";;
esac
done