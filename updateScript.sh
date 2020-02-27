#!/bin/bash

REPO_URL="https://raw.githubusercontent.com/cstaud/bash_self-update/master"
SELF="$0"
REMOTE_SCRIPT="$REPO_URL/$SELF"

self_update() {
  echo "Performing self-update ..."

  echo "Downloading latest version..."
  if ! wget --quiet --output-document="$SELF" "$REMOTE_SCRIPT"; then
    echo "Failed: Error while trying to wget new version!"
    echo "File requested: REMOTE_SCRIPT"
    exit 1
  fi
  echo "Done."

}

main() {
   echo "Running v0"
}

self_update
main