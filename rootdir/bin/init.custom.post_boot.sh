#!/vendor/bin/sh

# Enable ZRAM on devices with 2GB RAM
if [ "$(awk '($1 == "MemTotal:") {print $2}' /proc/meminfo)" -lt 2097152 ]; then
    echo "1G" >/sys/block/zram0/disksize
    mkswap /dev/block/zram0
    swapon /dev/block/zram0
fi
