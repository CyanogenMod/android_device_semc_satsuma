-include device/semc/msm7x30-common/BoardConfigCommon.mk
-include device/semc/mogami-common/BoardConfigCommon.mk
-include vendor/semc/satsuma/BoardConfigVendor.mk

TARGET_KERNEL_SOURCE := kernel/semc/msm7x30
TARGET_KERNEL_CONFIG := cyanogen_satsuma_defconfig
TARGET_PREBUILT_KERNEL := device/semc/satsuma/prebuilt/kernel

SENSORS_COMPASS_AK897X := true
SENSORS_ACCEL_BMA150_INPUT := false
SENSORS_ACCEL_BMA250_INPUT := true
SENSORS_PROXIMITY_APDS970X := true
SENSORS_PRESSURE_BMP180 := true

TARGET_OTA_ASSERT_DEVICE := ST17a,ST17i,satsuma
