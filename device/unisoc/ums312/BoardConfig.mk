# ====== Android 9 (Pie) 特定配置 ======
# 1. 系统作为只读分区 (Android 9的默认行为)
BOARD_BUILD_SYSTEM_ROOT_IMAGE := true
TARGET_NO_KERNEL := false

# 2. 加密配置 (根据你的fstab，确认无加密)
# 你的设备fstab中无forceencrypt标志，且ro.crypto.state=unsupported
TW_INCLUDE_CRYPTO := false
TW_INCLUDE_FBE := false

# 3. 修复可能出现的“未找到/system”错误
TARGET_COPY_OUT_VENDOR := vendor
TW_NEVER_UNMOUNT_SYSTEM := true

# 4. 内核页面大小 (必须与你的内核匹配，通常为2048)
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_BASE := 0x10000000

# 5. 避免TWRP挂载vendor时出错 (安卓9开始分离vendor)
TW_EXCLUDE_APEX := true

# ====== 设备通用配置 (根据你之前的信息) ======
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a

# 使用你提取的内核
TARGET_PREBUILT_KERNEL := device/unisoc/ums312/kernel

# 分区大小 (必须精确！)
BOARD_BOOTIMAGE_PARTITION_SIZE := 36700160 # 35MB in bytes
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 41943040 # 40MB
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 5368709120 # 5GB
BOARD_USERDATAIMAGE_PARTITION_SIZE := 25079951360 # 23.3GB

# 界面与功能
TW_THEME := portrait_hdpi
TW_SCREEN_BLANK_ON_BOOT := true
TW_INPUT_BLACKLIST := "hbtp_vm"
TW_USE_TOOLBOX := true
RECOVERY_TOUCHSCREEN_SWAP_XY := true
RECOVERY_TOUCHSCREEN_FLIP_Y := true
