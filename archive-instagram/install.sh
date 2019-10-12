pip3 install instaloader

read -p "Your instagram username: " IG_USER
instaloader --login=$IG_USER --sessionfile="$HOME/.automation/archive-instagram.session"

systemctl link systemd/archive-instagram.service
systemctl link systemd/archive-instagram.timer

systemctl enable archive-instagram.service