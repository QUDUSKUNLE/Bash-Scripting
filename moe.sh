#!/bin/bash

# Create a new client directory
read -p "Enter client's name: " CLIENT_NAME;

NAME=$(tr '[:upper:]' '[:lower:]' <<< "$CLIENT_NAME")

unset CLIENT_DIR;

DIR="config ingest encode parser transfer database notifier";



if [ $CLIENT_NAME ]
then
  CLIENT_DIR="./src/clients/$NAME";
  echo "Setting up $CLIENT_DIR client's in moe...";
  mkdir -p $CLIENT_DIR;
  if [ -d "$CLIENT_DIR" ];
  then
    echo "Client directory $NAME created successfully.";
    for dir in $DIR;
    do
      mkdir -p "$CLIENT_DIR/$dir";
      if [ $dir != "config" ] && [ -d "$CLIENT_DIR/$dir" ];
      then
        touch "$CLIENT_DIR/$dir/index.ts" &&
        echo "Setting up $CLIENT_DIR/$dir in $CLIENT_DIR...";
      else
        echo "Config directory created.";
        cp "./.env.example" "$CLIENT_DIR/$dir/.env.example";

        [[ -f "$CLIENT_DIR/$dir/.env.example" ]] &&
        cp "$CLIENT_DIR/$dir/.env.example" "./.env" &&
        echo "Creating .env done!!!" || echo "Error copying into .env";

        [[ -f "./.env" ]] &&
        echo "export const ENV='$CLIENT_DIR/$dir/.env.example';" > "./example.ts" || echo "Error: .env not found.";
      fi;
    done;
  else
    echo "Error creating $CLIENT_DIR...";
    exit 5678;
  fi;
  echo "$CLIENT_NAME Done.";
else
  echo "Please type the client's name directory to be created!";
fi;
