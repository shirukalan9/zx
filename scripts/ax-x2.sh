 # Cleanup
#frameworks/native bionic
#external tools hardware/ device/mediatek  vendor/mediatek hardware/mediatek android packages build prebuilts prebuilt
#
#
rm device/xiaomi
#
#
# ---------------------------------------------------------------------------
#
# 
# ROM Init
#repo init -u https://github.com/ProjectInfinity-X/manifest -b 16 -g default,-mips,-darwin,-notdefault --depth=1 --git-lfs --no-repo-verify
repo init -u https://github.com/AxionAOSP/android.git -b lineage-23.2 --git-lfs --depth=1
/opt/crave/resync.sh
repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j$(nproc --all)


# Device 
git clone -b ab  https://github.com/shirukalan9/zvt device/xiaomi/lime

# Build
source build/envsetup.sh
