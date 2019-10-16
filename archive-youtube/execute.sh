#!/bin/bash

PLAYLIST_DIR="$HOME/.automation/archive-youtube.txt"
ARCHIVE_FILE="archive.txt" # using this globally might result in unique downloads, e.g. /w playlists

if [ ! -x "$(command -v youtube-dl)" ]; then
  echo >&2 "Youtube-dl is not installed, but is required. Aborting"
  exit 1
fi

if [ ! -r $PLAYLIST_DIR ]; then
  echo >&2 "Could not access the playlist configuration file: $PLAYLIST_DIR. Aborting."
  exit 1
fi

youtube-dl --add-metadata --no-overwrites --restrict-filenames --recode-video mp4 --output "%(playlist)s/%(playlist_index)s-%(title)s-%(id)s.%(ext)s" --ignore-errors --no-warnings --quiet --download-archive $ARCHIVE_FILE --batch-file $PLAYLIST_DIR
