LOCAL_PATH := $(call my-dir)
MY_PATH := $(LOCAL_PATH)
include $(CLEAR_VARS)
LOCAL_PATH := $(MY_PATH)

SCC_ROOT := $(LOCAL_PATH)/../external/sqlite-fake-crypto-batch-connection-core

LOCAL_CFLAGS +=  $(SQLCIPHER_CFLAGS) $(SQLCIPHER_OTHER_CFLAGS)
LOCAL_C_INCLUDES += $(LOCAL_PATH)
LOCAL_C_INCLUDES += $(SCC_ROOT)
LOCAL_LDLIBS := -llog
LOCAL_LDFLAGS += -L$(ANDROID_NATIVE_ROOT_DIR)/$(TARGET_ARCH_ABI) -fuse-ld=bfd
LOCAL_STATIC_LIBRARIES += static-libcrypto
LOCAL_MODULE    := sqlc-connection-core-glue
# includes the SQLite amalgamation:
LOCAL_SRC_FILES := $(SCC_ROOT)/sccglue/jni/sccglue_jni_all.c

include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := static-libcrypto
LOCAL_EXPORT_C_INCLUDES := $(OPENSSL_DIR)/include
LOCAL_SRC_FILES := $(ANDROID_NATIVE_ROOT_DIR)/$(TARGET_ARCH_ABI)/libcrypto.a
include $(PREBUILT_STATIC_LIBRARY)
