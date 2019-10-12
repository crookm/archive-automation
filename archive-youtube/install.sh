DIR=$(dirname $(readlink -f "$0"))

sudo pip install --upgrade youtube-dl

sudo systemctl link $DIR/systemd/archive-youtube.service

sudo systemctl enable $DIR/systemd/archive-youtube.timer
sudo systemctl start archive-youtube