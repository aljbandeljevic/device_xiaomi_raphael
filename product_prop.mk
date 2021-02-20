#
# Copyright (C) 2020-2021 The LineageOS Project
# Copyright (C) 2020-2021 The Evolution X Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Adb
ifeq ($(TARGET_BUILD_VARIANT),eng)
# /vendor/default.prop is force-setting ro.adb.secure=1
# Get rid of that by overriding it in /product on eng builds
PRODUCT_PRODUCT_PROPERTIES += \
    ro.secure=0 \
    ro.adb.secure=0
endif

# Enable blurs
PRODUCT_PRODUCT_PROPERTIES += \
    ro.surface_flinger.supports_background_blur=1 \
    ro.sf.blurs_are_expensive=1

# Device
PRODUCT_PRODUCT_PROPERTIES += \
    ro.build.characteristics=nosdcard

# Dex2oat
PRODUCT_PRODUCT_PROPERTIES += \
    dalvik.vm.dex2oat64.enabled=true

# Override heap growth limit due to high display density on device
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.heapgrowthlimit=256m

# Media
PRODUCT_PRODUCT_PROPERTIES += \
    debug.stagefright.omx_default_rank.sw-audio=16

# Priv-app permission
PRODUCT_PRODUCT_PROPERTIES += \
    ro.control_privapp_permissions=log
