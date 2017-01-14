# vala-benchmarks
# fasta plain-C bench makefile

include ../../Make.header
include ../info.txt

all: clean build test bench

test: build
	./fasta $(NTEST) > $(FILE)
	@if ! cmp $(FILE) ../$(FILE); then \
	echo ">> fasta plain-C: Failed"; exit 1; \
	fi

bench: build test
	$(TIME) --output=fasta-plain-C-time.csv \
		./fasta $(NBENCH) > /dev/null
	$(MEMORY) --output=fasta-plain-C-mem.csv \
		./fasta $(NBENCH) > /dev/null
	$(STRIP) ./fasta
	gzip -c ./fasta |wc -c > fasta-plain-C-size.csv

build:
	$(GCC) $(GCCOPTS) fasta.c -o fasta

clean:
	rm -fr *~ fasta $(FILE) *.csv

