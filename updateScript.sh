#!/bin/bash

REPO_URL="https://raw.githubusercontent.com/cstaud/bash_self-update/master"
SELF="$0"
REMOTE_SCRIPT="$REPO_URL/$SELF"

self_update() {

  echo "Checking for self-update ..."
  diff=$(diff "$SELF" <(curl "$REMOTE_SCRIPT"))

  if [ -z "$diff" ]
  then
    echo "Already running on latest version, yeah!"
  else
    echo "Downloading latest version..."

    if ! wget --quiet --output-document="$SELF.new" "$REMOTE_SCRIPT"; then
      echo "Failed: Error while trying to wget new version!"
      echo "File requested: REMOTE_SCRIPT"
      exit 1
    fi
    echo "Done. Quitting deprecated version now."
    exit 0
  fi
}

main() {
  echo "Running v0"
}

self_update
main