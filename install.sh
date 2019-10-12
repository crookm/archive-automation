mkdir -p "$HOME/.automation"

loginctl enable-linger $USER

systemctl link automation.slice

/bin/bash archive-instagram/install.sh