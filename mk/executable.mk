ifeq ($(TOP_DIRECTORY),)
  $(error <executable.mk> TOP_DIRECTORY must be defined)
endif
ifeq ($(EXECUTABLE),)
  $(error <executable.mk> EXECUTABLE must be defined)
endif
ifeq ($(SOURCES),)
  $(error <executable.mk> SOURCES must be defined)
endif

-include $(TOP_DIRECTORY)/mk/configuration.mk

OBJECTS=$(addprefix $(BUILD_OUTPUT_DIRECTORY)/,$(addsuffix .o,$(basename $(SOURCES))))
DEPENDENCIES=$(addprefix $(BUILD_OUTPUT_DIRECTORY)/,$(addsuffix .d,$(basename $(SOURCES))))
EXECUTABLE_TARGET=$(addprefix $(BUILD_OUTPUT_DIRECTORY)/, $(EXECUTABLE))
BUILD_OUTPUT_FILES=$(OBJECTS) $(DEPENDENCIES) $(EXECUTABLE_TARGETS)

define compile_c_executable_target
  @cmd="$(CC) $(CFLAGS) $(OBJECTS) -o $@ $(LDFLAGS)" ; \
  if test ! "$(BUILD_VERBOSE)" -eq 1; then \
    echo "Compiling $@"; \
  else \
    echo "$$cmd"; \
  fi; \
  $$cmd
endef

define compile_cpp_executable_target
  @cmd="$(CXX) $(CXXFLAGS) $(OBJECTS) -o $@ $(CXXLDFLAGS)" ; \
  if test ! "$(BUILD_VERBOSE)" -eq 1; then \
    echo "Compiling $@"; \
  else \
    echo "$$cmd"; \
  fi; \
  $$cmd
endef

all: build-directories $(OBJECTS) $(EXECUTABLE_TARGET)

ifneq ($(wildcard $(addsuffix .c, $(EXECUTABLE))),)
$(EXECUTABLE_TARGET): $(OBJECTS)
	@$(compile_c_executable_target)
else
$(EXECUTABLE_TARGET): $(OBJECTS)
	@$(compile_cpp_executable_target)
endif

-include $(TOP_DIRECTORY)/mk/target.mk
-include $(TOP_DIRECTORY)/mk/build.mk
-include $(TOP_DIRECTORY)/mk/dependency.mk
-include $(DEPENDENCIES)
