#!/bin/bash

cp /root/boinc/boinc_7.2.42_x86_64-pc-linux-gnu.sh /config/boinc_7.2.42_x86_64-pc-linux-gnu.sh
chmod +x /config/boinc_7.2.42_x86_64-pc-linux-gnu.sh
cd /config
./boinc_7.2.42_x86_64-pc-linux-gnu.sh
echo -e "boinc\nboinc" | passwd root
service xrdp restart
