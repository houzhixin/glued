version=\
(
    '1.0.0'
)

url=\
(
    "http://www.lsts.pt/glued/emm-8p-xt-eeprom-$version.tar.gz"
)

md5=\
(
    '6a71321ad9ea385c9a7c9b53d930d09d'
)

if [ -d "$cfg_dir_builds/linux/linux-"* ]; then
    kernel="$(echo $cfg_dir_builds/linux/linux-*)"
fi

build()
{
    $cmd_make CC=$cmd_target_cc
}

target_install()
{
    for f in emm-8p-xt-eeprom-lauv; do
        $cmd_target_strip "$f" -o "$cfg_dir_rootfs/usr/bin/$f"
    done
}
