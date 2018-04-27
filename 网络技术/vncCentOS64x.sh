#!/bin/bash
yum -y update
yum -y groupinstall Desktop
yum -y install tigervnc-server
yum -y install firefox
wget https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/cnvagex/install_flash_player_11_linux.x86_64.tar.gz
tar zxvf install_flash_player_11_linux.x86_64.tar.gz
mkdir -p ~/.mozilla/plugins/
cp libflashplayer.so ~/.mozilla/plugins/
vncserver
echo 'VNCSERVERS="1:root"' >> /etc/sysconfig/vncservers
echo 'VNCSERVERARGS[1]="-geometry 1024x768"' >> /etc/sysconfig/vncservers
service vncserver restart
chkconfig vncserver on