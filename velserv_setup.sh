sudo mkdir /opt/velserv
cd /opt/velserv
sudo wget http://www.mdar.co.uk/dl/velserv1.5.zip
sudo apt-get install gcc unzip build-essential
sudo unzip velserv1.5.zip
sudo gcc -o velserv velserv.c -lpthread
sudo ln -s /opt/velserv/velserv.service /etc/systemd/system/velserv.service
sudo systemctl daemon-reload
sudo systemctl enable velserv.service
sudo systemctl start velserv.service
systemctl status velserv