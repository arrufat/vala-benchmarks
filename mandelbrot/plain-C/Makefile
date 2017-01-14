# vala-benchmarks
# mandelbrot plain-C bench makefile

include ../../Make.header
include ../info.txt

all: clean build test bench

test: build
	./mandelbrot $(NTEST) > $(FILE)
	@if ! cmp $(FILE) ../$(FILE); then \
	echo ">> mandelbrot plain-C: Failed"; exit 1; \
	fi

bench: build test
	$(TIME) --output=mandelbrot-plain-C-time.csv \
		./mandelbrot $(NBENCH) > /dev/null
	$(MEMORY) --output=mandelbrot-plain-C-mem.csv \
		./mandelbrot $(NBENCH) > /dev/null
	$(STRIP) ./mandelbrot
	gzip -c ./mandelbrot |wc -c > mandelbrot-plain-C-size.csv

build:
	$(GCC) $(GCCOPTS) mandelbrot.c -o mandelbrot

clean:
	rm -fr *~ mandelbrot $(FILE) *.csv

