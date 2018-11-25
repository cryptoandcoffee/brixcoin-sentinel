#!/bin/bash

cd ~

sudo apt-get update
sudo apt-get -y install python-virtualenv virtualenv
#sudo locale-gen "en_US.UTF-8"

#export LC_ALL="en_US.UTF-8" && export LC_CTYPE="en_US.UTF-8"
git clone https://github.com/zocteam/sentinel.git zoc_sentinel
cd zoc_sentinel
virtualenv ./venv
./venv/bin/pip install -r requirements.txt

crontab -l > mycron
echo "* * * * * cd $(pwd) && SENTINEL_DEBUG=1 ./venv/bin/python bin/sentinel.py >> zoc_sentinel.log >/dev/null 2>&1" >> mycron
crontab mycron
rm mycron
