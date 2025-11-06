CC:=clang
BUILD_DIR:=$(CURDIR)/build

.PHONY: all
all: main 

$(BUILD_DIR):
	mkdir -p $@

.PHONY: main
main: $(BUILD_DIR)/main
$(BUILD_DIR)/main: $(CURDIR)/main.c | $(BUILD_DIR)
	$(CC) $(CURDIR)/main.c -o $@ -std=c99 -O2 -Weverything -Werror -Wno-unknown-warning-option -Wno-unsafe-buffer-usage -Wno-declaration-after-statement -Wno-unused-variable -Wno-unused-parameter -Wno-unused-macros -Wno-unused-function -Wno-covered-switch-default -Wno-padded -Wno-switch-enum -Wno-variadic-macro-arguments-omitted -Wno-unused-but-set-variable -Wno-unused-value -Wno-implicit-void-ptr-cast -Wno-c23-extensions

.PHONY: test
test: $(BUILD_DIR)/test
$(BUILD_DIR)/test: $(CURDIR)/test.c $(CURDIR)/asm.s | $(BUILD_DIR)
	$(CC) $(CURDIR)/test.c asm.s -o $@ -std=c99 -O2 -Weverything -Werror -Wno-unknown-warning-option -Wno-unsafe-buffer-usage -Wno-declaration-after-statement -Wno-unused-variable -Wno-unused-parameter -Wno-unused-macros -Wno-unused-function -Wno-covered-switch-default -Wno-padded -Wno-switch-enum -Wno-variadic-macro-arguments-omitted -Wno-unused-but-set-variable -Wno-unused-value -Wno-implicit-void-ptr-cast -Wno-c23-extensions
