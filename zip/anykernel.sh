# AnyKernel3 Ramdisk Mod Script
# osm0sis @ xda-developers

## AnyKernel setup
# begin properties
properties() { '
kernel.string=SkyArk Kernel By Reza Adi P
do.devicecheck=1
do.modules=0
do.cleanup=1
do.cleanuponabort=0
device.name1=mido
device.name2=redmi note 4
device.name3=Redmi Note 4
device.name4=Redmi Note 4x
device.name5=
supported.versions=
'; } # end properties

# shell variables
block=/dev/block/bootdevice/by-name/boot;
is_slot_device=0;
ramdisk_compression=auto;


## AnyKernel methods (DO NOT CHANGE)
# import patching functions/variables - see for reference
. tools/ak3-core.sh;


## AnyKernel file attributes
# set permissions/ownership for included ramdisk files
chmod -R 750 $ramdisk/*;
chown -R root:root $ramdisk/*;


## AnyKernel install
dump_boot;

# begin ramdisk changes

# Remove CAF Boost Framework cuz CAF is a hoe
mount -o rw,remount -t auto /vendor >/dev/null;
mount -o rw,remount -t auto /cust >/dev/null;
rm -rf /vendor/etc/perf;
rm -rf /cust/etc/perf;
mount -o ro,remount -t auto /vendor >/dev/null;
mount -o ro,remount -t auto /cust >/dev/null;

# init.rc
insert_line init.rc 'SkyArk' after 'import /init.\${ro.zygote}.rc' 'import /init.SkyArk.rc';

# end ramdisk changes

write_boot;
## end install

