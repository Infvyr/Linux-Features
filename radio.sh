#!/bin/bash

# Script to open my favourite radio stations

clear

while :
do
echo "<********************************>"
echo "             M E N U"
echo "<********************************>"
echo "1. Open MuzFM Chisinau"
echo "2. Open ZaycevFM Relax"
echo "3. Open ZaycevFM New Rock"
echo "4. Open ZaycevFM Club"
echo "5. Open ZaycevFM Club"
echo "6. Exit Script"
echo "<********************************>"
read -r -p "Enter your choice [1-6] : " option

case $option in
1) echo 'Starting MuzFM...: ';  mpv http://live.muzfm.md:8000/muzfm;;
2) echo 'Starting ZaycevFM Relax...: ';  mpv https://zaycevfm.cdnvideo.ru/ZaycevFM_relax_256.mp3;;
3) echo 'Starting ZaycevFM New Rock'; mpv https://zaycevfm.cdnvideo.ru/ZaycevFM_rock_256.mp3;;
4) echo 'Starting ZaycevFM Club'; mpv --playlist=https://www.zaycev.fm/media/m3u/chanel_electronic.m3u;;
5) echo 'Starting Concept Radio'; mpv http://manager.conceptradio.fr:1460/stream;;
6) exit;;
*) echo -e "\e[033mJust select between 1 and 6\n\033[0m"
esac
done
