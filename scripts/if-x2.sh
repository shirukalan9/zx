# Cleanup
rm -rf device external tools hardware/ device/mediatek vendor/infinix vendor/mediatek hardware/mediatek android packages prebuilts prebuilt

# DT
BRANCH_DT=staging
BRANCH_VT=stg
DEVICE=X6882

# ROM Init
repo init -u https://github.com/ProjectInfinity-X/manifest -b 16 -g default,-mips,-darwin,-notdefault --depth=1 --git-lfs --no-repo-verify
/opt/crave/resync.sh


#---------------------------------------------------
# Device 
git clone -b ${BRANCH_DT} https://github.com/testingprjct/8dua device/infinix/X6882
git clone --depth=1 -b ${BRANCH_VT} https://github.com/testingprjct/eks8dua vendor/infinix/X6882
git clone --depth=1 https://github.com/zaidannn7/device_infinix_X6882-kernel device/infinix/X6882-kernel
#----------------------------------------------------
# Mediatek Specific
git clone --depth=1 -b sixteen-oem https://github.com/MillenniumOSS/android_vendor_mediatek_ims vendor/mediatek/ims
git clone --depth=1 https://github.com/MillenniumOSS/android_hardware_millennium hardware/millennium
git clone --depth=1 https://github.com/MillenniumOSS/android_device_mediatek_sepolicy_vndr device/mediatek/sepolicy_vndr
git clone --depth=1 https://github.com/MillenniumOSS/android_hardware_mediatek hardware/mediatek
git clone https://github.com/MillenniumOSS/android_device_millennium_common-kernel device/millennium/common-kernel
#-----------------------------------------------------



cd frameworks/base
wget -O- https://github.com/AxionAOSP/android_frameworks_base/commit/c2ce0dc21acb37b0b6e59861ce3198d4d20fc94a.diff | patch -p1 -N
wget -O- https://github.com/LOSModified/android_frameworks_base/commit/ecd369bf53de4ee0b341670bbb11f10e2d9f795f.diff | patch -p1 -N
wget -O- https://github.com/LOSModified/android_frameworks_base/commit/03a8145a350369d1cf1d2cb54c587101e253876c.diff | patch -p1 -N
cd ../..

#cd build/tools
#wget -qO- https://github.com/Evolution-X/build/commit/d2817e9ad6a34ad08325742338f513ee5af2fa89.diff | git apply
#get -qO- https://github.com/Evolution-X/build/commit/a8297166097f37cf2ddfb39cf0a84b289bd0a33e.diff | git apply
#cd ../..

cd bionic
#wget -qO- https://github.com/Lunaris-AOSP/bionic/commit/8b5c560e37449ea31b5dace03169d9c66ca2c597.diff | git apply
#wget -qO- https://github.com/Lunaris-AOSP/bionic/commit/942b66163dff9677c179a5497dda4ad59413bdab.diff | git apply
#wget -qO- https://github.com/Lunaris-AOSP/bionic/commit/4d7a152a86f47c32843dd82df6e631309efa36bc.diff | git apply
cd ..

# Build
source build/envsetup.sh
lunch infinity_${DEVICE}-user
m bacon -j$(nproc --all)
