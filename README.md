# mj_devops
​

I have created a simple shady script which installs Latest MAVEN,TOMCAT,JENKIN"S,DOcker as of Jan2021. This also make's sure/installs git,JDK 11,dockercompose is everything is compatible and up and running.

This script install's some basic DEVOPS software on Ubuntu 20.04 LTS. This is usually helpfull for people who are very new to linux world. You can freely read the script and check what it does.

I encourage you to run the commands given in the script manually, validate with online resource of what every command does and once you have good understanding you can just auto run it later.

If you are in hurry for practicing devop's, it will save your time(for amateurs) else it just very simple script.

This is made to save time w.r.t diff dependencies of software w.r.t each other, and hope it's helpful.

You can run this script in any VM running Ubuntu20, Amazon ubuntu 20 AMI image instance  (if you overboard , you can be charged in AWS as this download packages from Internet), you can run this on Ubuntu 20 container image, setup vagrant box ubuntu 20 etc and run on these instances.


This is idempotent i.e you can run many times and it will still work, just will take some bandwidth.


All you need to do is just run following command once you download this file 

chmod +x mj_Autoinstall.sh                      >>>>>>>>>>>>.This sets the execute bit for all users or you can chmod 700,chmod 777 and run script , please avoid using sudo while running scirpt.

source mj_Autoinstall.sh



In the end you can skip or try : mvn --version , and run following if you dont get op .

source /etc/profile.d/mjenv.sh



TOMCAT and MAVEN will be installed in /opt/respective-dir

JAVA,MAVEN env variables are set but later if you need you can run following command for it.

source /etc/profile.d/mjenv.sh

