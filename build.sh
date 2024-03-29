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

# Clone our local manifest.
git clone https://github.com/belowzeroiq/local_manifest --depth 1 -b fourteen/fog .repo/local_manifests

# Let's sync!
repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags --optimized-fetch --prune
    
# Define timezone
export TZ=Asia/Jakarta

# Let's start build!
. build/envsetup.sh
lunch lineage_fog-userdebug
m bacon
