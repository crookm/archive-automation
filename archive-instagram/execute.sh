#!/bin/bash

SESSION_ARGS=""

PROFILES_DIR="$HOME/.automation/archive-instagram.txt"
USERNAME_DIR="$HOME/.automation/archive-instagram.username"
SESSION_DIR="$HOME/.automation/archive-instagram.session"

if [ ! -x "$(command -v instaloader)" ]; then
  echo >&2 "Instaloader is not installed, but is required. Aborting"
  exit 1
fi

if [ ! -r $PROFILES_DIR ]; then
  echo >&2 "Could not access the profile configuration file: $PROFILES_DIR. Aborting."
  exit 1
fi

if [ -r $SESSION_DIR ]; then
  if [ ! -r $USERNAME_DIR ]; then
    echo >&2 "Could not access the username file: $USERNAME_DIR. This is required when specifying a session. Aborting."
    exit 1
  fi
  
  SESSION_ARGS="--login=$(head -n 1 $USERNAME_DIR) --sessionfile=$SESSION_DIR"

  # download bookmarked posts
  instaloader $SESSION_ARGS --quiet --fast-update --no-caption --no-metadata-json --no-compress-json --no-video-thumbnails --dirname-pattern=__bookmarked --filename-pattern={date_utc:%Y}/{date_utc}_UTC-{shortcode} ":saved"
fi

# download posts
instaloader $SESSION_ARGS --quiet --fast-update --no-captions --no-metadata-json --no-compress-json --no-video-thumbnails --dirname-pattern={profile} --filename-pattern={date_utc:%Y}/{date_utc}_UTC-{shortcode} +$PROFILES_DIR

# download stories
instaloader $SESSION_ARGS --quiet --fast-update --no-captions --no-metadata-json --no-compress-json --no-video-thumbnails --no-profile-pic --stories --no-posts --dirname-pattern={profile}/stories --filename-pattern={date_utc:%Y}/{date_utc}_UTC-{shortcode} +$PROFILES_DIR

# download highlights
instaloader $SESSION_ARGS --quiet --fast-update --no-captions --no-metadata-json --no-compress-json --no-video-thumbnails --no-profile-pic --highlights --no-posts --dirname-pattern={profile}/highlights --filename-pattern={date_utc:%Y}/{date_utc}_UTC-{shortcode} +$PROFILES_DIR
