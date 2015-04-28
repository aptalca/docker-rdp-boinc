FROM phusion/baseimage:0.9.11

MAINTAINER aptalca

VOLUME ["/config"]

EXPOSE 3389

RUN echo $TZ > /etc/timezone && \
export DEBCONF_NONINTERACTIVE_SEEN=true DEBIAN_FRONTEND=noninteractive && \
dpkg-reconfigure tzdata && \
apt-get update && \
apt-get install -y \
wget \
lxde \
xrdp

ADD boinc-client /etc/default/boinc-client
ADD firstrun.sh /etc/my_init.d/firstrun.sh

RUN chmod +x /etc/default/boinc-client && \
chmod +x /etc/my_init.d/firstrun.sh && \
apt-get install -q -y -o Dpkg::Options::="--force-confold" boinc-client boinc-manager && \
mkdir -p /root/boinc && \
echo lxsession -s LXDE -e LXDE > /root/boinc/.xsession
