rm -rf .repo/local_manifests

# Do repo init for rom that we want to build.
repo init -u https://github.com/ProjectMatrixx/android.git -b 14.0 --git-lfs --depth=1 --no-repo-verify -g default,-mips,-darwin,-notdefault

# Do remove here before repo sync.
rm -rf hardware
rm -rf vendor
rm -rf system
rm -rf kernel
rm -rf device
rm -rf packages
rm -rf prebuilts/clang/host/linux-x86
rm -rf out/host

 git clone https://github.com/belowzeroiq/local_manifest --depth 1 -b fourteen/fog .repo/local_manifests && 
 
if [ ! 0 == 0 ]
 then   curl -o .repo/local_manifests https://github.com/belowzeroiq/local_manifest
 fi 

repo sync -c -j$(nproc --all) --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync  && 

export BUILD_USERNAME=Jackie 
export BUILD_HOSTNAME=crave 
export KBUILD_BUILD_USER=belowzeroiq 
export KBUILD_BUILD_HOST= 
 
source build/envsetup.sh && 

lunch lineage_fog-userdebug && make installclean && m bacon
