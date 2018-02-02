LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

lib_source_dir := $(LOCAL_PATH)

## Arch-common settings
LOCAL_MODULE := libpci
#LOCAL_32_BIT_ONLY := true

LOCAL_MODULE_CLASS := SHARED_LIBRARIES

LOCAL_CFLAGS += -Wall -W -Wno-parentheses -Wstrict-prototypes -Wmissing-prototypes
LOCAL_CFLAGS += -O2

LOCAL_C_INCLUDES := \
       external/zlib

lib_srcs_c  += lib/init.c 
lib_srcs_c  += lib/access.c 
lib_srcs_c  += lib/generic.c 
lib_srcs_c  += lib/dump.c 
lib_srcs_c  += lib/names.c 
lib_srcs_c  += lib/filter.c 
lib_srcs_c  += lib/names-hash.c 
lib_srcs_c  += lib/names-parse.c 
lib_srcs_c  += lib/names-net.c 
lib_srcs_c  += lib/names-cache.c 
lib_srcs_c  += lib/names-hwdb.c 
lib_srcs_c  += lib/params.c 
lib_srcs_c  += lib/caps.c 
lib_srcs_c  += lib/sysfs.c 
lib_srcs_c  += lib/proc.c 

LOCAL_SRC_FILES := $(lib_srcs_c)

LOCAL_SHARED_LIBRARIES := \
	libz

# Load the arch-specific settings

include $(BUILD_SHARED_LIBRARY)

#################################################################################

include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
	lspci.c \
	ls-vpd.c \
	ls-caps.c \
	ls-caps-vendor.c \
	ls-ecaps.c \
	ls-kernel.c \
	ls-tree.c \
	ls-map.c \
	common.c \

LOCAL_SHARED_LIBRARIES := \
	libutils libpci

LOCAL_MODULE := lspci

LOCAL_MODULE_TAGS := optional

include $(BUILD_EXECUTABLE)

##################################################################################

include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
	setpci.c \
	common.c \

LOCAL_SHARED_LIBRARIES := \
	libutils libpci

LOCAL_MODULE := setpci

LOCAL_MODULE_TAGS := optional

include $(BUILD_EXECUTABLE)
