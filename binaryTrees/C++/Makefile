# vala-benchmarks
# binaryTrees C++ bench makefile

include ../../Make.header
include ../info.txt

all: clean build test bench

test: build
	./binarytrees $(NTEST) > $(FILE)
	@if ! cmp $(FILE) ../$(FILE); then \
	echo ">> binaryTrees C++: Failed"; exit 1; \
	fi

bench: build test
	$(TIME) --output=binarytrees-C++-time.csv \
		./binarytrees $(NBENCH) > /dev/null
	$(MEMORY) --output=binarytrees-C++-mem.csv \
		./binarytrees $(NBENCH) > /dev/null
	$(STRIP) ./binarytrees
	gzip -c ./binarytrees |wc -c > binarytrees-C++-size.csv

build:
	$(GPP) $(GPPOPTS) binarytrees.cpp -o binarytrees

clean:
	rm -fr *~ binarytrees $(FILE) *.csv *.diff

