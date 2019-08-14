version=\
(
    "10.1"
)

url=\
(
    "http://libav.org/releases/libav-$version.tar.gz"
)

md5=\
(
    99c123b9ba9c0ff8c6bfd67a635f99ac
)

configure()
{
    $cmd_mkdir build
    ./configure \
        --sysroot="$cfg_dir_toolchain_sysroot" \
        --prefix="$cfg_dir_builds/libav/libav-$version/build/" \
        --cross-prefix="$cfg_target_canonical-" \
        --target-os="linux" \
        --enable-memalign-hack \
        --enable-shared \
        --enable-pic \
        --enable-gpl \
        --arch=$cfg_architecture
}

build()
{
    $cmd_make
}

host_install()
{
    $cmd_make install
    $cmd_cp -r "build/"*        "$cfg_dir_toolchain_sysroot/usr/"
}

target_install()
{
    $cmd_cp -r "build/"*        "$cfg_dir_rootfs/usr/"

}
