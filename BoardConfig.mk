# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

# WARNING: This line must come *before* including the proprietary
# variant, so that it gets overwritten by the parent (which goes
# against the traditional rules of inheritance).

USE_CAMERA_STUB := true
BOARD_VENDOR := htc

# inherit from the proprietary version
-include vendor/htc/protou/BoardConfigVendor.mk

# Include path
TARGET_SPECIFIC_HEADER_PATH := device/htc/protou/include

# cflags
TARGET_GLOBAL_CFLAGS   += -mtune=cortex-a5 -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mtune=cortex-a5 -mfpu=neon -mfloat-abi=softfp
COMMON_GLOBAL_CFLAGS   += -DREFRESH_RATE=65 -DQCOM_NO_SECURE_PLAYBACK -DQCOM_LEGACY_OMX -DANCIENT_GL
COMMON_GLOBAL_CFLAGS   += -DQCOM_ICS_DECODERS -DQCOM_HARDWARE -DNO_UPDATE_PREVIEW
COMMON_GLOBAL_CFLAGS   += -DHTC_CAMERA_HARDWARE

# Target Board
TARGET_BOARD_PLATFORM := msm7627a
TARGET_BOARD_PLATFORM_GPU := qcom-adreno200

# Arch related defines and optimizations
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_ARCH_VARIANT_CPU := cortex-a5
TARGET_ARCH_VARIANT_FPU := neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_SMP := true
ARCH_ARM_HIGH_OPTIMIZATION := true
ARCH_ARM_HAVE_NEON := true
TARGET_CORTEX_CACHE_LINE_32 := true
ARCH_ARM_HAVE_ARMV7A := true
# Try to use ASHMEM if possible (when non-MDP composition is used)
TARGET_GRALLOC_USES_ASHMEM := true

# Compiler Optimization
ARCH_ARM_HIGH_OPTIMIZATION := true
ARCH_ARM_HIGH_OPTIMIZATION_COMPAT := true

# Optimisations used by Qualcomm
TARGET_CORTEX_CACHE_LINE_32 := true
TARGET_USE_SPARROW_BIONIC_OPTIMIZATION := true
TARGET_HAVE_TSLIB := true

# Target information
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true
TARGET_BOOTLOADER_BOARD_NAME := protou
BOARD_WANTS_EMMC_BOOT := true

# Kernel [Settings]
BOARD_KERNEL_BASE := 0x03200000
BOARD_KERNEL_PAGE_SIZE := 2048
BOARD_KERNEL_CMDLINE := no_console_suspend=1 console=null
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x01000000

# Kernel [Build]
TARGET_KERNEL_CONFIG := cm_defconfig
TARGET_KERNEL_SOURCE := kernel/htc/protou

#Partition Sizes
# cat /proc/emmc
#dev:        size     erasesize name
#mmcblk0p17: 00040000 00000200 "misc"
#mmcblk0p21: 00c7f600 00000200 "recovery"
#mmcblk0p27: 00fffc00 00000200 "boot"
#mmcblk0p24: 3bdffe00 00000200 "system"
#mmcblk0p26: 0f000000 00000200 "cache"
#mmcblk0p25: 4cfffe00 00000200 "userdata"
#mmcblk0p28: 017ade00 00000200 "devlog"
#mmcblk0p30: 00040000 00000200 "pdata"
#mmcblk0p31: 46800000 00000200 "fat"
#mmcblk0p29: 00011c00 00000200 "extra"

# Filesystem
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_BOOTIMAGE_PARTITION_SIZE := 16776192
BOARD_CACHEIMAGE_PARTITION_SIZE := 251658240
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 13104640
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1004535296
BOARD_USERDATAIMAGE_PARTITION_SIZE := 1291845120
BOARD_FLASH_BLOCK_SIZE := 131072

# Vold
BOARD_VOLD_MAX_PARTITIONS := 31
BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true

# USB
BOARD_USE_USB_MASS_STORAGE_SWITCH := true
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/class/android_usb/android0/f_mass_storage/lun0/file

# QC COMMONS
BOARD_USES_QCOM_HARDWARE := true
BOARD_USES_QCOM_LIBS := true
BOARD_USES_QCOM_LIBRPC := true
BOARD_USE_QCOM_LLVM_CLANG_RS := true

# Audio legacy
TARGET_PROVIDES_LIBAUDIO := true
BOARD_HAVE_HTC_AUDIO := true
TARGET_USES_QCOM_COMPRESSED_AUDIO := true
COMMON_GLOBAL_CFLAGS += -DHTC_ACOUSTIC_AUDIO -DLEGACY_QCOM_VOICE

# OpenGL drivers config file path
BOARD_EGL_CFG := device/htc/protou/configs/egl.cfg

# Graphics
BOARD_USE_SKIA_LCDTEXT := true
USE_OPENGL_RENDERER := true
TARGET_QCOM_DISPLAY_VARIANT := legacy
BOARD_ADRENO_DECIDE_TEXTURE_TARGET := true
BOARD_AVOID_DRAW_TEXTURE_EXTENSION := true
TARGET_QCOM_HDMI_OUT := false
BOARD_EGL_NEEDS_LEGACY_FB := true
TARGET_USES_16BPPSURFACE_FOR_OPAQUE := true
TARGET_USES_C2D_COMPOSITION := true
TARGET_NO_HW_VSYNC := true
TARGET_USES_OVERLAY := true
TARGET_USES_GENLOCK := true

# ION
TARGET_USES_ION := true
BOARD_HAVE_OLD_ION_API := true

# Media
TARGET_QCOM_MEDIA_VARIANT := legacy

# Add QC Video Enhancements flag
TARGET_ENABLE_QC_AV_ENHANCEMENTS := true

# Camera
CAMERA_USES_SURFACEFLINGER_CLIENT_STUB := true
BOARD_NEEDS_MEMORYHEAPPMEM := true
MM_V4L2_DRIVER_LIST := true
V4L2_BASED_LIBCAM := true
COMMON_GLOBAL_CFLAGS += -DDISABLE_HW_ID_MATCH_CHECK
COMMON_GLOBAL_CFLAGS += -DHTC_CAMERA_HARDWARE

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/htc/protou/bluetooth/include
BOARD_BLUEDROID_VENDOR_CONF := device/htc/protou/bluetooth/vnd_protou.txt

# Wifi related definitions
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
WPA_SUPPLICANT_VERSION           := VER_0_8_X
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_HOSTAPD_DRIVER             := NL80211
BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_bcmdhd
BOARD_WLAN_DEVICE                := bcmdhd
BOARD_WLAN_DEVICE_REV 		 := bcm4330_b2
WIFI_DRIVER_FW_PATH_PARAM        := "/sys/module/bcmdhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA          := "/system/etc/firmware/fw_bcm4330_b2.bin"
WIFI_DRIVER_FW_PATH_AP           := "/system/etc/firmware/fw_bcm4330_apsta_b2.bin"
WIFI_DRIVER_FW_PATH_P2P          := "/system/etc/firmware/fw_bcm4330_p2p_b2.bin"
WIFI_DRIVER_MODULE_NAME          := "bcmdhd"
WIFI_DRIVER_MODULE_ARG           := "firmware_path=/system/etc/firmware/fw_bcm4330_b2.bin nvram_path=/etc/calibration iface_name=wlan0"
WIFI_BAND                        := 802_11_BG
BOARD_LEGACY_NL80211_STA_EVENTS  := true

# GPS
BOARD_USES_QCOM_GPS := true
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := default
BOARD_VENDOR_QCOM_GPS_LOC_API_AMSS_VERSION := 50000
COMMON_GLOBAL_CFLAGS += -DQCOM_HARDWARE

# HTC RIL compatability
BOARD_USE_NEW_LIBRIL_HTC := true
BOARD_USES_LEGACY_RIL := true
COMMON_GLOBAL_CFLAGS += -DHTCLOG

# Releasetools
TARGET_RELEASETOOLS_EXTENSIONS := device/htc/common

# No SDK blobs
BUILD_EMULATOR_SENSORS_MODULE := false
BUILD_EMULATOR_GPS_MODULE := false

# Screen
TARGET_BOOTANIMATION_PRELOAD := true
TARGET_BOOTANIMATION_TEXTURE_CACHE := true
TARGET_BOOTANIMATION_USE_RGB565 := true
BOARD_HAVE_MXT224_CFG := true

# Add h/w acceleration in browser
ENABLE_WEBGL := true
WITH_JIT := true
ENABLE_JSC_JIT := true
JS_ENGINE := v8
HTTP := chrome
TARGET_FORCE_CPU_UPLOAD := true

# FM Radio
BOARD_HAVE_QCOM_FM := true
COMMON_GLOBAL_CFLAGS += -DQCOM_FM_ENABLED

# Touch screen compatibility for JB
BOARD_USE_LEGACY_TOUCHSCREEN := true

# Fonts
SMALLER_FONT_FOOTPRINT := true

# CUSTOM LIGHTS
TARGET_PROVIDES_LIBLIGHT := true

# Power
TARGET_PROVIDES_POWER_HAL := true

# Recovery
DEVICE_RESOLUTION := 480x800
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_SDCARD_DEVICE_PRIMARY := /dev/block/mmcblk1p1
BOARD_SDCARD_DEVICE_SECONDARY := /dev/block/mmcblk1
BOARD_SD_EXT_DEVICE := /dev/block/mmcblk1p2
BOARD_USES_MMCUTILS := true
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_15x24.h\"
BOARD_RECOVERY_TOUCH := true
TARGET_RECOVERY_PIXEL_FORMAT := "RGB_565"
TARGET_RECOVERY_FSTAB := device/htc/protou/recovery.fstab
