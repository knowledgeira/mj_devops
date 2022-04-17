#!/bin/bash


#Author : Manoj Jagdale

#Email : knowledgeira@gmail.com

sudo apt-get update
sudo apt-get install curl -y
#echo "Installing  JDK 11 as currently Jenkin requires it specifically and cannot run on Java 15 which is latest"

#sudo curl -L -C - -b "oraclelicense=accept-securebackup-cookie" -O https://download.oracle.com/otn-pub/java/jdk/15.0.1%2B9/51f4f36ad4ef43e39d0dfdbaf6549e32/jdk-15.0.1_linux-x64_bin.tar.gz

#sudo tar -xvf jdk-15.0.1_linux-x64_bin.tar.gz --directory /opt/
#export JAVA_HOME=/opt/jdk-15.0.1     >>>>>>>>>Currently all ignored coz jenkin requires specific jdk11
sudo apt install openjdk-11-jdk -y

sudo chmod 777 /etc/profile.d/mjenv.sh 
> /etc/profile.d/mjenv.sh 


sudo tee -a /etc/profile.d/mjenv.sh > /dev/null <<EOL

export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64
export PATH=\$JAVA_HOME/bin:\$PATH
export M2_HOME=/opt/maven
export MAVEN_HOME=/opt/maven
export PATH=\$M2_HOME/bin:\$PATH
EOL

#sudo update-alternatives --install "/usr/bin/java" "java" "/opt/jdk-15.0.1/bin/java" 1

#sudo update-alternatives --set java /opt/jdk-15.0.1/bin/java


echo "================== END OF installing JDK================================="

VERSION=9.0.41


echo "Downloading tomcat ver:9.0.41 and installing it."


sudo useradd -m -U -d /opt/tomcat -s /bin/false tomcat
wget https://www-eu.apache.org/dist/tomcat/tomcat-9/v${VERSION}/bin/apache-tomcat-${VERSION}.tar.gz -P /tmp

sudo tar -xf /tmp/apache-tomcat-${VERSION}.tar.gz -C /opt/tomcat/
sudo ln -s /opt/tomcat/apache-tomcat-${VERSION} /opt/tomcat/latest
sudo chown -R tomcat: /opt/tomcat
sudo sh -c 'chmod +x /opt/tomcat/latest/bin/*.sh'



sudo touch /etc/systemd/system/tomcat.service

sudo chmod 777 /etc/systemd/system/tomcat.service 
> /etc/systemd/system/tomcat.service 

sudo /etc/systemd/system/tomcat.service> /dev/null
sudo tee -a  /etc/systemd/system/tomcat.service> /dev/null <<EOF
[Unit]
Description=Tomcat 9 servlet container
After=network.target

[Service]
Type=forking

User=tomcat
Group=tomcat

Environment="JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64"
Environment="JAVA_OPTS=-Djava.security.egd=file:///dev/urandom -Djava.awt.headless=true"

Environment="CATALINA_BASE=/opt/tomcat/latest"
Environment="CATALINA_HOME=/opt/tomcat/latest"
Environment="CATALINA_PID=/opt/tomcat/latest/temp/tomcat.pid"
Environment="CATALINA_OPTS=-Xms512M -Xmx1024M -server -XX:+UseParallelGC"

ExecStart=/opt/tomcat/latest/bin/startup.sh
ExecStop=/opt/tomcat/latest/bin/shutdown.sh

[Install]
WantedBy=multi-user.target
EOF

sudo sed -i "s/8080/8081/g" /opt/tomcat/apache-tomcat-9.0.41/conf/server.xml

sudo systemctl daemon-reload
sudo systemctl enable --now tomcat


echo "================== END OF installing TOMCAT================================="



sudo curl https://mirrors.estointernet.in/apache/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.tar.gz -o apache-maven-3.6.3-bin.tar.gz

sudo tar -xvf apache-maven-3.6.3-bin.tar.gz -C /opt/
	
sudo ln -s /opt/apache-maven-3.6.3 /opt/maven

#https://maven.apache.org/guides/getting-started/maven-in-five-minutes.html
#Java 9 or later
#By default your version of Maven might use an old version of the maven-compiler-plugin that is not compatible with Java 9 or later versions. To target Java 9 or later, you should at least use version 3.6.0 of the maven-compiler-plugin and set the maven.compiler.release property to the Java release you are targetting (e.g. 9, 10, 11, 12, etc.).

#In the following example, we have configured our Maven project to use version 3.8.1 of maven-compiler-plugin and target Java 11:

 #   <properties>
 #       <maven.compiler.release>11</maven.compiler.release>
 #   </properties>
 
 #    <build>
 #       <pluginManagement>
 #           <plugins>
 #               <plugin>
 #                   <groupId>org.apache.maven.plugins</groupId>
 #                   <artifactId>maven-compiler-plugin</artifactId>
 #                   <version>3.8.1</version>
 #               </plugin>
 #           </plugins>
 #       </pluginManagement>
 #   </build>

echo "================== END OF installing MAven================================="

sudo apt update
 
sudo apt install apt-transport-https ca-certificates curl software-properties-common -y
 

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
 

sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
 

sudo apt update
 

apt-cache policy docker-ce
 


sudo apt install docker-ce -y
sudo usermod -aG docker $(whoami)

sudo curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose


sudo chmod +x /usr/local/bin/docker-compose

sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose


echo "================== END OF installing Docker================================="

apt-get install git -y

echo "================== END OF installing Git================================="


wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -

sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'

sudo apt-get update -y
sudo apt-get install jenkins -y
sudo systemctl enable --now jenkins

sudo systemctl start jenkins

#sudo systemctl status jenkins


sudo apt install ansible -y

tput reset

echo "Checking if everything is installed and running fine"
echo "==================================================="

echo -e " Package 1: Checking Java version\n"
echo -e "java --version\n"
java --version


echo -e "===================================================\n\n"

echo "Package 2: Checking tomcat status"
echo -e "Systemctl status tomcat\n"

systemctl status tomcat | grep active -A 2 -B 1
echo -e "===================================================\n\n"


echo -e " Package 3: Checking Maven version\n"
source /etc/profile.d/mjenv.sh


echo -e "mvn --version \n"
mvn --version

echo -e "===================================================\n\n"


echo -e " Package 4: Checking Docker Compose and Docker version\n"
echo -e "docker --version \n"

docker --version

docker-compose --version


echo "Your root directory for docker files and it's current size."


docker info 2>/dev/null | grep -i root
sudo du -sh /var/lib/docker

echo -e "===================================================\n\n"

echo -e " Package 5: Checking Git Version\n"

echo -e "Git --version \n"

git --version

echo -e "===================================================\n\n"


echo -e " Package 6: Checking Jenkin status \n"

echo -e "Systemctl status jenkin\n"

systemctl status jenkins | grep active -A 2 -B 1


echo -e "===================================================\n\n"

echo -e " Package 7:Ansible  status \n"


ansible --version | head -n 1


echo -e "\n\n Remember perfection is just an illusion"



:'


On your server
sudo apt-get update
sudo apt-get install openjdk-8-jdk
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt-get update
sudo apt-get install jenkins
sudo apt install git

service jenkins status


ssh-keygen -t rsa -b 4096 -C knowledgeira@gmail.com ---->Press Enter for every question
eval 'ssh-agent -s'
ssh-add ~/.ssh/id_rsa
copy your public key on localmachine -->id_rsa.pub contents to github ssh 
'



