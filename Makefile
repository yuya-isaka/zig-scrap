# Makefile for a Zig project with command-line source file and tests

# Compiler
ZIG = zig

# Source and build settings
EXE = $(notdir $(basename $(firstword $(MAKECMDGOALS))))

# Build rules
.PHONY: clean test-%

%:
	$(ZIG) run src/$@.zig

test-%:
	$(ZIG) test src/$*.zig

clean:
	rm -rf $(OUT)
