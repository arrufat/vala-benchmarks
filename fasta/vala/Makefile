# vala-benchmarks
# fasta vala bench makefile

include ../../Make.header
include ../info.txt

all: clean build test bench

test: build
	./fasta $(NTEST) > $(FILE)
	@if ! cmp $(FILE) ../$(FILE); then \
	echo ">> fasta vala: Failed"; exit 1; \
	fi

bench: build test
	$(TIME) --output=fasta-vala-time.csv \
		./fasta $(NBENCH) > /dev/null
	$(MEMORY) --output=fasta-vala-mem.csv \
		./fasta $(NBENCH) > /dev/null
	$(STRIP) ./fasta
	gzip -c ./fasta |wc -c > fasta-vala-size.csv

build:
	$(VALAC) $(VALACOPTS) fasta.vala
	$(GCC) $(GCCOPTS) fasta.c -o fasta

clean:
	rm -fr *~ fasta.{c,h} fasta $(FILE) *.csv
