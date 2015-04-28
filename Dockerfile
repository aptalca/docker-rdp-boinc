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


ADD firstrun.sh /etc/my_init.d/firstrun.sh

RUN chmod +x /etc/my_init.d/firstrun.sh && \
mkdir -p /root/boinc && \
cd /root/boinc && \
wget boinc_7.2.42_x86_64-pc-linux-gnu.sh && \
echo lxsession -s LXDE -e LXDE > /root/.xsession
