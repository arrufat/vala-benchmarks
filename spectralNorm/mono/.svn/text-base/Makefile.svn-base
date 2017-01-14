# vala-benchmarks
# spectralNorm mono bench makefile

include ../../Make.header
include ../info.txt

all: clean build test bench

test: build
	$(MONORUN) spectralnorm.exe $(NTEST) > $(FILE)
	@if ! cmp $(FILE) ../$(FILE); then \
	echo ">> spectralNorm mono: Failed"; exit 1; \
	fi

bench: build test
	$(TIME) --output=spectralnorm-mono-time.csv \
		$(MONORUN) spectralnorm.exe $(NBENCH) > /dev/null
	$(MEMORY) --output=spectralnorm-mono-mem.csv \
		$(MONORUN) spectralnorm.exe $(NBENCH) > /dev/null
	gzip -c spectralnorm.exe |wc -c > spectralnorm-mono-size.csv
	
build:
	$(MONOC) $(MONOCOPTS) spectralnorm.cs
#Ahead of time mode
	$(MONORUN) $(MONORUNOPTS) spectralnorm.exe > /dev/null

clean:
	rm -fr *~ spectralnorm.exe *.so $(FILE) *.csv

