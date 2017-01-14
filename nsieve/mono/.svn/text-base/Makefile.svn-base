# vala-benchmarks
# nsieve mono bench makefile

include ../../Make.header
include ../info.txt

all: clean build test bench

test: build
	$(MONORUN) nsieve.exe $(NTEST) > $(FILE)
	@if ! cmp $(FILE) ../$(FILE); then \
	echo ">> nsieve mono: Failed"; exit 1; \
	fi

bench: build test
	$(TIME) --output=nsieve-mono-time.csv \
		$(MONORUN) nsieve.exe $(NBENCH) > /dev/null
	$(MEMORY) --output=nsieve-mono-mem.csv \
		$(MONORUN) nsieve.exe $(NBENCH) > /dev/null
	gzip -c nsieve.exe |wc -c > nsieve-mono-size.csv
	
build:
	$(MONOC) $(MONOCOPTS) nsieve.cs
#Ahead of time mode
	$(MONORUN) $(MONORUNOPTS) nsieve.exe > /dev/null

clean:
	rm -fr *~ nsieve.exe *.so $(FILE) *.csv

