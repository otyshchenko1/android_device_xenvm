#
# Copyright (C) 2016 The Android Open-Source Project
# Copyright (C) 2018 EPAM Systems Inc.
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

$(call inherit-product, device/xen/xenvm/build/car_base.mk)

PRODUCT_PACKAGES += \
    OneTimeInitializer \
    Provision \
    SystemUI \
    SystemUpdater \
    Telecom \
    TeleService \
    TelephonyProvider \
    ContactsProvider \
    Browser2

PRODUCT_PACKAGES += \
    clatd \
    clatd.conf \
    pppd \
    screenrecord

# This is for testing
PRODUCT_PACKAGES += \
    DefaultStorageMonitoringCompanionApp \
    EmbeddedKitchenSinkApp \
    VmsPublisherClientSample \
    VmsSubscriberClientSample \
    com.android.car.powertestservice \

#    DirectRenderingClusterSample \

PRODUCT_COPY_FILES += \
    packages/services/Car/car_product/preloaded-classes-car:system/etc/preloaded-classes \

PRODUCT_PROPERTY_OVERRIDES += \
    ro.carrier=unknown

# Overlay for Google network and fused location providers
$(call inherit-product-if-exists, frameworks/base/data/fonts/fonts.mk)
$(call inherit-product-if-exists, external/google-fonts/dancing-script/fonts.mk)
$(call inherit-product-if-exists, external/google-fonts/carrois-gothic-sc/fonts.mk)
$(call inherit-product-if-exists, external/google-fonts/coming-soon/fonts.mk)
$(call inherit-product-if-exists, external/google-fonts/cutive-mono/fonts.mk)
$(call inherit-product-if-exists, external/noto-fonts/fonts.mk)
$(call inherit-product-if-exists, external/roboto-fonts/fonts.mk)
$(call inherit-product-if-exists, external/hyphenation-patterns/patterns.mk)
$(call inherit-product-if-exists, frameworks/base/data/keyboards/keyboards.mk)
$(call inherit-product-if-exists, frameworks/webview/chromium/chromium.mk)


# Overrides
PRODUCT_PROPERTY_OVERRIDES := \
    ro.config.ringtone=Atria.ogg \
    ro.config.notification_sound=Ariel.ogg \
    ro.config.alarm_alert=Argon.ogg \
    $(PRODUCT_PROPERTY_OVERRIDES)

# SetupWizard requires internet access before continuing
# (hot sim or wifi not blocked by captive portal)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.setupwizard.require_network=any

PRODUCT_PROPERTY_OVERRIDES += \
    android.car.drawer.unlimited=true \
    android.car.hvac.demo=true \
    com.android.car.radio.demo=true \
    com.android.car.radio.demo.dual=true


PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true

# Automotive specific packages
PRODUCT_PACKAGES += \
    CarService \
    CarTrustAgentService \
    CarDialerApp \
    CarRadioApp \
    OverviewApp \
    CarLauncher \
    CarLensPickerApp \
    LocalMediaPlayer \
    CarMediaApp \
    CarMessengerApp \
    CarHvacApp \
    CarMapsPlaceholder \
    CarLatinIME \
    CarSettings \
    CarUsbHandler \
    android.car \
    car-frameworks-service \
    com.android.car.procfsinspector \
    libcar-framework-service-jni \

# System Server components
PRODUCT_SYSTEM_SERVER_JARS += car-frameworks-service

# Boot animation
PRODUCT_COPY_FILES += \
    packages/services/Car/car_product/bootanimations/bootanimation-832.zip:system/media/bootanimation.zip

PRODUCT_PROPERTY_OVERRIDES += \
    fmas.spkr_6ch=35,20,110 \
    fmas.spkr_2ch=35,25 \
    fmas.spkr_angles=10 \
    fmas.spkr_sgain=0 \
    media.aac_51_output_enabled=true

PRODUCT_LOCALES := en_US af_ZA am_ET ar_EG bg_BG bn_BD ca_ES cs_CZ da_DK de_DE el_GR en_AU en_GB en_IN es_ES es_US et_EE eu_ES fa_IR fi_FI fr_CA fr_FR gl_ES hi_IN hr_HR hu_HU hy_AM in_ID is_IS it_IT iw_IL ja_JP ka_GE km_KH ko_KR ky_KG lo_LA lt_LT lv_LV km_MH kn_IN mn_MN ml_IN mk_MK mr_IN ms_MY my_MM ne_NP nb_NO nl_NL pl_PL pt_BR pt_PT ro_RO ru_RU si_LK sk_SK sl_SI sr_RS sv_SE sw_TZ ta_IN te_IN th_TH tl_PH tr_TR uk_UA vi_VN zh_CN zh_HK zh_TW zu_ZA en_XA ar_XB

# should add to BOOT_JARS only once
ifeq (,$(INCLUDED_ANDROID_CAR_TO_PRODUCT_BOOT_JARS))
PRODUCT_BOOT_JARS += \
    android.car

INCLUDED_ANDROID_CAR_TO_PRODUCT_BOOT_JARS := yes
endif