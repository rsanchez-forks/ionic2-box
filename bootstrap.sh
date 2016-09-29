#!/usr/bin/env bash

ANDROID_SDK_FILENAME=android-sdk_r24.4.1-linux.tgz
ANDROID_SDK=http://dl.google.com/android/$ANDROID_SDK_FILENAME

curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -
sudo apt-get update
# update from Ubuntu 10.04.3 to 10.04.4 or newer LTS releases
sudo apt-get -y dist-upgrade
sudo apt-get install -y git openjdk-7-jdk ant expect nodejs
# install 32-bit dependencies of Android build-tools
sudo apt-get install -y lib32gcc1 libc6-i386 lib32z1 lib32stdc++6 lib32ncurses5 lib32gomp1 lib32z1-dev
sudo ln -s /usr/bin/nodejs /usr/bin/node

curl -O $ANDROID_SDK
tar -xzvf $ANDROID_SDK_FILENAME
sudo chown -R vagrant android-sdk-linux/

echo "ANDROID_HOME=~/android-sdk-linux" >> /home/vagrant/.bashrc
echo "export JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64" >> /home/vagrant/.bashrc
echo "PATH=\$PATH:~/android-sdk-linux/tools:~/android-sdk-linux/platform-tools" >> /home/vagrant/.bashrc

sudo npm install -g cordova ionic@beta gulp bower typings
# add gradle 2.2.1?

sudo chown -R vagrant /usr/local/lib/node_modules
# allow to uninstall/reinstall ionic w/o root
sudo chown -R vagrant /usr/local/bin/ionic

#add gradle install here

sudo apt-get autoremove

expect -c '
set timeout -1   ;
spawn /home/vagrant/android-sdk-linux/tools/android update sdk -u --all --filter platform-tool,android-22,android-23,build-tools-22.0.1
expect { 
    "Do you accept the license" { exp_send "y\r" ; exp_continue }
    eof
}
'

#sudo gem install sass
