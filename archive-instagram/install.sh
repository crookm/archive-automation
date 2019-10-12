DIR=$(dirname $(readlink -f "$0"))

pip3 install instaloader

read -p "Your instagram username: " IG_USER
instaloader --login=$IG_USER --sessionfile="$HOME/.automation/archive-instagram.session"

systemctl link $DIR/systemd/archive-instagram.service
systemctl link $DIR/systemd/archive-instagram.timer

systemctl enable archive-instagram.service