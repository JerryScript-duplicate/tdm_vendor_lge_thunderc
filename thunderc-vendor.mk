KERNEL_MODULES_DIR := /system/lib/modules
TINY_TOOLBOX := true
WITH_WINDOWS_MEDIA := true
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.dexopt-data-only=1 \

#PRODUCT_PACKAGES += \
#    libmm-omxcore \
#    libOmxCore \
#    libjni_latinime \
#    librs_jni \
#    libgps \
#    libloc \
#    libcommondefs \
#    libloc-rpc \
#    brcm_patchram_plus \
#    libaudio.thunderc \
#    copybit.thunderc \
#    gralloc.thunderc \
#    gps.thunderc \

PRODUCT_PACKAGES += \
    libmm-omxcore \
    libOmxCore \
    libjni_latinime \
    librs_jni \
    brcm_patchram_plus \
    libaudio.thunderc \
    copybit.thunderc \
    gralloc.thunderc \
    sensors.thunderc \
    lights.thunderc \
    gps.thunderc \
    bash \
    nano \
    e2fsck \
    flash_image \
    erase_image \
    dump_image \
    thunder_keypad.kcm.bin \
    bdaddr_read

PRODUCT_PACKAGES += \
    Provision \
    GoogleSearch \
    hcitool \
    QuickSearchBox \
    FileManager \
    com.android.future.usb.accessory

PRODUCT_COPY_FILES += \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/system/etc/apns-conf.xml:system/etc/apns-conf.xml \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/system/etc/gps.conf:system/etc/gps.conf \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/system/etc/permissions/android.hardware.microphone.xml:system/etc/permissions/android.hardware.microphone.xml \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/system/etc/01_qcomm_omx.cfg:system/etc/01_qcomm_omx.cfg \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/system/etc/MELFAS_FIRM.bin:system/etc/MELFAS_FIRM.bin \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/system/etc/wiperconfig.xml:system/etc/wiperconfig.xml \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/system/etc/loc_parameter.ini:system/etc/loc_parameter.ini \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/init.rc:root/init.rc \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/ueventd.rc:root/ueventd.rc \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/system/etc/media_profiles.xml:system/etc/media_profiles.xml \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/system/etc/tweaks.sh:system/etc/tweaks.sh \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/system/etc/setwifi.sh:system/etc/setwifi.sh\
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/system/etc/init.d:system/etc/init.d \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/system/etc/hosts:system/etc/hosts
    
#    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/lib/libsurfaceflinger.so:system/lib/libsurfaceflinger.so

include vendor/lge/thunderc/packages.mk
