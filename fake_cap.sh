#!/bin/bash

clear
echo           ---------------------------------
echo             Fake Capacity Drive Generator
echo           ---------------------------------
echo              Warning! This script may be
echo             dangerous for your filesystem,
echo                use at your own risk !
echo                    @AtexBg, 2025
echo           ---------------------------------
echo.

echo  --------- LSBLK Output ----------
lsblk
echo  ---------------------------------
echo.

echo /!\\ BE SURE TO SELECT THE RIGHT DEVICE TO PATCH
echo OTHERWISE YOU WILL EXPERIENCE DATA LOSS /!\\
echo.

read -p "Enter device name to patch (eg. sda1): " DEVICE

echo Creating virtual FS...
mkdosfs -C /tmp/2tb_temp 2147483644 #create 2TB virtual filesystem, will take ~524MB on real disk space

echo Patching selected filesystem, may take a while...
echo "head -c 524292K /tmp/2tb_temp > /dev/$DEVICE" | sudo sh

echo Done, the drive at /dev/$DEVICE will now show "1.99TB" on a Windows OS!

echo Cleaning files...
rm -f /tmp/2tb_temp
sudo umount /dev/$DEVICE
