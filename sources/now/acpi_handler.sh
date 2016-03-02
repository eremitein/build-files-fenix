#!/bin/bash
# Default acpi script that takes an entry for all actions

PATH=${PATH}:/usr/local/bin:/usr/local/sbin
IFS=${IFS}/
set $@

case "$1" in
  button)
    case "$2" in
      power) /etc/i 0
         ;;
      volumedown) volume_down
         ;;
      volumeup) volume_up
         ;;
      mute) volume_mute
         ;;
      *) logger "ACPI group $1 / action $2 is not defined"
         ;;
    esac
    ;;
  cd)
    case "$2" in
      play) mem
         ;;
      next) hibernate
         ;;
      prev) hibernate_clean /dev/sda1
         ;;
    esac
    ;;
  ac_adapter)
    case "$2" in
      *)
        sleep 2
		#STATE=$(< /sys/class/power_supply/BAT1/status)
          #Discharging)
		STATE=$(< /sys/class/power_supply/ACAD/online)
        case "$STATE" in
          0)
            for d in /sys/devices/system/cpu/* ; do
              echo powersave > $d/cpufreq/scaling_governor
            done
            logger "ACPI: AC connector unplugged, changed CPUFreq Scaling Governor to \"powersave\""
            echo 2 > /sys/class/backlight/thinkpad_screen/brightness
            logger "ACPI: Changed brightness to level 1"
          ;;
          *)
            for d in /sys/devices/system/cpu/* ; do
              echo conservative > $d/cpufreq/scaling_governor
            done
            logger "ACPI: AC connector plugged in, changed CPUFreq Scaling Governor to \"conservative\""
            echo 4 > /sys/class/backlight/thinkpad_screen/brightness
            logger "ACPI: Changed brightness to level 4"
          ;;
        esac
      ;;
    esac
    ;;
  *)
    logger "ACPI group $1 / action $2 is not defined"
    ;;
esac
#  battery)
#    case "$2" in
#      PNP0C0A:00)
#            echo conservative > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
#            echo conservative > /sys/devices/system/cpu/cpu1/cpufreq/scaling_governor
#            logger "ACPI AC connector plugged in, changed CPUFreq Scaling Governor to \"conservative\""
#            echo 4 > /sys/class/backlight/acpi_video0/brightness
#            logger "ACPI: Changed brightness to level 4"
#      ;;
#      *)
#            logger "ACPI: TEST_BAT"
#      ;;
#    esac
#    ;;
