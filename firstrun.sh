#!/bin/bash

# Install boinc client and manager
cp /nobody/boinc/boinc_7.2.42_x86_64-pc-linux-gnu.sh /config/boinc_7.2.42_x86_64-pc-linux-gnu.sh
chmod +x /config/boinc_7.2.42_x86_64-pc-linux-gnu.sh
chown -R nobody:users /config
apt-get update && apt-get install -y libxss1
su -c "cd /config && ./boinc_7.2.42_x86_64-pc-linux-gnu.sh" -s /bin/sh nobody
su -c "/config/BOINC/run_client --daemon" -s /bin/sh nobody
