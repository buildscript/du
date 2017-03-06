#!/bin/bash
 
cd ~/du
 
# Turn off break on error to allow build process to run
set +e

# Turn on compiler caching
export USE_CCACHE=1

# Set the OFFICIAL build flag
export DU_BUILD_TYPE=OFFICIAL

# Set the prebuilt chromium flag
export USE_PREBUILT_CHROMIUM=1
 
############################################################
# BUILD i9300                                              #
############################################################
 
# Start build process
cd ~/du && . build/envsetup.sh && time brunch i9300
 
############################################################
# COPY ROM TO HDD				           #
############################################################
 
set -e

echo "Do you want to upload it to HDD?"

read -p "(y/n)" -n 1
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    cp ~/du/out/target/product/i9300/DU_i93*.zip /media/gijs/WDD/DU/i9300
    cp ~/du/out/target/product/i9300/DU_i93*.zip.md5sum /media/gijs/WDD/DU/i9300   
fi
 
# Notify user of success 
beep -f 784 -r 3 -l 100
sleep .1
beep -f 784 -l 600
beep -f 622 -l 600
beep -f 698 -l 600
beep -f 784 -l 200
sleep .2
beep -f 698 -l 200
beep -f 784 -l 800

echo 'i9300 completed successfully!'

############################################################
# BUILD i9100                                              #
############################################################
 
# Start build process
cd ~/du && . build/envsetup.sh && time brunch i9100
 
############################################################
# COPY ROM TO HDD				           #
############################################################
 
set -e

echo "Do you want to upload it to HDD?"

read -p "(y/n)" -n 1
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    cp ~/du/out/target/product/i9100/DU_i91*.zip /media/gijs/WDD/DU/i9100
    cp ~/du/out/target/product/i9100/DU_i91*.zip.md5sum /media/gijs/WDD/DU/i9100   
fi
 
# Notify user of success 
beep -f 784 -r 3 -l 100
sleep .1
beep -f 784 -l 600
beep -f 622 -l 600
beep -f 698 -l 600
beep -f 784 -l 200
sleep .2
beep -f 698 -l 200
beep -f 784 -l 800

echo 'i9100 completed successfully!'

############################################################
# CLOBBER                			           #
############################################################

echo "Do you want to clobber $OUT?"

read -p "(y/n)" -n 1
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    . ~/du/clobber.sh    
fi
