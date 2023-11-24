#!/bin/sh

echo "Today's date is " $(date)

echo "\nEnter the path directory"

read -r thePath

THE_PATH=$(tr '[:upper:]' '[:lower:]' <<< "${thePath}")

patterns="*.mp4"

if [[ -d "${THE_PATH}" ]]; then
  echo "\nEnter audio directory name"

  read -r audioPath

  AUDIO_PATH=$(tr '[:upper:]' '[:lower:]' <<< "${audioPath}")

  NEW_PATH_DIR="${THE_PATH}"/"${AUDIO_PATH}";

  echo "\nSetting the mp3 files to folder...";

  mkdir -p "${NEW_PATH_DIR}";

  if [[ -d "${NEW_PATH_DIR}" ]]; then
    echo "\nNew directory ${NEW_PATH_DIR} created successfully.";

    echo "\nEnter Output format..."

    read -r outputFormat

    for file in "${THE_PATH}"/$patterns; do
      if [[ -f "${file}" ]]; then

        basePath=$(tr -d '[:space:]' <<< "${file##*/}")

        var="${file}"

        echo "\nProcessing file ${var} ....."

        ffmpeg -i "${file}" "${NEW_PATH_DIR}"/${basePath}.${outputFormat}

        echo "\nFile ${file} converted to ${outputFormat} successfully."

        rm -f "${var}"

        echo "\nFile ${file} removed from the system.\n"

      else
        echo "\nNo file's found in the directory ${THE_PATH}.";
        exit 213;
      fi;
    done;
  fi;
fi;
