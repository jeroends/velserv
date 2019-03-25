# velserv
A TCP to Velbus gateway for Linux

# HowTo
Use GCC to compile the C code for your system

sudo apt-get install gcc

Or

sudo apt-get install build-essential

Use this command line to compile for your system

gcc -o velserv velserv.c -lpthread

Usage: ./velserv -csfvhV] -d DEVICE] -a ADDRESS] -p PORT]
Tip : try to run as root

-s --server act as server only, gateway will be disabled
when in server mode, the address is always 127.0.0.1
-c --client act as client only, server wil be disabled
-d --device INTERFACE device where the Velbus interface is connected to
default device is: /dev/ttyACM0
-a --address HOST IP address or hostname where to connect to as client
default is 127.0.0.1
-p --port port where to connect
default is 3788
-f --foreground do not run in background
-v --verbose verbose operation, repeat for debugging output
1 general debug, 2-3 com to socket debug, 4-6 server socket debug
-h --help print this help and exit
-V --version print version information and exit

An example

To start VelServ and use /dev/ttyACM0 and port 6000, the following command line should be used

sudo ./velserv -d /dev/ttyACM0 -p 6000

VelServ as a Linux Service

When enabled, the velserv.service file starts, stops and restarts VelServ as a service in Linux systems that support SystemD.

The velserv.service file is set to use device /dev/ttyACM0 and port 6000, if you wish a different configuration, please edit the service file, you will find the parameters in a line towards the end that starts ExecStart=/opt/velserv

Move the velserv.service file into /etc/systemd/system/

{You can create a symlink if you wish}

with the compiled velserv application in /opt/velserv/	{Edit the verserv.service file if your ./velserv application is in a different folder}

run the following commands to activate velserv.service

sudo systemctl daemon-reload

sudo systemctl enable velserv.service

reboot to get VelServ to load on boot, or to start the service now :-

sudo systemctl start velserv

you can also use

sudo systemctl restart velserv

sudo systemctl stop velserv

or any user can use

systemctl status velserv

# Link to the Velbus forum where Stuart (MDAR) explains how you can get this to work: 
https://forum.velbus.eu/t/how-to-install-and-run-velserv-a-velbus-tcp-gateway/15422

