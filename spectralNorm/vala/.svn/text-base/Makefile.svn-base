# vala-benchmarks
# spectralNorm vala bench makefile

include ../../Make.header
include ../info.txt

all: clean build test bench

test: build
	./spectralnorm $(NTEST) > $(FILE)
	@if ! cmp $(FILE) ../$(FILE); then \
	echo ">> spectralNorm vala: Failed"; exit 1; \
	fi

bench: build test
	$(TIME) --output=spectralnorm-vala-time.csv \
		./spectralnorm $(NBENCH) > /dev/null
	$(MEMORY) --output=spectralnorm-vala-mem.csv \
		./spectralnorm $(NBENCH) > /dev/null
	$(STRIP) ./spectralnorm
	gzip -c ./spectralnorm |wc -c > spectralnorm-vala-size.csv

build:
	$(VALAC) $(VALACOPTS) spectralnorm.vala
	$(GCC) $(GCCOPTS) spectralnorm.c -o spectralnorm

clean:
	rm -fr *~ spectralnorm.{c,h} spectralnorm $(FILE) *.csv
