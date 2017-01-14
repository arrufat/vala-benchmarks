# vala-benchmarks
# fasta C++ bench makefile

include ../../Make.header
include ../info.txt

all: clean build test bench

test: build
	./fasta $(NTEST) > $(FILE)
	@if ! cmp $(FILE) ../$(FILE); then \
	echo ">> fasta C++: Failed"; exit 1; \
	fi

bench: build test
	$(TIME) --output=fasta-C++-time.csv \
		./fasta $(NBENCH) > /dev/null
	$(MEMORY) --output=fasta-C++-mem.csv \
		./fasta $(NBENCH) > /dev/null
	$(STRIP) ./fasta
	gzip -c ./fasta |wc -c > fasta-C++-size.csv

build:
	$(GPP) $(GPPOPTS) fasta.cpp -o fasta

clean:
	rm -fr *~ fasta $(FILE) *.csv

