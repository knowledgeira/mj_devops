# mj_Autoinstall.sh
​

I have created a simple shady script (simple bash commands meant for novice user) which installs 8 packages on UBUNTU 20 instance. Ansible MAVEN,TOMCAT,JENKIN"S,DOcker as of Jan2021. This also make's sure/installs git,JDK 11,dockercompose . THE $PATH is set and everything is cross-compatible(like maven with jenkins w.r.t java etc) and would be finally  up and running after you run it.

This is usually helpfull for people who are very new to linux world. You can freely read the script and check what it does to understand better what happening under the hood.

I encourage you to run the commands given in the script manually and understand it by taking online helpo.Once you have good understanding you can just auto run it later.

If you are in hurry for practicing devop's project, it will save your time else it's just a very simple script.

You can run this script in any UBUNTU 20.04.x instance , for example :  VM running Ubuntu20, Amazon ubuntu 20 AMI image instance  (if you overboard , you can be charged in AWS as this downloads packages from Internet), you can run this on Ubuntu 20 container image, setup vagrant box ubuntu 20 etc and run on these instances.


This is idempotent i.e you can run many times and it will still work, it will hog some bandwidth and utilize Internet Download , so care about online free tier account.


All you need after dling repo ,is just run following command .

On you laptop which has git (lol)(ironically this script install's git too) (else just normal download zip option in upper right corner of Git hub), do

git clone git@github.com:knowledgeira/mj_devops.git

cd mj_devops and run following command.


chmod +x mj_Autoinstall.sh  ------------>.This sets the execute bit for all users or you can chmod 700,chmod 777 and run script , please avoid using sudo(you can if u want to) while running scirpt.

source mj_Autoinstall.sh

After running Script: 

In the end you can skip or try : mvn --version , and run following if you dont get op .

source /etc/profile.d/mjenv.sh


TOMCAT and MAVEN will be installed in /opt/respective-dir

JAVA,MAVEN env variables are set but later for anyother user if you need, you can run following command for it.

source /etc/profile.d/mjenv.sh


===================================================================What to expect after running script====================================================



Dont worry about systemctl status of jenkins.You can access Jenkins via curl localhost:8080 or just in browser type 127.x.x.x :8080 where x is anything between (0-254)/localhost.

Tomcat is used if you are using JSP/java container for running java apps. It can be accessed via curl or browser localhost:8081.



************************************************You will get similar op on screen after running script************************************************

===================================================
 Package 1: Checking Java version

java --version

openjdk 11.0.9.1 2020-11-04
OpenJDK Runtime Environment (build 11.0.9.1+1-Ubuntu-0ubuntu1.20.04)
OpenJDK 64-Bit Server VM (build 11.0.9.1+1-Ubuntu-0ubuntu1.20.04, mixed mode, sharing)
===================================================


Package 2: Checking tomcat status
Systemctl status tomcat

     Loaded: loaded (/etc/systemd/system/tomcat.service; enabled; vendor preset: enabled)
     Active: active (running) since Wed 2021-01-06 16:58:56 UTC; 3min 24s ago
   Main PID: 5835 (java)
      Tasks: 30 (limit: 1164)
===================================================


 Package 3: Checking Maven version

mvn --version 

Apache Maven 3.6.3 (cecedd343002696d0abb50b32b541b8a6ba2883f)
Maven home: /opt/maven
Java version: 11.0.9.1, vendor: Ubuntu, runtime: /usr/lib/jvm/java-11-openjdk-amd64
Default locale: en, platform encoding: UTF-8
OS name: "linux", version: "5.4.0-1029-aws", arch: "amd64", family: "unix"
===================================================


 Package 4: Checking Docker Compose and Docker version

docker --version 

Docker version 20.10.2, build 2291f61
docker-compose version 1.27.4, build 40524192
Your root directory for docker files and it's current size.
244K	/var/lib/docker
===================================================


 Package 5: Checking Git Version

Git --version 

git version 2.25.1
===================================================


 Package 6: Checking Jenkin status 

Systemctl status jenkin

     Loaded: loaded (/etc/init.d/jenkins; generated)
     Active: active (exited) since Wed 2021-01-06 17:01:22 UTC; 59s ago
       Docs: man:systemd-sysv-generator(8)
      Tasks: 0 (limit: 1164)
===================================================


 Package 7:Ansible  status 

ansible 2.9.6
Remember perfection is just an illusion





