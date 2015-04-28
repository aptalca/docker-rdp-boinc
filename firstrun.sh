#!/bin/bash

if [ ! -d /config/config ]; then
    mkdir -p /config/config
    cp /etc/boinc-client/* /config/config/
    chmod -R a+rw /config/config
fi

if [ ! -d /config/data ]; then
    mkdir -p /config/data
    cp /var/lib/boinc-client/* /config/data/
    chmod -R a+rw /config/data
fi

echo -e "boinc\nboinc" | passwd boinc
rm -r /etc/boinc-client
ln -s /config/config /etc/boinc-client
rm -r /var/lib/boinc-client
ln -s /config/data /var/lib/boinc-client
service xrdp restart
service boinc-client restart
