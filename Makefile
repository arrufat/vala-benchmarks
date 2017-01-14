# vala-benchmarks Makefile

include Make.header

TARGETS := build test bench clean
BENCH_LANG_DIR := $(foreach bench, $(BENCHS), $(foreach lang, $(LANGS), $(bench)/$(lang)))

BENCH_LANG_TEST := $(addsuffix _test, $(BENCH_LANG_DIR))
BENCH_LANG_BUILD := $(addsuffix _build, $(BENCH_LANG_DIR))
BENCH_LANG_BENCH := $(addsuffix _bench, $(BENCH_LANG_DIR))
BENCH_LANG_CLEAN := $(addsuffix _clean, $(BENCH_LANG_DIR))


all: $(TARGETS)

test: $(BENCH_LANG_TEST)
	@echo ">> All tests passed successfully"

build: $(BENCH_LANG_BUILD)
	
bench: $(BENCH_LANG_BENCH)
	$(SH) ./bench.sh $(BENCHS)

clean: $(BENCH_LANG_CLEAN)
#	rm -fr *.csv
	rm -fr `find . -iname "*~"`

#
# Rules to go to sub-directories
#

$(BENCH_LANG_TEST):
	$(MAKE) -C $(@:%_test=%) test

$(BENCH_LANG_BUILD):
	$(MAKE) -C $(@:%_build=%) build

$(BENCH_LANG_BENCH):
	$(MAKE) -C $(@:%_bench=%) bench

$(BENCH_LANG_CLEAN):
	$(MAKE) -C $(@:%_clean=%) clean

