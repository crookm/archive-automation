DIR=$(dirname $(readlink -f "$0"))

sudo pip3 install instaloader

read -p "Your instagram username: " IG_USER
instaloader --login=$IG_USER --sessionfile="$HOME/.automation/archive-instagram.session"

sudo systemctl link $DIR/systemd/archive-instagram.service
sudo systemctl link $DIR/systemd/archive-instagram.timer

sudo systemctl enable archive-instagram.service