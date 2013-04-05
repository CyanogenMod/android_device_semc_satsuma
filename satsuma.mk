# proprietary side of the device
$(call inherit-product-if-exists, vendor/semc/satsuma/satsuma-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/semc/satsuma/overlay

$(call inherit-product, device/semc/mogami-common/mogami.mk)

$(call inherit-product, device/common/gps/gps_eu_supl.mk)

PRODUCT_AAPT_CONFIG := normal mdpi mdpi
PRODUCT_AAPT_PREF_CONFIG := mdpi

# Init files
PRODUCT_COPY_FILES += \
    device/semc/satsuma/prebuilt/init.semc.usb.rc:root/init.semc.usb.rc \
    device/semc/satsuma/prebuilt/hw_config.sh:system/etc/hw_config.sh \
    device/semc/msm7x30-common/prebuilt/logo_M.rle:root/logo.rle

# Device specific part for two-stage boot
PRODUCT_COPY_FILES += \
    device/semc/satsuma/recovery/bootrec-device:recovery/bootrec-device

# Device specific configs
PRODUCT_COPY_FILES += \
    device/semc/satsuma/config/cyttsp_key.kl:system/usr/keylayout/cyttsp_key.kl \
    device/semc/satsuma/config/cyttsp-spi.idc:system/usr/idc/cyttsp-spi.idc \
    device/semc/satsuma/config/atdaemon.kl:system/usr/keylayout/atdaemon.kl \
    device/semc/satsuma/config/msm_pmic_pwr_key.kl:system/usr/keylayout/msm_pmic_pwr_key.kl \
    device/semc/satsuma/config/pm8058-keypad.kl:system/usr/keylayout/pm8058-keypad.kl \
    device/semc/satsuma/config/simple_remote.kl:system/usr/keylayout/simple_remote.kl \
    device/semc/satsuma/config/init.qcom.bt.sh:system/etc/init.qcom.bt.sh \
    device/semc/satsuma/config/sensors.conf:system/etc/sensors.conf \
    device/semc/satsuma/config/tiwlan.ini:system/etc/tiwlan.ini

$(call inherit-product, device/semc/msm7x30-common/prebuilt/resources-mdpi.mk)

# Device properties
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=160 \
    com.qc.hdmi_out=false
