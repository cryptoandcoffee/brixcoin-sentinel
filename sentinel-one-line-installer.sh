#!/bin/bash
#BrixCoin Sentinel Setup
apt-get update ; apt-get -y install python-virtualenv virtualenv ; git clone https://github.com/cryptoandcoffee/brixcoin-sentinel sentinel ; cd sentinel
virtualenv ./venv ; ./venv/bin/pip install -r requirements.txt
(echo "* * * * * cd /root/.brix/sentinel && SENTINEL_DEBUG=1 ./venv/bin/python bin/sentinel.py >> sentinel.log 2>&1") | crontab
/etc/init.d/cron restart
