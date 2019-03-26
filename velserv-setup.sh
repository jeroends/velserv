echo Make a new directory for velserv "/opt/velserv"
mkdir /opt/velserv
cd /opt/velserv
echo Download the zip file
wget http://www.mdar.co.uk/dl/velserv1.5.zip
echo check that gcc and unzip are installed
apt install gcc unzip
echo unzip the files
unzip velserv1.5.zip
echo Copy the service file
cp /opt/velserv/velserv.service /etc/systemd/system/velserv.service
echo get new version of velser.c
wget  https://raw.githubusercontent.com/jeroends/velserv/master/velserv.c -O /opt/velserv/velserv.c
echo Create Velserv application
gcc -o velserv velserv.c -lpthread
echo reload Systemctl files
systemctl daemon-reload
echo enable Velserv at boot up
systemctl enable velserv.service
echo Start Velserv now on port 6000
systemctl start velserv.service
echo what is Velserv doing right now?
echo press q to exit
systemctl status velserv

exit 0

