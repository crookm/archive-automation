#!/bin/bash

PLAYLIST_DIR="$HOME/.automation/archive-youtube.txt"

if [ ! -x "$(command -v youtube-dl)" ]; then
  echo >&2 "Youtube-dl is not installed, but is required. Aborting"
  exit 1
fi

if [ ! -r $PLAYLIST_DIR ]; then
  echo >&2 "Could not access the playlist configuration file: $PLAYLIST_DIR. Aborting."
  exit 1
fi

youtube-dl --add-metadata --no-overwrites --restrict-filenames --output "%(playlist)s/%(playlist_index)s-%(title)s-%(id)s.%(ext)s" --quiet --batch-file $PLAYLIST_DIR