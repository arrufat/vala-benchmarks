# vala-benchmarks
# nBody mono bench makefile

include ../../Make.header
include ../info.txt

all: clean build test bench

test: build
	$(MONORUN) nbody.exe $(NTEST) > $(FILE)
	@if ! cmp $(FILE) ../$(FILE); then \
	echo ">> nBody mono: Failed"; exit 1; \
	fi

bench: build test
	$(TIME) --output=nbody-mono-time.csv \
		$(MONORUN) nbody.exe $(NBENCH) > /dev/null
	$(MEMORY) --output=nbody-mono-mem.csv \
		$(MONORUN) nbody.exe $(NBENCH) > /dev/null
	gzip -c nbody.exe |wc -c > nbody-mono-size.csv
	
build:
	$(MONOC) $(MONOCOPTS) nbody.cs
#Ahead of time mode
	$(MONORUN) $(MONORUNOPTS) nbody.exe > /dev/null

clean:
	rm -fr *~ nbody.exe *.so $(FILE) *.csv

