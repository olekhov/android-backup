#!/bin/sh

################
# Android personal data backuper.
# No root required.
# USB debugging must be enabled.
#
# This script just downloads folders from backup_folders variable.
# adjust for your device


declare -a backup_folders

backup_folders[0]=/storage/emulated/0/DCIM     # Camera photos
backup_folders[1]=/storage/emulated/0/Telegram # Telegram photos, videos, audio and docs 
backup_folders[2]=/storage/emulated/0/Pictures # Screenshots etc
backup_folders[3]=/storage/emulated/0/Android/data/com.github.axet.audiorecorder/files # My audiorecorder

folder=`date +%Y%m%d-%H%M%S`

mkdir $folder
cd $folder
for x in ${backup_folders[*]} ; do
	echo "Backuping $x.."
	adb pull $x
done;
cd ..
