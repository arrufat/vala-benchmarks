# vala-benchmarks
# nsieve C++ bench makefile

include ../../Make.header
include ../info.txt

all: clean build test bench

test: build
	./nsieve $(NTEST) > $(FILE)
	@if ! cmp $(FILE) ../$(FILE); then \
	echo ">> nsieve C++: Failed"; exit 1; \
	fi

bench: build test
	$(TIME) --output=nsieve-C++-time.csv \
		./nsieve $(NBENCH) > /dev/null
	$(MEMORY) --output=nsieve-C++-mem.csv \
		./nsieve $(NBENCH) > /dev/null
	$(STRIP) ./nsieve
	gzip -c ./nsieve |wc -c > nsieve-C++-size.csv

build:
	$(GPP) $(GPPOPTS) nsieve.cpp -o nsieve

clean:
	rm -fr *~ nsieve $(FILE) *.csv

