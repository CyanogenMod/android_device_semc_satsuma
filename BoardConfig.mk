-include device/semc/mogami-common/BoardConfigCommon.mk
-include vendor/semc/satsuma/BoardConfigVendor.mk

BOARD_HAS_NO_SELECT_BUTTON := true

TARGET_OTA_ASSERT_DEVICE := ST17a,ST17i,satsuma
