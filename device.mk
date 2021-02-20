#
# Copyright (C) 2020-2021 The LineageOS Project
# Copyright (C) 2020-2021 The Evolution X Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/product_launched_with_p.mk)

# Enable updating of APEXes
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# Get non-open-source specific aspects
$(call inherit-product-if-exists, vendor/xiaomi/raphael/raphael-vendor.mk)

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# VNDK
PRODUCT_TARGET_VNDK_VERSION := 29
PRODUCT_EXTRA_VNDK_VERSIONS := 29

# Boot animation
TARGET_SCREEN_HEIGHT := 2340
TARGET_SCREEN_WIDTH := 1080

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay

PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/vendor-overlay/,$(TARGET_COPY_OUT_PRODUCT)/vendor_overlay/$(PRODUCT_TARGET_VNDK_VERSION))

PRODUCT_PACKAGES += \
    AospFrameworkResOverlay \
    AospWifiResOverlay \
    FrameworksResCommon \
    FrameworksResTarget \
    GmsTelecommOverlay \
    GmsTelephonyOverlay \
    SystemUIResCommon \
    TelecommResCommon \
    TelephonyResCommon \
    TetheringConfigOverlay \
    WifiOverlay \
    WifiResCommon \
    WifiResTarget

# Properties
-include $(LOCAL_PATH)/system_prop.mk
-include $(LOCAL_PATH)/product_prop.mk
PRODUCT_COMPATIBLE_PROPERTY_OVERRIDE := true

# ANT+
PRODUCT_PACKAGES += \
    AntHalService-Soong \
    com.dsi.ant.antradio_library \
    com.dsi.ant@1.0

# Atrace
PRODUCT_PACKAGES += \
    android.hardware.atrace@1.0-service

# Audio
PRODUCT_PACKAGES += \
    audio.a2dp.default \

# Bluetooth
PRODUCT_PACKAGES += \
    vendor.qti.hardware.bluetooth_audio@2.0 \
    vendor.qti.hardware.btconfigstore@1.0 \
    vendor.qti.hardware.btconfigstore@2.0

# Component overrides
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/component-overrides_qti.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/sysconfig/component-overrides.xml

# Cryptfshw
PRODUCT_PACKAGES += \
    vendor.qti.hardware.cryptfshw@1.0

# Display
PRODUCT_PACKAGES += \
    libdisplayconfig.qti \
    libqdMetaData \
    libqdMetaData.system

PRODUCT_PACKAGES += \
    vendor.qti.hardware.display.composer@3.0 \
    vendor.qti.hardware.display.mapper@3.0 \
    vendor.qti.hardware.display.mapperextensions@1.0 \

PRODUCT_PACKAGES += \
    gralloc.msmnile \
    hwcomposer.msmnile \
    memtrack.msmnile

# Fingerprint
PRODUCT_COPY_FILES += \
    vendor/evolution/config/permissions/vendor.lineage.biometrics.fingerprint.inscreen.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/vendor.lineage.biometrics.fingerprint.inscreen.xml

PRODUCT_PACKAGES += \
    lineage.biometrics.fingerprint.inscreen@1.0-service.raphael

# FM
PRODUCT_PACKAGES += \
    FM2 \
    libqcomfm_jni \
    qcom.fmradio

# Health
PRODUCT_PACKAGES += \
    android.hardware.health@2.1-impl \
    android.hardware.health@2.1-service

# Storage health HAL
PRODUCT_PACKAGES += \
    android.hardware.health.storage@1.0-service

# HIDL
PRODUCT_PACKAGES += \
    android.hidl.base@1.0 \
    android.hidl.manager@1.0 \
    libhidltransport \
    libhwbinder

# Hotword Enrollment
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/privapp-permissions-hotword.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-hotword.xml

# IFAA manager
PRODUCT_PACKAGES += \
    org.ifaa.android.manager

PRODUCT_BOOT_JARS += \
    org.ifaa.android.manager

# Init
PRODUCT_PACKAGES += \
    init.mi_thermald.rc \
    init.qcom.rc \
    init.qcom.usb.sh

# Input
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/keylayout/gpio-keys.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/gpio-keys.kl \
    $(LOCAL_PATH)/keylayout/sm8150-tavil-snd-card_Button_Jack.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/sm8150-tavil-snd-card_Button_Jack.kl

# Lights
PRODUCT_PACKAGES += \
    android.hardware.light@2.0-impl.raphael

# LiveDisplay
PRODUCT_PACKAGES += \
    lineage.livedisplay@2.0-service-sdm

# Network
PRODUCT_PACKAGES += \
    netutils-wrapper-1.0

# NFC
PRODUCT_PACKAGES += \
    android.hardware.nfc@1.2-service \
    com.android.nfc_extras \
    com.gsma.services.nfc \
    NfcNci \
    SecureElement \
    Tag

# Power
PRODUCT_PACKAGES += \
    android.hardware.power@1.2-service.raphael \
    vendor.qti.hardware.perf@2.0 \
    vendor.qti.hardware.perf@2.1 \
    vendor.qti.hardware.perf@2.2

# QTI
PRODUCT_PACKAGES += \
    libqti_vndfwk_detect \
    libvndfwk_detect_jni.qti

# Remove unwanted packages
PRODUCT_PACKAGES += \
    RemovePackages

# RenderScript
PRODUCT_PACKAGES += \
    android.hardware.renderscript@1.0-impl

# Ril
PRODUCT_PACKAGES += \
    android.hardware.radio@1.4

# Sensors
PRODUCT_PACKAGES += \
    android.hardware.sensors@1.0-impl \
    android.hardware.sensors@1.0-service \
    libsensorndkbridge

# Service Tracker
PRODUCT_PACKAGES += \
    vendor.qti.hardware.servicetracker@1.2

# Signapk
PRODUCT_HOST_PACKAGES += \
    signapk

# System Helper
PRODUCT_PACKAGES += \
    vendor.qti.hardware.systemhelper@1.0

# Telephony
PRODUCT_PACKAGES += \
    ims-ext-common \
    ims_ext_common.xml \
    qti-telephony-hidl-wrapper \
    qti_telephony_hidl_wrapper.xml \
    qti-telephony-utils \
    qti_telephony_utils.xml \
    telephony-ext

PRODUCT_BOOT_JARS += \
    telephony-ext

# USB
PRODUCT_PACKAGES += \
    android.hardware.usb@1.2-service-qti

# Vibrator HAL
PRODUCT_PACKAGES += \
    vendor.qti.hardware.vibrator.service

# Vulkan
PRODUCT_PACKAGES += \
    libvulkan

# WiFi
PRODUCT_PACKAGES += \
    vendor.qti.hardware.wifi.keystore@1.0 \

# WiFi Display
PRODUCT_PACKAGES += \
    libnl

#PRODUCT_BOOT_JARS += \
    WfdCommon

# Xiaomi Parts
PRODUCT_PACKAGES += \
    XiaomiParts
