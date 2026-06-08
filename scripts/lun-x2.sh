# Cleanup
rm -rf device/infinix
#frameworks/native
#ardware/mediatek device/mediatek  vendor/mediatek build/tools

#error: Unable to fully sync the tree
#error: Checking out local projects failed.
#Failing repos (checkout):
#prebuilts/clang/host/linux-x86
#rm -rf prebuilts/clang/host/linux-x86


# ROM Init
repo init -u https://github.com/Lunaris-AOSP/android -b 16.2 --depth=1 --git-lfs --no-repo-verify
#repo init -u https://github.com/AxionAOSP/android.git -b lineage-23.2 --git-lfs

/opt/crave/resync.sh
#from : https://github.com/sreepadmarat/buildscripts/blob/main/build.sh
# user: https://foss.crave.io/app/#/build/info/278748?team=14
repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j$(nproc --all)


# Device 
git clone -b lunar https://github.com/zaidannn7/device_infinix_X6882_guts device/infinix/X6882

# Build
. build/envsetup.sh


lunch lineage_X6882-bp4a-user
m bacon
