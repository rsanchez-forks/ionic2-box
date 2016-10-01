This is a fork of a fork (SamClayton/ionic-box) of the original Ionic Box project, aimed at updating package versions and addressing various dependency issues. 
And...
for IONIC2  :)

I addressed issues with the outdated NodeJS packages in the official mainline Ubuntu repos, as well as a few other issues. These were causing npm dependency problems during and after provisioning. Using VirtualBox as the provider, I tested this on Windows and Mac hosts as capable of vagrant up, generating an app with the tutorial template, serving it to the host machine, and packaging an Android build.

This box can be reached at localhost:2222 
Authenticated with u/p vagrant/vangrant.

Current versions:
OS: Ubuntu 16.04 LTS
Cordova CLI: 6.0.0
Gulp version:  CLI version 3.9.1
Gulp local:   Local version 3.9.1
Ionic Version: 2.0-Beta.11
Ionic CLI Version: 2.0-Beta.37
Ionic App Lib Version: 0.7.0
Node Version: 6.7
npm version: 3.10
Java version: 1.8
adb version: 1.0.35

Ionic 2  Box
=============================

Ionic Box is a ready-to-go hybrid development environment for building mobile apps with Ionic, Cordova, and Android. Ionic Box was built to make it easier for developers to build Android versions of their app, and especially for Windows users to get a complete dev environment set up without all the headaches.

For iOS developers, Ionic Box won't do much for you right now unless you are having trouble installing the Android SDK, and Ionic Box cannot be used for iOS development for a variety of legal reasons (however, the `ionic package` command in beta will soon fix that).

### Installation


To install, download and install [Vagrant](https://www.vagrantup.com/downloads.html) for your platform, then download and install [VirtualBox](http://virtualbox.org/).

Once Vagrant and VirtualBox are installed, you can download the latest release of this GitHub repo, and unzip it. `cd` into the unzipped folder and run:

```bash
$ vagrant up
$ vagrant ssh
```

The username for vagrant is `vagrant` and the password is `vagrant`. 

This will download and install the image, and then go through the dependencies and install them one by one. `vagrant ssh` will connect you to the image and give you a bash prompt. Once everything completes, you'll have a working box to build your apps on Android.

### Connected Android Devices

The image also has support for connected USB Android devices. To test whether devices are connected, you can run (from the box):

```bash
$ sudo /home/vagrant/android-sdk-linux/platform-tools/adb devices
```

If that does not work, or shows `????? permissions`, then run:

```bash
sudo /home/vagrant/android-sdk-linux/platform-tools/adb kill-server
sudo /home/vagrant/android-sdk-linux/platform-tools/adb start-server
```

