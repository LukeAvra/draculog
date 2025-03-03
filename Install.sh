#!/bin/bash

# The install script needed to set up your Intel Server to run Draculog

apt-get update

apt-get upgrade

# Clang install
apt-get install clang-11 --install-suggests

# GCC install
apt-get install build-essential manpages-dev

# Python3 install (along with part DHT install)
apt-get install python3-dev
apt-get install python3-pip
apt-get install python3-libgpiod

## Python3 DHT22 Tools
#python3 -m pip install --upgrade pip setuptools wheel testresources gpiozero
#pip3 install adafruit-circuitpython-dht adafruit-circuitpython-lis3dh

# Python PyRAPL Tools and permissions
pip install pyRAPL
pip install pymongo
pip install pandas
pip install psutil
pip install mysql-connector-python

# RAPL Needs this file to have a+r permissions, which isn't enabled by default. The code also checks for this, and will run this command as root if this fails
chmod -R a+r /sys/class/powercap/intel-rapl

# Now that everything is installed, build Config file and Params Sample file (possibly build directories to store everything)
chmod +x Draculog.py

# Draculog instructions to create specific folders and file structures
python3 Draculog.py bp
mkdir Source
python3 Draculog.py bc


