ifeq ($(TOP_DIRECTORY),)
  $(error <build.mk> TOP_DIRECTORY must be defined)
endif

ifeq ($(BUILD_CLEANUP_FILES),)
  $(error <build.mk> BUILD_CLEANUP_FILES must be defined)
endif

ifeq ($(BUILD_OUTPUT_DIRECTORY),)
  $(error <build.mk> BUILD_OUTPUT_DIRECTORY must be defined)
endif

ifeq ($(BUILD_LIBRARY_DIRECTORY),)
  $(error <build.mk> BUILD_LIBRARY_DIRECTORY must be defined)
endif

BUILD_DIRECTORIES=$(BUILD_OUTPUT_DIRECTORY) $(BUILD_LIBRARY_DIRECTORY)
BUILD_VERBOSE?=1

-include $(TOP_DIRECTORY)/mk/flags.mk
-include $(TOP_DIRECTORY)/mk/tools.mk

.SUFFIXES: .o .cpp

define create_build_directories
  +@directories='$(BUILD_DIRECTORIES)'; \
  for directory in $$directories; do \
    if [ ! -d $$directory ]; then \
      if test ! "$(BUILD_VERBOSE)" -eq 1; then \
        echo "Creating directory $$directory"; \
      fi; \
      $(MKDIR) -p $$directory; \
    fi; \
  done;
endef

# Currently we do not remove build directories. If we
# do find the need to it this should be called from
# clean below.
define remove_build_directories
  +@directories='$(BUILD_DIRECTORIES)'; \
  for directory in $$directories; do \
    if [ -d $$directory ]; then \
      if test ! "$(BUILD_VERBOSE)" -eq 1; then \
        echo "Removing directory $$directory"; \
      fi; \
      $(RM) -fr $$directory; \
    fi; \
  done;
endef

define compile_cxx_file
  @cmd="$(CXX) $(CXX_FLAGS) -MMD -MP -c $< -o $@" ; \
  if test ! "$(BUILD_VERBOSE)" -eq 1; then \
    echo "Compiling $(BUILD_OUTPUT_DIRECTORY)/$<"; \
  else \
    echo "$$cmd"; \
  fi; \
  $$cmd
endef

build-directories:
	$(create_build_directories)

clean:
	@rm -f $(BUILD_CLEANUP_FILES)

$(BUILD_OUTPUT_DIRECTORY)/%.o: %.cpp
	@$(compile_cxx_file)

