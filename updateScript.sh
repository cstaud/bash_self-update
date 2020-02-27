#!/bin/bash


#  echo -n "Inserting update process..."
#  exec /bin/bash updateScript.sh

SELF="$0"

self_update() {
  echo "Performing self-update ..."

  echo -n "Downloading latest version..."
  if ! wget --quiet --output-document="$SELF" ; then
    echo "Failed: Error while trying to wget new version!"
    echo "File requested: https://raw.githubusercontent.com/cstaud/bash_self-update/master/$SELF"
    exit 1
  fi
  echo "Done."

  # Copy over modes from old version
#  OCTAL_MODE=$(stat -c '%a' "$SELF")
#  if ! chmod "${OCTAL_MODE}" "$SELF.tmp" ; then
#    echo "Failed: Error while trying to set mode on $0.tmp."
#    exit 1
#  fi
#
#   Spawn update script
#  cat > updateScript.sh << EOF
#!/bin/bash
# Overwrite old file with new
#if mv "$0.tmp" "$0"; then
#  echo "Done. Update complete."
#  rm \$0
#else
#  echo "Failed!"
#fi
#EOF
}

main() {
   echo "Running v0"
}

self_update
main