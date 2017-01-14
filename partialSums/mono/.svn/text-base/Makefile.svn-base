# vala-benchmarks
# partialSums mono bench makefile

include ../../Make.header
include ../info.txt

all: clean build test bench

test: build
	$(MONORUN) partialsums.exe $(NTEST) > $(FILE)
	@if ! cmp $(FILE) ../$(FILE); then \
	echo ">> partialSums mono: Failed"; exit 1; \
	fi

bench: build test
	$(TIME) --output=partialSums-mono-time.csv \
                $(MONORUN) partialsums.exe $(NBENCH) > /dev/null
	$(MEMORY) --output=partialSums-mono-mem.csv \
                $(MONORUN) partialsums.exe $(NBENCH) > /dev/null
	gzip -c partialsums.exe |wc -c > partialsums-mono-size.csv

build:
	$(MONOC) $(MONOCOPTS) partialsums.cs
#Ahead of time mode
	$(MONORUN) $(MONORUNOPTS) partialsums.exe > /dev/null

clean:
	rm -fr *~ partialsums.exe *.so $(FILE) *.csv

