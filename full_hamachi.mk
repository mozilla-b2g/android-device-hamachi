$(call inherit-product, device/qcom/common/common.mk)
PRODUCT_COPY_FILES := \
  device/qcom/hamachi/touch.idc:system/usr/idc/msg2133.idc \
  device/qcom/hamachi/touch.idc:system/usr/idc/ft5x06_ts.idc \
  device/qcom/hamachi/media_profiles.xml:system/etc/media_profiles.xml \
  device/qcom/hamachi/audio.conf:system/etc/bluetooth/audio.conf \
  device/qcom/msm7627a/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf

$(call inherit-product-if-exists, vendor/qcom/hamachi/hamachi-vendor-blobs.mk)
$(call inherit-product-if-exists, vendor/qcom/common/vendor-blobs.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full.mk)

PRODUCT_PROPERTY_OVERRIDES += \
  rild.libpath=/system/lib/libril-qc-1.so \
  rild.libargs=-d/dev/smd0 \
  ro.use_data_netmgrd=true \
  ro.moz.ril.emergency_by_default=true \
  ro.display.colorfill=1 \
  ro.moz.omx.hw.max_width=640 \
  ro.moz.omx.hw.max_height=480 \
  ro.moz.ril.extra_int_2nd_call=true \


# Discard inherited values and use our own instead.
PRODUCT_NAME := full_hamachi
PRODUCT_DEVICE := hamachi
PRODUCT_BRAND := hamachi
PRODUCT_MANUFACTURER := hamachi
PRODUCT_MODEL := hamachi
ENABLE_LIBRECOVERY := true

PRODUCT_DEFAULT_PROPERTY_OVERRIDES := \
  persist.usb.serialno=$(PRODUCT_NAME)
