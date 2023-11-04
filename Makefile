# Makefile for a Zig project with command-line source file and tests

# Compiler
ZIG = zig

# Source and build settings
EXE = $(notdir $(basename $(firstword $(MAKECMDGOALS))))
BUILD_MODE = -O Debug

# Build rules
.PHONY: clean test-%

%:
	$(ZIG) run $(BUILD_MODE) src/$@.zig

test-%:
	$(ZIG) test #(BUILD_MODE) src/$*.zig

clean:
	rm -rf $(OUT)
