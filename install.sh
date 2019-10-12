DIR=dirname $(readlink -f "$0")

mkdir -p "$HOME/.automation"

loginctl enable-linger $USER

systemctl link $DIR/automation.slice

/bin/bash archive-instagram/install.sh