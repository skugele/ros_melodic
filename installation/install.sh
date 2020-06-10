#!/bin/bash -xv

# ROS (Melodic) Installation
#
# Note: The operations below are not idempotent. Only
# run on a system that has never had a ROS installation,
# unless previous installation(s) has been carefully uninstalled.

# Setup your computer to accept software from packages.ros.org
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'

# Setup repository keys
sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654 

# Update package manager
sudo apt update

# ROS desktop installation
sudo apt install ros-melodic-desktop-full

# Configure bash to run ROS environment setup on shell launch
echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc
source ~/.bashrc

# Install essential ROS tools
sudo apt install python-rosdep python-rosinstall python-rosinstall-generator python-wstool build-essential

# Install, initialize, and update rosdep
sudo apt install python-rosdep
sudo rosdep init
rosdep update
