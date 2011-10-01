# Audio jack configuration
dev=/sys/devices/platform/simple_remote.0
echo 0,201,1600 > $dev/accessory_min_vals  # default = 0,200,1600
echo 200,1599  > $dev/accessory_max_vals  # default = 200,1600
echo 0,100,280,500,700 > $dev/button_min_vals  # default = 0,100,300,600,700
echo 99,199,399,699,5000  > $dev/button_max_vals  # default = 99,199,399,699,5000
echo 512   > $dev/btn_trig_period_freq  # Button Period Freq(Hz) default = 512
echo 16  > $dev/btn_trig_period_time  # Button Period Time(cycle) default = 16
echo 512   > $dev/btn_trig_hyst_freq    # Button Hysteresis Freq(Hz) default = 512
echo 16  > $dev/btn_trig_hyst_time   # Button Hysteresis Time(Cycle) default = 16
echo 500 > $dev/btn_trig_level  # default = 500

# Proximity sensor configuration
dev=/sys/bus/i2c/devices/0-0054/
val_cycle=0
val_nburst=1
val_freq=0
val_threshold=4
val_filter=0

nv_param_loader 60240 prox_cal
val_calibrated=$?
case $val_calibrated in
 1)
  nv_param_loader 60240 threshold
  val_threshold=$?
  nv_param_loader 60240 rfilter
  val_filter=$?
  ;;
esac

echo $val_cycle > $dev/cycle    # Duration Cycle. Valid range is 0 - 3.
echo $val_nburst > $dev/nburst  # Number of pulses in burst. Valid range is 0 - 15.
echo $val_freq > $dev/freq      # Burst frequency. Valid range is 0 - 3.
echo $val_threshold > $dev/threshold # sensor threshold. Valid range is 0 - 15 (0.12V - 0.87V)
echo $val_filter > $dev/filter  # RFilter. Valid range is 0 - 3.

# LMU AS3676 Configuration
dev=/sys/devices/i2c-0/0-0040/leds
#Sensor on/off. 1 = on, reg 90h
echo 1 > $dev/lcd-backlight/als/enable
#[gain],[filter_up],[filter_down],[offset]
echo 3,2,2,0 > $dev/lcd-backlight/als/params
# touch-button-backlight
echo 8000 > $dev/button-backlight/max_current
echo 6450 > $dev/red/max_current
echo 7950 > $dev/green/max_current
echo 4500 > $dev/blue/max_current
# ALS curve display BL [grp],[Y0],[Y3],[K1],[K2],[X1],[X2]
echo 1,30,255,54,52,1,65 > $dev/lcd-backlight/als/curve
# ALS curve key LED 2 [grp],[Y0],[Y3],[K1],[K2],[X1],[X2]
echo 2,48,0,128,128,4,10 > $dev/button-backlight/als/curve
# ALS curve RGB(red) [grp],[Y0],[Y3],[K1],[K2],[X1],[X2]
echo 3,71,255,64,32,5,37 > $dev/red/als/curve
# ALS curve RGB(green) [grp],[Y0],[Y3],[K1],[K2],[X1],[X2]
echo 3,71,255,64,32,5,37 > $dev/green/als/curve
# ALS curve RGB(blue) [grp],[Y0],[Y3],[K1],[K2],[X1],[X2]
echo 3,71,255,64,32,5,37 > $dev/blue/als/curve

dev=/sys/devices/platform/spi_qsd.0/spi0.0
app_id=`cat  $dev/appid`
case "$app_id" in
	"0x0207")
		fw=touch_satsuma_hitachi.hex
        ;;
	*)
		fw=touch_satsuma_hitachi.hex
        ;;
esac
cyttsp_fwloader -dev $dev -fw /system/etc/firmware/$fw

# TI BQ275xx firmware loader
bq275xx_fwloader
