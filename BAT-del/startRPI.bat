:: startRPI.bat
:: Michael McMahon
:: qemu script to start a RPI emulation on Windows.

qemu-system-arm.exe -kernel kernel-qemu -cpu arm1176 -m 256 -M versatilepb -no-reboot -serial stdio -append "root=/dev/sda2 panic=1 rootfstype=ext4 rw" -hda 2015-05-05-raspbian-wheezy.img
