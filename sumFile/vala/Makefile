# vala-benchmarks
# sumFile vala bench makefile

include ../../Make.header
include ../info.txt

all: clean build test bench

test: build
	./sumcol <../$(INTESTFILE) > $(OUTFILE)
	@if ! cmp $(OUTFILE) ../$(OUTFILE); then \
	echo ">> sumFile vala: Failed"; exit 1; \
	fi

bench: build test
	gzip -cd ../$(GZINFILE) > ../$(INFILE)
	$(TIME) --output=sumFile-vala-time.csv \
		./sumcol <../$(INFILE) > /dev/null
	$(MEMORY) --output=sumFile-vala-mem.csv \
		./sumcol <../$(INFILE) > /dev/null
	$(STRIP) ./sumcol
	gzip -c ./sumcol |wc -c > sumFile-vala-size.csv

build:
	$(VALAC) $(VALACOPTS) sumcol.vala
	$(GCC) $(GCCOPTS) sumcol.c -o sumcol

clean:
	rm -fr *~ sumcol sumcol.{c,h} $(OUTFILE) *.csv ../$(INFILE)

