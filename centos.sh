#! /bin/bash

echo 'export PATH=/usr/sbin:$PATH' > /etc/profile.d/sbin.sh

. /etc/profile.d/sbin.sh

wget --no-check-certificate -c https://packages.erlang-solutions.com/erlang-solutions-1.0-1.noarch.rpm
wget -c http://www.rabbitmq.com/releases/rabbitmq-server/v3.2.4/rabbitmq-server-3.2.4-1.noarch.rpm
rpm --import http://www.rabbitmq.com/rabbitmq-signing-key-public.asc
rpm -Uvh http://mirror.centos.org/centos/5/os/x86_64/CentOS/unixODBC-libs-2.2.11-10.el5.x86_64.rpm
rpm -Uvh ftp://ftp.pbone.net/mirror/ftp5.gwdg.de/pub/opensuse/repositories/home:/aevseev/CentOS_CentOS-5/x86_64/erlang-R16B-19.1.x86_64.rpm
yum install -y rabbitmq-server-3.2.4-1.noarch.rpm

echo "deadbeefcafecoffeebabefeed" > /var/lib/rabbitmq/.erlang.cookie
chown rabbitmq:rabbitmq /var/lib/rabbitmq/.erlang.cookie
chmod 600 /var/lib/rabbitmq/.erlang.cookie

cat >> /etc/hosts <<HOSTS
192.168.56.201 rabbit1
192.168.56.202 rabbit2
HOSTS

rabbitmq-plugins enable rabbitmq_management

/etc/init.d/rabbitmq-server start

if [[ $HOSTNAME == "rabbit2" ]]; then
  rabbitmqctl stop_app
  rabbitmqctl join_cluster rabbit@rabbit1
  rabbitmqctl start_app
fi
