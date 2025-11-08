CC:=clang
AS:=as
BUILD_DIR:=$(CURDIR)/build

.PHONY: all
all: 

$(BUILD_DIR):
	mkdir -p $@

.PHONY: asm
asm: $(BUILD_DIR)/asm
$(BUILD_DIR)/asm: asm.s | $(BUILD_DIR)
	gcc $^ -o $@

.PHONY: test
test: $(BUILD_DIR)/test
$(BUILD_DIR)/test: test.c asm.s | $(BUILD_DIR)
	gcc $^ -g -O0 -o $@
