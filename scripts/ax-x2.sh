# Cleanup
rm -rf frameworks/native
#external tools hardware/ device/mediatek  vendor/mediatek hardware/mediatek android packages build prebuilts prebuilt

# ROM Init
#repo init -u https://github.com/ProjectInfinity-X/manifest -b 16 -g default,-mips,-darwin,-notdefault --depth=1 --git-lfs --no-repo-verify
repo init -u https://github.com/AxionAOSP/android.git -b lineage-23.2 --git-lfs
/opt/crave/resync.sh

# Device 
git clone -b ax  https://github.com/zaidannn7/device_infinix_X6882_guts device/infinix/X6882

# Build
source build/envsetup.sh
axion X6882 user pico
ax -br 
