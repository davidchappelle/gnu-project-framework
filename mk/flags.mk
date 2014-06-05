ifeq ($(TOP_DIRECTORY),)
  $(error <configuration.mk> TOP_DIRECTORY must be defined)
endif

INCLUDE_DIRECTORIES+= \
	-I$(BUILD_INCLUDE_DIRECTORY)

LIBRARY_DIRECTORIES+= \
	-L$(BUILD_LIBRARY_DIRECTORY)

CFLAGS+=-g -O0 $(INCLUDE_DIRECTORIES)

LDFLAGS+=$(LIBRARY_DIRECTORIES)

CXXWARNINGS= \
    -Wall \
    -W \
    -Wredundant-decls \
    -Wpointer-arith \
    -Wno-unused \
    -Wformat-security \
    -Wmissing-format-attribute \
    -Winline \
    -Werror \

CXXFLAGS+=-g -O0 $(CXXWARNINGS) $(INCLUDE_DIRECTORIES)

CXXLDFLAGS+=$(LIBRARY_DIRECTORIES)

