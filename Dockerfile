FROM aptalca/docker-rdp-base

MAINTAINER aptalca

VOLUME ["/config"]

EXPOSE 3389

ADD firstrun.sh /etc/my_init.d/firstrun.sh

RUN export DEBCONF_NONINTERACTIVE_SEEN=true DEBIAN_FRONTEND=noninteractive && \
apt-get install -y libwxgtk2.8-dev && \
chmod +x /etc/my_init.d/firstrun.sh && \
mkdir -p /root/boinc && \
cd /root/boinc && \
wget http://boinc.berkeley.edu/dl/boinc_7.2.42_x86_64-pc-linux-gnu.sh && \
echo lxsession -s LXDE -e LXDE > /root/.xsession
