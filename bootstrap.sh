#!/usr/bin/env bash

ANDROID_SDK_FILENAME=android-sdk_r24.4.1-linux.tgz
ANDROID_SDK=http://dl.google.com/android/$ANDROID_SDK_FILENAME

#sudo apt-get install python-software-properties
#sudo add-apt-repository ppa:webupd8team/java
apt-get update
apt-get install -y nodejs npm git openjdk-7-jdk ant expect

sudo ln -s /usr/bin/nodejs /usr/bin/node

curl -O $ANDROID_SDK
tar -xzvf $ANDROID_SDK_FILENAME
sudo chown -R vagrant android-sdk-linux/

echo "ANDROID_HOME=~/android-sdk-linux" >> /home/vagrant/.bashrc
echo "export JAVA_HOME=/usr/lib/jvm/java-7-openjdk-i386" >> /home/vagrant/.bashrc
echo "PATH=\$PATH:~/android-sdk-linux/tools:~/android-sdk-linux/platform-tools" >> /home/vagrant/.bashrc

sudo npm install -g cordova ionic gulp bower
# the following are missed dependencies
sudo npm install -g bplist-parser xmlbuilder
sudo chown -R vagrant /usr/local/lib/node_modules
# allow to uninstall/reinstall ionic w/o root
sudo chown -R vagrant /usr/local/bin/ionic

#add gradle install here

expect -c '
set timeout -1   ;
spawn /home/vagrant/android-sdk-linux/tools/android update sdk -u --all --filter platform-tool,android-22,build-tools-22.0.1
expect { 
    "Do you accept the license" { exp_send "y\r" ; exp_continue }
    eof
}
'

#sudo gem install sass
