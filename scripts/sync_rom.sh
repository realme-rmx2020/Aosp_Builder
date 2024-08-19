#!/bin/bash

cd ~;
mkdir $ROM_NAME;
cd $ROM_NAME;
git config --global user.name "$USERNAME";
git config --global user.email "$USERMAIL";

# Initialize RED source
repo init --depth=1 --no-repo-verify -u $ROM_REPO -b $ROM_BRANCH -g default,-mips,-darwin,-notdefault;

# Sync RED source
repo sync -c -j$(nproc --all) --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync;

# Clone GREEN source
git clone $DEVICE_REPO --depth=1 -b $DEVICE_BRANCH "device/$OEM/$CODENAME";
git clone --depth=1 https://github.com/PixelOS-Devices/vendor_realme_RMX2020 -b fourteen vendor/realme/RMX2020
git clone --depth=1 https://github.com/PixelOS-Devices/vendor_realme_RMX2020-ims -b fourteen vendor/realme/RMX2020-ims
git clone --depth=1 https://github.com/PixelOS-Devices/kernel_realme_RMX2020 -b fourteen kernel/realme/RMX2020
git clone --depth=1 https://github.com/lineageOS/android_hardware_mediatek -b lineage-21 hardware/mediatek
git clone --depth=1 https://github.com/Rinto02/android_device_mediatek_sepolicy_vndr -b 14.0 device/mediatek/sepolicy_vndr

exit 0;
