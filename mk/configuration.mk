ifeq ($(TOP_DIRECTORY),)
  $(error <configuration.mk> TOP_DIRECTORY must be defined)
endif

BUILD_VERBOSE?=1
BUILD_OUTPUT_DIRECTORY?=output
BUILD_LIBRARY_DIRECTORY?=$(TOP_DIRECTORY)/lib
BUILD_INCLUDE_DIRECTORY?=$(TOP_DIRECTORY)/include
