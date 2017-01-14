# vala-benchmarks
# binaryTrees mono bench makefile

include ../../Make.header
include ../info.txt

all: clean build test bench

test: build
	$(MONORUN) binarytrees.exe $(NTEST) > $(FILE)
	@if ! cmp $(FILE) ../$(FILE); then \
	echo ">> binaryTrees mono: Failed"; exit 1; \
	fi

bench: build test
	$(TIME) --output=binarytrees-mono-time.csv \
		$(MONORUN) binarytrees.exe $(NBENCH) > /dev/null
	$(MEMORY) --output=binarytrees-mono-mem.csv \
		$(MONORUN) binarytrees.exe $(NBENCH) > /dev/null
	gzip -c binarytrees.exe |wc -c > binarytrees-mono-size.csv
	
build:
	$(MONOC) $(MONOCOPTS) binarytrees.cs
#Ahead of time mode
	$(MONORUN) $(MONORUNOPTS) binarytrees.exe > /dev/null

clean:
	rm -fr *~ binarytrees.exe *.so $(FILE) *.csv

