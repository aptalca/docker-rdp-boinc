#!/bin/bash

# Set the correct local time
echo $TZ > /etc/timezone
export DEBCONF_NONINTERACTIVE_SEEN=true DEBIAN_FRONTEND=noninteractive
dpkg-reconfigure tzdata

# Install boinc client and manager
cp /root/boinc/boinc_7.2.42_x86_64-pc-linux-gnu.sh /config/boinc_7.2.42_x86_64-pc-linux-gnu.sh
chmod +x /config/boinc_7.2.42_x86_64-pc-linux-gnu.sh
cd /config
./boinc_7.2.42_x86_64-pc-linux-gnu.sh
chmod -R +rw /config/BOINC

# Set root password for RDP
echo -e "boinc\nboinc" | passwd root

service xrdp restart
/config/BOINC/run_client --daemon
