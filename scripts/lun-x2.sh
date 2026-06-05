# Cleanup
rm -rf external frameworks/native
#ardware/mediatek device/mediatek  vendor/mediatek build/tools

# ROM Init
repo init -u https://github.com/Lunaris-AOSP/android -b 16.2 --depth=1 --git-lfs --no-repo-verify
#repo init -u https://github.com/AxionAOSP/android.git -b lineage-23.2 --git-lfs
/opt/crave/resync.sh

# Device 
git clone -b lunar https://github.com/zaidannn7/device_infinix_X6882_guts device/infinix/X6882

# Build
. build/envsetup.sh


lunch lineage_X6882-bp4a-user
m bacon
