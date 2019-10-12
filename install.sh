DIR=$(dirname $(readlink -f "$0"))

mkdir -p "$HOME/.automation"

sudo loginctl enable-linger $USER

sudo systemctl link $DIR/automation.slice

/bin/bash archive-instagram/install.sh
/bin/bash archive-youtube/install.sh