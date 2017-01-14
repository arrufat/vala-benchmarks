# vala-benchmarks
# recursive mono bench makefile

include ../../Make.header
include ../info.txt

all: clean build test bench

test: build
	$(MONORUN) recursive.exe $(NTEST) > $(FILE)
	@if ! cmp $(FILE) ../$(FILE); then \
	echo ">> recursive mono: Failed"; exit 1; \
	fi

bench: build test
	$(TIME) --output=recursive-mono-time.csv \
		$(MONORUN) recursive.exe $(NBENCH) > /dev/null
	$(MEMORY) --output=recursive-mono-mem.csv \
		$(MONORUN) recursive.exe $(NBENCH) > /dev/null
	gzip -c recursive.exe |wc -c > recursive-mono-size.csv
	
build:
	$(MONOC) $(MONOCOPTS) recursive.cs
#Ahead of time mode
	$(MONORUN) $(MONORUNOPTS) recursive.exe > /dev/null

clean:
	rm -fr *~ recursive.exe *.so $(FILE) *.csv

