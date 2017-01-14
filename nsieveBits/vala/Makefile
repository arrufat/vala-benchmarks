# vala-benchmarks
# nsievebits vala bench makefile

include ../../Make.header
include ../info.txt

all: clean build test bench

test: build
	./nsievebits $(NTEST) > $(FILE)
	@if ! cmp $(FILE) ../$(FILE); then \
	echo ">> nsieveBits vala: Failed"; exit 1; \
	fi

bench: build test
	$(TIME) --output=nsievebits-vala-time.csv \
		./nsievebits $(NBENCH) > /dev/null
	$(MEMORY) --output=nsievebits-vala-mem.csv \
		./nsievebits $(NBENCH) > /dev/null
	$(STRIP) ./nsievebits
	gzip -c ./nsievebits |wc -c > nsievebits-vala-size.csv

build:
	$(VALAC) $(VALACOPTS) nsievebits.vala
	$(GCC) $(GCCOPTS) nsievebits.c -o nsievebits

clean:
	rm -fr *~ nsievebits.{c,h} nsievebits $(FILE) *.csv
