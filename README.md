# mj_Autoinstall.sh
​

I have created a simple shady script (simple bash commands meant for novice user) which installs 8 packages on UBUNTU 20 instance. Ansible MAVEN,TOMCAT,JENKIN"S,DOcker as of Jan2021. This also make's sure/installs git,JDK 11,dockercompose . THE $PATH is set and everything is cross-compatible(like maven with jenkins w.r.t java etc) and would be finally  up and running after you run it.

This is usually helpfull for people who are very new to linux world. You can freely read the script and check what it does to understand better what happening under the hood.

I encourage you to run the commands given in the script manually and understand it by taking online helpo.Once you have good understanding you can just auto run it later.

If you are in hurry for practicing devop's project, it will save your time else it's just a very simple script.

You can run this script in any UBUNTU 20.04.x instance , for example :  VM running Ubuntu20, Amazon ubuntu 20 AMI image instance  (if you overboard , you can be charged in AWS as this downloads packages from Internet), you can run this on Ubuntu 20 container image, setup vagrant box ubuntu 20 etc and run on these instances.


This is idempotent i.e you can run many times and it will still work, it will hog some bandwidth and utilize Internet Download , so care about online free tier account.


All you need after dling repo ,is just run following command .

On you laptop which has git (lol)(ironically this script install's git too) (else just normal download zip option in upper right corner of right corner), do

git clone git@github.com:knowledgeira/mj_devops.git

cd mj_devops and run following command.


chmod +x mj_Autoinstall.sh     

>>>>>>>>>>>>.This sets the execute bit for all users or you can chmod 700,chmod 777 and run script , please avoid using sudo(you can if u want to) while running scirpt.

source mj_Autoinstall.sh



In the end you can skip or try : mvn --version , and run following if you dont get op .

source /etc/profile.d/mjenv.sh



TOMCAT and MAVEN will be installed in /opt/respective-dir

JAVA,MAVEN env variables are set but later if you need you can run following command for it.

source /etc/profile.d/mjenv.sh

