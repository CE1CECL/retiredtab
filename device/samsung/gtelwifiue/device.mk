#Inherit from vendor
$(call inherit-product-if-exists, vendor/samsung/gtelwifiue/gtelwifiue-vendor.mk)

# Inherit from common
$(call inherit-product, device/samsung/gte-common/device-common.mk)

LOCAL_PATH := device/samsung/gtelwifiue

# Audio
PRODUCT_PACKAGES += \
    android.hardware.audio@7.0-impl \
    android.hardware.audio.effect@7.0-impl

PRODUCT_PACKAGES += \
   android.hardware.bluetooth.audio@2.0-impl \

# Bluetooth
PRODUCT_PACKAGES += \
    android.hardware.bluetooth@1.0-impl \
    android.hardware.bluetooth@1.0-service

# Mixer_paths.xml needed otherwise android.hardware.audio.service will crash and cause stuck at bootanimation
#
# E audio_route: Failed to open /vendor/etc/mixer_paths.xml: No such file or directory
# E msm8916_platform: platform_init: Failed to init audio route controls, aborting.
# E audio_hw_primary: adev_open: Failed to init platform data, aborting.
# libc    : Fatal signal 11 (SIGSEGV), code 1 (SEGV_MAPERR), fault addr 0xa75cd0a4 in tid 689 (audio.service), pid 689 (audio.service)
PRODUCT_COPY_FILES += \
    device/samsung/msm8916-common/configs/audio/mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths.xml \
    frameworks/av/services/audiopolicy/config/a2dp_in_audio_policy_configuration_7_0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/a2dp_in_audio_policy_configuration_7_0.xml

# System properties
-include $(LOCAL_PATH)/system_prop.mk

# Common overlay
DEVICE_PACKAGE_OVERLAYS += device/samsung/gtelwifiue/overlay
