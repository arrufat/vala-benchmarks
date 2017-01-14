# vala-benchmarks
# nsieveBits mono bench makefile

include ../../Make.header
include ../info.txt

all: clean build test bench

test: build
	$(MONORUN) nsievebits.exe $(NTEST) > $(FILE)
	@if ! cmp $(FILE) ../$(FILE); then \
	echo ">> nsieveBits mono: Failed"; exit 1; \
	fi

bench: build test
	$(TIME) --output=nsievebits-mono-time.csv \
		$(MONORUN) nsievebits.exe $(NBENCH) > /dev/null
	$(MEMORY) --output=nsievebits-mono-mem.csv \
		$(MONORUN) nsievebits.exe $(NBENCH) > /dev/null
	gzip -c nsievebits.exe |wc -c > nsievebits-mono-size.csv
	
build:
	$(MONOC) $(MONOCOPTS) nsievebits.cs
#Ahead of time mode
	$(MONORUN) $(MONORUNOPTS) nsievebits.exe > /dev/null

clean:
	rm -fr *~ nsievebits.exe *.so $(FILE) *.csv

