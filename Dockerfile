FROM aptalca/docker-webrdp-base

MAINTAINER aptalca

VOLUME ["/config"]

EXPOSE 3389 8080

ADD firstrun.sh /etc/my_init.d/firstrun.sh
ADD autostart /nobody/.config/openbox/autostart

RUN export DEBCONF_NONINTERACTIVE_SEEN=true DEBIAN_FRONTEND=noninteractive && \
chmod +x /etc/my_init.d/firstrun.sh && \
chown nobody:users /nobody/.config/openbox/autostart && \
mkdir -p /nobody/boinc && \
cd /nobody/boinc && \
wget http://boinc.berkeley.edu/dl/boinc_7.2.42_x86_64-pc-linux-gnu.sh
