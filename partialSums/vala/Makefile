# vala-benchmarks
# partialSums vala bench makefile

include ../../Make.header
include ../info.txt

all: clean build test bench

test: build
	./partialsums $(NTEST) > $(FILE)
	@if ! cmp $(FILE) ../$(FILE); then \
	echo ">> partialSums vala: Failed"; exit 1; \
	fi

bench: build test
	$(TIME) --output=partialSums-vala-time.csv \
                ./partialsums $(NBENCH) > /dev/null
	$(MEMORY) --output=partialSums-vala-mem.csv \
                ./partialsums $(NBENCH) > /dev/null
	$(STRIP) ./partialsums
	gzip -c ./partialsums |wc -c > partialsums-vala-size.csv

build:
	$(VALAC) $(VALACOPTS) partialsums.vala	
	$(GCC) $(GCCOPTS) partialsums.c -o partialsums
	
clean:
	rm -fr *~ partialsums.{c,h} partialsums $(FILE) *.csv

