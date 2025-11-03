CC:=clang
BUILD_DIR:=$(CURDIR)/build

.PHONY: all
all: lisp_parser 

$(BUILD_DIR):
	mkdir -p $@

.PHONY: main
main: $(BUILD_DIR)/main
$(BUILD_DIR)/main: $(CURDIR)/main.c | $(BUILD_DIR)
	$(CC) $(CURDIR)/main.c -o $@ -std=c99 -O2 -Weverything -Werror -Wno-unknown-warning-option -Wno-unsafe-buffer-usage -Wno-declaration-after-statement -Wno-unused-variable -Wno-unused-parameter -Wno-unused-macros -Wno-unused-function -Wno-covered-switch-default -Wno-padded -Wno-switch-enum -Wno-variadic-macro-arguments-omitted

.PHONY: lisp_parser
lisp_parser: $(BUILD_DIR)/lisp_parser
$(BUILD_DIR)/lisp_parser: $(CURDIR)/lisp_parser.c | $(BUILD_DIR)
	$(CC) $(CURDIR)/lisp_parser.c -o $@ -std=c99 -O2 -Weverything -Werror -Wno-unknown-warning-option -Wno-unsafe-buffer-usage -Wno-declaration-after-statement -Wno-unused-variable -Wno-unused-parameter -Wno-unused-macros -Wno-unused-function -Wno-covered-switch-default -Wno-padded -Wno-switch-enum -Wno-variadic-macro-arguments-omitted
