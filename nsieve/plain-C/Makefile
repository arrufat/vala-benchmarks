# vala-benchmarks
# nsieve plain-C bench makefile

include ../../Make.header
include ../info.txt

all: clean build test bench

test: build
	./nsieve $(NTEST) > $(FILE)
	@if ! cmp $(FILE) ../$(FILE); then \
	echo ">> nsieve plain-C: Failed"; exit 1; \
	fi

bench: build test
	$(TIME) --output=nsieve-plain-C-time.csv \
		./nsieve $(NBENCH) > /dev/null
	$(MEMORY) --output=nsieve-plain-C-mem.csv \
		./nsieve $(NBENCH) > /dev/null
	$(STRIP) ./nsieve
	gzip -c ./nsieve |wc -c > nsieve-plain-C-size.csv

build:
	$(GCC) $(GCCOPTS) nsieve.c -o nsieve

clean:
	rm -fr *~ nsieve $(FILE) *.csv

