sudo umount /dev/mmc*
sudo dd if=./output/images/sdcard.img of=/dev/mmcblk0 bs=1M && sync && umount /dev/mmc*
