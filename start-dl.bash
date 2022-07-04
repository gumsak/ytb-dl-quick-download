#!/bin/bash

### Get the youtube URL from the command's argument ###
url=$1

### Destination folder of the downloaded files ###
music_folder_path="./music"

### Basic command to execute youtube-dl ###
youtube_dl_command="./youtube-dl"

### File format wanted ###
file_type="mp3"

### Options about the downloaded files ###
option_audio_format="--audio-format ${file_type}"
option_specific_folder="-o ${music_folder_path}/%(title)s.%(ext)s"
option_extract_audio="-x"
option_include_thumbnail="--embed-thumbnail"

### Create the directory where the downloaded music will be saved ###
if ! [ -d "$music_folder_path" ]; then
	echo "Creating directory ${music_folder_path} ..."
	mkdir $music_folder_path
fi

COMPLETE_CALL=""

### Add a thumbnail to the file, if it is an mp3. This is up to you.. really ###
if [ "${file_type}" = "flac" ]; then
	COMPLETE_CALL="${youtube_dl_command} ${option_extract_audio} ${option_audio_format} ${option_specific_folder} ${1}"
	else
	COMPLETE_CALL="${youtube_dl_command} ${option_include_thumbnail} ${option_extract_audio} ${option_audio_format} ${option_specific_folder} ${1}"
fi

exec $COMPLETE_CALL