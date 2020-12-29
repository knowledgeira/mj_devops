# mj_devops
​

I have created a simple shady script (no checks,simple bash commands meant for novice user) which installs Latest MAVEN,TOMCAT,JENKIN"S,DOcker as of Jan2021. This also make's sure/installs git,JDK 11,dockercompose is everything is cross-compatible and finally  up and running.

This script install's some basic DEVOPS software on Ubuntu 20.04 LTS. This is usually helpfull for people who are very new to linux world. You can freely read the script and check what it does to understand better what happening behind the hood.

I encourage you to run the commands given in the script manually, validate with online resource's(even I have used the same) of what every command does and once you have good understanding you can just auto run it later.

If you are in hurry for practicing devop's, it will save your time(for amateurs) else it's just a very simple script.

You can run this script in any UBUNTU 20.04.x instance , for example :  VM running Ubuntu20, Amazon ubuntu 20 AMI image instance  (if you overboard , you can be charged in AWS as this downloads packages from Internet), you can run this on Ubuntu 20 container image, setup vagrant box ubuntu 20 etc and run on these instances.


This is idempotent i.e you can run many times and it will still work, it will hog some bandwidth and utilize Internet Dl.


All you need after dling repo ,is just run following command .

On you laptop which has git (lol)(ironically this script install git too) (else just normal download zip option in upper right corner), do

git clone git@github.com:knowledgeira/mj_devops.git
cd mj_devops and run following command.


chmod +x mj_Autoinstall.sh                      >>>>>>>>>>>>.This sets the execute bit for all users or you can chmod 700,chmod 777 and run script , please avoid using sudo while running scirpt.

source mj_Autoinstall.sh



In the end you can skip or try : mvn --version , and run following if you dont get op .

source /etc/profile.d/mjenv.sh



TOMCAT and MAVEN will be installed in /opt/respective-dir

JAVA,MAVEN env variables are set but later if you need you can run following command for it.

source /etc/profile.d/mjenv.sh

