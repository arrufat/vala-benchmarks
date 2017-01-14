# vala-benchmarks
# nBody vala bench makefile

include ../../Make.header
include ../info.txt

all: clean build test bench

test: build
	./nbody $(NTEST) > $(FILE)
	@if ! cmp $(FILE) ../$(FILE); then \
	echo ">> nBody vala: Failed"; exit 1; \
	fi

bench: build test
	$(TIME) --output=nbody-vala-time.csv \
		./nbody $(NBENCH) > /dev/null
	$(MEMORY) --output=nbody-vala-mem.csv \
		./nbody $(NBENCH) > /dev/null
	$(STRIP) ./nbody
	gzip -c ./nbody |wc -c > nbody-vala-size.csv

build:
	$(VALAC) $(VALACOPTS) nbody.vala
	$(GCC) $(GCCOPTS) nbody.c -o nbody

clean:
	rm -fr *~ nbody.{c,h} nbody $(FILE) *.csv
