# vala-benchmarks
# spectralNorm C++ bench makefile

include ../../Make.header
include ../info.txt

all: clean build test bench

test: build
	./spectralnorm $(NTEST) > $(FILE)
	@if ! cmp $(FILE) ../$(FILE); then \
	echo ">> spectralNorm C++: Failed"; exit 1; \
	fi

bench: build test
	$(TIME) --output=spectralnorm-C++-time.csv \
		./spectralnorm $(NBENCH) > /dev/null
	$(MEMORY) --output=spectralnorm-C++-mem.csv \
		./spectralnorm $(NBENCH) > /dev/null
	$(STRIP) ./spectralnorm
	gzip -c ./spectralnorm |wc -c > spectralnorm-C++-size.csv

build:
	$(GPP) $(GPPOPTS) spectralnorm.cpp -o spectralnorm

clean:
	rm -fr *~ spectralnorm $(FILE) *.csv

