# vala-benchmarks
# fannkuch plain-C bench makefile

include ../../Make.header
include ../info.txt

all: clean build test bench

test: build
	./fannkuch $(NTEST) > $(FILE)
	@if ! cmp $(FILE) ../$(FILE); then \
	echo ">> fannkuch plain-C: Failed"; exit 1; \
	fi

bench: build test
	$(TIME) --output=fannkuch-plain-C-time.csv \
		./fannkuch $(NBENCH) > /dev/null
	$(MEMORY) --output=fannkuch-plain-C-mem.csv \
		./fannkuch $(NBENCH) > /dev/null
	$(STRIP) ./fannkuch
	gzip -c ./fannkuch |wc -c > fannkuch-plain-C-size.csv

build:
	$(GCC) $(GCCOPTS) fannkuch.c -o fannkuch

clean:
	rm -fr *~ fannkuch $(FILE) *.csv

