SRC_DIR := src
OUT_DIR := out
SOURCES := $(wildcard $(SRC_DIR)/*.md)
OUTPUTS := $(patsubst $(SRC_DIR)/%.md,$(OUT_DIR)/%.html,$(SOURCES))

.PHONY: all check deps build test package clean ci help

all: test

$(OUT_DIR):
	mkdir -p $(OUT_DIR)

node_modules: package-lock.json
	npm ci
	@touch node_modules

deps: node_modules

$(OUT_DIR)/%.html: $(SRC_DIR)/%.md package-lock.json | $(OUT_DIR) node_modules
	@echo "  BUILD $< -> $@"
	@npm run --silent build -- $< $@

check:
	@test -d $(SRC_DIR) || { echo "ERROR: source directory missing"; exit 1; }
	@test -n "$(SOURCES)" || { echo "ERROR: no Markdown source files"; exit 1; }
	@echo "check: $(words $(SOURCES)) source file(s) in $(SRC_DIR)"

build: $(OUTPUTS)

test: build
	@npm test --silent

clean:
	rm -rf $(OUT_DIR) *.tgz

ci:
	$(MAKE) clean
	$(MAKE) deps
	$(MAKE) check
	$(MAKE) package

help:
	@echo "Targets: check deps build test clean ci"

package: test
	npm pack
