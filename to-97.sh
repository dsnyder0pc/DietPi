#!/bin/bash
################################################################################
#
#  to-97.sh
#
#  There are audio quality problems with the 4.19.118-v7+ #1311 SMP kernel
#  that ships with DietPi v6.30.0. This script downgrades the kernel to
#  4.19.97-v7+, which sounds great.
#
#  Details in https://github.com/MichaIng/DietPi/issues/3608
#
################################################################################

target="4.19.97-v7+"
build="1.20200212-1"
arch=armhf
repo="https://archive.raspberrypi.org/debian/pool/main/r/raspberrypi-firmware"
pkgs="
  raspberrypi-kernel
  raspberrypi-kernel-headers
  raspberrypi-bootloader
  libraspberrypi0
"
. /boot/dietpi/.version
if [ "${G_DIETPI_VERSION_CORE}" != 6 ] ||
   [ "${G_DIETPI_VERSION_SUB}"  != 30 ]; then
  echo "This scrit has only been tested on DietPi v6.30"
  echo "You are running v${G_DIETPI_VERSION_CORE}.${G_DIETPI_VERSION_SUB}"
  exit 1
fi

if [ "$(uname -r)" == "${target}" ]; then
  echo "Already running Linux ${target}"
  exit 0
else
  echo "Updating Linux to ${target}"
fi

rm -rf kernel.$$
mkdir -v kernel.$$ && cd kernel.$$ || exit 1
for pkg in $pkgs; do
  curl -LO "${repo}/${pkg}_${build}_${arch}.deb" || exit 1
done
dpkg -i ./*.deb
cd - && rm -rv kernel.$$
