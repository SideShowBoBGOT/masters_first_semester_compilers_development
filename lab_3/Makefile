CC:=clang
AS:=as
BUILD_DIR:=$(CURDIR)/build

.PHONY: all
all: 

$(BUILD_DIR):
	mkdir -p $@

.PHONY: test
test: $(BUILD_DIR)/test
$(BUILD_DIR)/test: test.c asm.s | $(BUILD_DIR)
	gcc $^ -g -O0 -o $@

.PHONY: example
example: $(BUILD_DIR)/example
$(BUILD_DIR)/example: example.c example.s | $(BUILD_DIR)
	gcc $^ -g -O0 -o $@
