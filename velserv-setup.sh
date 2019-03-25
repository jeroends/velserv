mkdir /opt/velserv
cd /opt/velserv
wget http://www.mdar.co.uk/dl/velserv1.5.zip
apt install gcc unzip
unzip velserv1.5.zip
ln -s /opt/velserv/velserv.service /etc/systemd/system/velserv.service

gcc -o velserv velserv.c -lpthread

systemctl daemon-reload
systemctl enable velsev.service
systemctl start velserv.service
systemctl status velserv

exit 0
