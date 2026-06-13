# Cleanup
#frameworks/native bionic
#external tools hardware/ device/mediatek  vendor/mediatek hardware/mediatek android packages build prebuilts prebuilt

# ROM Init
#repo init -u https://github.com/ProjectInfinity-X/manifest -b 16 -g default,-mips,-darwin,-notdefault --depth=1 --git-lfs --no-repo-verify
repo init -u https://github.com/AxionAOSP/android.git -b lineage-23.2 --git-lfs --depth=1
/opt/crave/resync.sh
repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j$(nproc --all)


# Device 
rm -rf device/infinix
git clone -b ab  https://github.com/shirukalan9/zvt device/infinix/X6882

rm -rf frameworks/native
git clone --depth=1 --no-repo-verify -b ax https://github.com/shirukalan9/frameworks_native/ frameworks/native
# Build
source build/envsetup.sh
axion X6882 user pico
ax -br 
