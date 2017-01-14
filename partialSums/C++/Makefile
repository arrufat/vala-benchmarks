# vala-benchmarks
# partialSums C++ bench makefile

include ../../Make.header
include ../info.txt

all: clean build test bench

test: build
	./partialsums $(NTEST) > $(FILE)
	@if ! cmp $(FILE) ../$(FILE); then \
	echo ">> partialSums C++: Failed"; exit 1; \
	fi

bench: build test
	$(TIME) --output=partialSums-C++-time.csv \
                ./partialsums $(NBENCH) > /dev/null
	$(MEMORY) --output=partialSums-C++-mem.csv \
                ./partialsums $(NBENCH) > /dev/null
	$(STRIP) ./partialsums
	gzip -c ./partialsums |wc -c > partialsums-C++-size.csv


build:
	$(GPP) $(GPPOPTS) partialsums.cpp -o partialsums

clean:
	rm -fr *~ partialsums $(FILE) *.csv

