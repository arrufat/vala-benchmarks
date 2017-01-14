# vala-benchmarks
# partialSums plain-C bench makefile

include ../../Make.header
include ../info.txt

all: clean build test bench

test: build
	./partialsums $(NTEST) > $(FILE)
	@if ! cmp $(FILE) ../$(FILE); then \
	echo ">> partialSums plain-C: Failed"; exit 1; \
	fi

bench: build test
	$(TIME) --output=partialSums-plain-C-time.csv \
                ./partialsums $(NBENCH) > /dev/null
	$(MEMORY) --output=partialSums-plain-C-mem.csv \
                ./partialsums $(NBENCH) > /dev/null
	$(STRIP) ./partialsums
	gzip -c ./partialsums |wc -c > partialsums-plain-C-size.csv


build:
	$(GCC) $(GCCOPTS) partialsums.c -o partialsums

clean:
	rm -fr *~ partialsums $(FILE) *.csv

