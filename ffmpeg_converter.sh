#!/bin/sh

echo "Today's date is " $(date)

echo "\nEnter the path directory"

read -r the_path

echo "\nThe path has the following files and folders: "

THE_PATH=$(tr '[:upper:]' '[:lower:]' <<< "${the_path}")
patterns="*.mp4"

if [[ -d "${THE_PATH}" ]]; then
  NEW_PATH_DIR="${THE_PATH}"/Audio;
  echo "Setting the mp3 files to folder...";
  mkdir -p "${NEW_PATH_DIR}";
  if [[ -d "${NEW_PATH_DIR}" ]]; then
    echo "New directory ${NEW_PATH_DIR} created successfully.\n";
    echo "\nEnter Output format..."
    read -r Output_format
    for file in "${THE_PATH}"/$patterns; do
      if [[ -f "${file}" ]]; then
        basePath=$(tr -d '[:space:]' <<< "${file##*/}")
        ffmpeg -i "${file}" "${NEW_PATH_DIR}"/${basePath}.${Output_format}
        rm -f $(file)
      else
        echo "No file's found in the directory ${THE_PATH}.";
        exit 213;
      fi;
    done;
  fi;
fi;
