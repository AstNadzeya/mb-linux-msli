ifndef UCLIBC_DIR
UCLIBC_DIR:=$(shell cd ../.. && pwd)
include $(UCLIBC_DIR)/.config
endif
ifndef LABX_DIR
LABX_DIR:=$(shell cd ../../../lax-ip/IO_Link/Applications && pwd)
endif
UCLIBC_LIB_DIR:=$(UCLIBC_DIR)/lib
UCLIBC_USER_DIR:=$(UCLIBC_DIR)/user
SOFTWARE_LIB_DIR=$(UCLIBC_LIB_DIR)

CROSS_COMPILING?=1
COMPILER_PREFIX?=mb-
RELEASE?=1
ROMFSINST?=romfs-inst.sh
TARGET_PLATFORM_LINUX?=1
TARGET_PLATFROM_POSIX?=1
COMPILER_FRONTEND_CC?=ucfront-gcc
COMPILER_FRONTEND_CXX?=ucfront-g++
LINK_FLAGS+=-Wl,-elf2flt
VARIANT?=dmitri-io
STRIP=true
FLTFLAGS += -s 32768
ALL_TARGETS+=romfs 
export ROMFSDIR?=$(UCLIBC_DIR)/romfs
export IMAGEDIR?=$(UCLIBC_DIR)/images
PROJECT_TOP_DIR=$(PWD)

BUILD_DIR=$(PROJECT_TOP_DIR)/tmp-target
CONFIGURE_DIR=$(PROJECT_TOP_DIR)
NATIVE_BUILD_DIR=$(PWD)/tmp-native

.PHONY : first_target romfs

first_target : all

include $(PROJECT_TOP_DIR)/project.mk
include $(PROJECT_TOP_DIR)/magic.mk