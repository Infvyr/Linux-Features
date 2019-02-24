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
echo "4. Open ZaycevFM Disco"
echo "5. Exit Script"
echo "<********************************>"
read -r -p "Enter your choice [1-5] : " option

case $option in
1) echo 'Starting MuzFM...: ';  mpv http://live.muzfm.md:8000/muzfm;;
2) echo 'Starting ZaycevFM Relax...: ';  mpv https://zaycevfm.cdnvideo.ru/ZaycevFM_relax_256.mp3;;
3) echo 'Starting ZaycevFM New Rock'; mpv https://zaycevfm.cdnvideo.ru/ZaycevFM_rock_256.mp3;;
4) echo 'Starting ZaycevFM Disco'; mpv https://www.zaycev.fm/media/m3u/chanel_electronic.m3u;;
5) exit;;
*) echo -e "\e[033mJust select between 1 and 5\n\033[0m"
esac
done
