#!/bin/bash

SETUP_CODES_DIR="./setup_codes"
RECOVERY_CODES_DIR="./recovery_codes"

if [ ! -d "$SETUP_CODES_DIR" ]; then
  # prompt for setup codes directory and supress newline after echo (-n arg)
  echo -n "Enter setup codes directory to encrypt (use * for current directory): "
  read SETUP_CODES_DIR
fi

if [ ! -d "$RECOVERY_CODES_DIR" ]; then
  # prompt for recovery codes directory and supress newline after echo (-n arg)
  echo -n "Enter recovery codes directory to encrypt (use * for current directory): "
  read RECOVERY_CODES_DIR
fi

# prompt for password to AES256 encrypt archive with
echo -n "Enter encrypt password: "
read password

# use 7-zip to encrypt specified directory
7za a -tzip "-p$password" -mem=AES256 backup_codes.zip $SETUP_CODES_DIR $RECOVERY_CODES_DIR

# check if zip command ran successfully before deleting the setup and recovery codes folders
if [ $? -eq 0 ]; then
  # remove plaintext setup and recovery codes folders
  rm -rf $SETUP_CODES_DIR $RECOVERY_CODES_DIR
  echo "Encrypted $SETUP_CODES_DIR and $RECOVERY_CODES_DIR successfully!!!"
else
  echo "Failed to encrypt the specified directories"
fi
