# vala-benchmarks
# mandelbrot C++ bench makefile

include ../../Make.header
include ../info.txt

all: clean build test bench

test: build
	./mandelbrot $(NTEST) > $(FILE)
	@if ! cmp $(FILE) ../$(FILE); then \
	echo ">> mandelbrot C++: Failed"; exit 1; \
	fi

bench: build test
	$(TIME) --output=mandelbrot-C++-time.csv \
		./mandelbrot $(NBENCH) > /dev/null
	$(MEMORY) --output=mandelbrot-C++-mem.csv \
		./mandelbrot $(NBENCH) > /dev/null
	$(STRIP) ./mandelbrot
	gzip -c ./mandelbrot |wc -c > mandelbrot-C++-size.csv

build:
	$(GPP) $(GPPOPTS) mandelbrot.cpp -o mandelbrot

clean:
	rm -fr *~ mandelbrot $(FILE) *.csv

