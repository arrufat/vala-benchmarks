# vala-benchmarks
# nBody C++ bench makefile

include ../../Make.header
include ../info.txt

all: clean build test bench

test: build
	./nbody $(NTEST) > $(FILE)
	@if ! cmp $(FILE) ../$(FILE); then \
	echo ">> nBody C++: Failed"; exit 1; \
	fi

bench: build test
	$(TIME) --output=nbody-C++-time.csv \
		./nbody $(NBENCH) > /dev/null
	$(MEMORY) --output=nbody-C++-mem.csv \
		./nbody $(NBENCH) > /dev/null
	$(STRIP) ./nbody
	gzip -c ./nbody |wc -c > nbody-C++-size.csv

build:
	$(GPP) $(GPPOPTS) nbody.cpp -o nbody

clean:
	rm -fr *~ nbody $(FILE) *.csv

