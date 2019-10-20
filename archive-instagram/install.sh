DIR=$(dirname $(readlink -f "$0"))

sudo pip3 install instaloader

read -p "Setup instagram account? [y/N] " C_SETUP_IG
if [ $C_SETUP_IG = "y" ]; then
  read -p "Your instagram username: " IG_USER
  instaloader --login=$IG_USER --sessionfile="$HOME/.automation/archive-instagram.session"
fi

sudo systemctl link $DIR/systemd/archive-instagram.service

sudo systemctl enable $DIR/systemd/archive-instagram.timer
sudo systemctl start archive-instagram