repo init --depth 1 -u https://github.com/LineageOS/android.git -b lineage-20.0 --git-lfs

crave run --clean --no-patch -- "rm -rf .repo/local_manifests && \

git clone https://github.com/belowzeroiq/local_manifest .repo/local_manifests && \

repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j8 && \

git clone -b wip/round-corner-experimentations https://github.com/alternoegraha/device_xiaomi_fog device/xiaomi/fog && \

git clone https://github.com/LineageOS/android_hardware_xiaomi hardware/xiaomi && \

source build/envsetup.sh && \

lunch lineage_fog-userdebug && \

mka bacon”

crave pull out/target/product/*/*.zip