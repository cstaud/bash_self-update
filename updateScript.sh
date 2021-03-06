#!/bin/bash

self_update() {
  REPO_URL="https://raw.githubusercontent.com/cstaud/bash_self-update/master"
  SELF="$0"
  REMOTE_SCRIPT="$REPO_URL/$SELF"

  echo "Checking for self-update ..."
  diff=$(diff "$SELF" <(curl -s "$REMOTE_SCRIPT"))

  if [ -z "$diff" ]
  then
    echo "Already running on latest version, yeah!"
  else
    echo "Downloading latest version..."

    if ! curl --output "$SELF" "$REMOTE_SCRIPT"; then
      echo "Failed: Error while trying to curl new version!"
      echo "File requested: REMOTE_SCRIPT"
      exit 1
    fi
    echo "Done. Quitting deprecated version now."
    exit 0
  fi
}

go_fmt() {
  docker run --rm -v "$ROOT_DIR":/app golang:1.14 go fmt
}

main() {
  echo "Running v0"
  go_fmt
}

ROOT_DIR="$(git rev-parse --show-toplevel)"
[[ -d "${ROOT_DIR}" ]] || exit 1


self_update
main