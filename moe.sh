#!/bin/bash

# Create a new client directory
read -p "Enter client's name: " CLIENT_NAME;

NAME=$(tr '[:upper:]' '[:lower:]' <<< "$CLIENT_NAME")

unset CLIENT_DIR;
unset CONFIG_DIR;
unset CLIENT_DIR;
unset INGEST_DIR;
unset ENCODE_DIR;
unset PARSER_DIR;
unset TRANSFER_DIR;
unset DATABASE_DIR;
unset NOTIFIER_DIR;

if [ $CLIENT_NAME ]
then
  CLIENT_DIR="./src/clients/$NAME";
  echo "Setting up $CLIENT_DIR client's in moe...";
  mkdir -p $CLIENT_DIR;
  if [ -d "$CLIENT_DIR" ]
  then
    echo "Client directory $NAME created successfully.";
    CONFIG_DIR="$CLIENT_DIR/config";
    INGEST_DIR="$CLIENT_DIR/ingest";
    ENCODE_DIR="$CLIENT_DIR/encode";
    PARSER_DIR="$CLIENT_DIR/parser";
    TRANSFER_DIR="$CLIENT_DIR/transfer";
    DATABASE_DIR="$CLIENT_DIR/database";
    NOTIFIER_DIR="$CLIENT_DIR/notifier";
    mkdir -p $INGEST_DIR $ENCODE_DIR $PARSER_DIR $TRANSFER_DIR $DATABASE_DIR $NOTIFIER_DIR;
    echo "Setting up $CONFIG_DIR in $CLIENT_DIR...";
    mkdir -p $CONFIG_DIR $INGEST_DIR $ENCODE_DIR $PARSER_DIR $TRANSFER_DIR $DATABASE_DIR $NOTIFIER_DIR;
    if [ -d $CONFIG_DIR ]
    then
      echo "Config directory created.";
      cp "./.env.example" "$CONFIG_DIR/.env.example";
      touch "$INGEST_DIR/index.ts" "$ENCODE_DIR/index.ts" "$PARSER_DIR/index.ts" "$TRANSFER_DIR/index.ts" "$DATABASE_DIR/index.ts" "$NOTIFIER_DIR/index.ts";
      echo "Creating .env.example in $CONFIG_DIR directory.";
      if [ -f "$CONFIG_DIR/.env.example" ];
      then
        cp  "$CONFIG_DIR/.env.example" "./.env"
        echo "Creating .env done!!!";
        if [ -f "./.env" ]
        then
          echo "export const ENV='$CONFIG_DIR/.env.example';" > "./example.ts"
        else
          echo "Error: .env not found.";
          exit 2123;
        fi;
      else
        echo "Something went wrong while creating .env.";
        exit 1234;
      fi;
    else
      echo "Error: Directory $CONFIG_DIR does not exists.";
      exit 9888;
    fi;
    echo "$CONFIG_DIR created successfully.";
  else
    echo "Error creating $CLIENT_DIR...";
    exit 5678;
  fi;
else
  echo "Please type the client's name directory to be created!";
fi;
