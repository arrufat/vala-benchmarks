# vala-benchmarks
# fannkuch C++ bench makefile

include ../../Make.header
include ../info.txt

all: clean build test bench

test: build
	./fannkuch $(NTEST) > $(FILE)
	@if ! cmp $(FILE) ../$(FILE); then \
	echo ">> fannkuch C++: Failed"; exit 1; \
	fi

bench: build test
	$(TIME) --output=fannkuch-C++-time.csv \
		./fannkuch $(NBENCH) > /dev/null
	$(MEMORY) --output=fannkuch-C++-mem.csv \
		./fannkuch $(NBENCH) > /dev/null
	$(STRIP) ./fannkuch
	gzip -c ./fannkuch |wc -c > fannkuch-C++-size.csv

build:
	$(GPP) $(GPPOPTS) fannkuch.cpp -o fannkuch

clean:
	rm -fr *~ fannkuch $(FILE) *.csv

