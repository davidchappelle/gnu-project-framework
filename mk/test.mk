ifeq ($(TOP_DIRECTORY),)
  $(error <test.mk> TOP_DIRECTORY must be defined)
endif

ifeq ($(TEST_SOURCES),)
  $(error <test.mk> TEST_SOURCES must be defined)
endif

ifeq ($(TEST_EXECUTABLES),)
  $(error <test.mk> TEST_EXECUTABLES must be defined)
endif

SOURCES=$(TEST_SOURCES)
EXECUTABLES=$(TEST_EXECUTABLES)

-include $(TOP_DIRECTORY)/mk/executable.mk

define run_tests
  +@tests='$(TEST_EXECUTABLES)'; \
  for test in $$tests; do \
    echo "Running test => $$test"; \
    $(BUILD_OUTPUT_DIRECTORY)/$$test; \
  done;
endef

test: all
	$(run_tests)

