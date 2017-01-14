# vala-benchmarks
# fannkuch vala bench makefile

include ../../Make.header
include ../info.txt

all: clean build test bench

test: build
	./fannkuch $(NTEST) > $(FILE)
	@if ! cmp $(FILE) ../$(FILE); then \
	echo ">> fannkuch vala: Failed"; exit 1; \
	fi

bench: build test
	$(TIME) --output=fannkuch-vala-time.csv \
		./fannkuch $(NBENCH) > /dev/null
	$(MEMORY) --output=fannkuch-vala-mem.csv \
		./fannkuch $(NBENCH) > /dev/null
	$(STRIP) ./fannkuch
	gzip -c ./fannkuch |wc -c > fannkuch-vala-size.csv

build:
	$(VALAC) $(VALACOPTS) fannkuch.vala
	$(GCC) $(GCCOPTS) fannkuch.c -o fannkuch

clean:
	rm -fr *~ fannkuch.{c,h} fannkuch $(FILE) *.csv
