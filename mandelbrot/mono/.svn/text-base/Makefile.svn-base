# vala-benchmarks
# mandelbrot mono bench makefile

include ../../Make.header
include ../info.txt

all: clean build test bench

test: build
	$(MONORUN) mandelbrot.exe $(NTEST) > $(FILE)
	@if ! cmp $(FILE) ../$(FILE); then \
	echo ">> mandelbrot mono: Failed"; exit 1; \
	fi

bench: build test
	$(TIME) --output=mandelbrot-mono-time.csv \
		$(MONORUN) mandelbrot.exe $(NBENCH) > /dev/null
	$(MEMORY) --output=mandelbrot-mono-mem.csv \
		$(MONORUN) mandelbrot.exe $(NBENCH) > /dev/null
	gzip -c mandelbrot.exe |wc -c > mandelbrot-mono-size.csv
	
build:
	$(MONOC) $(MONOCOPTS) mandelbrot.cs
#Ahead of time mode
	$(MONORUN) $(MONORUNOPTS) mandelbrot.exe > /dev/null

clean:
	rm -fr *~ mandelbrot.exe *.so $(FILE) *.csv

