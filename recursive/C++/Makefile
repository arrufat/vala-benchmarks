# vala-benchmarks
# recursive C++ bench makefile

include ../../Make.header
include ../info.txt

all: clean build test bench

test: build
	./recursive $(NTEST) > $(FILE)
	@if ! cmp $(FILE) ../$(FILE); then \
	echo ">> recursive C++: Failed"; exit 1; \
	fi

bench: build test
	$(TIME) --output=recursive-C++-time.csv \
		./recursive $(NBENCH) > /dev/null
	$(MEMORY) --output=recursive-C++-mem.csv \
		./recursive $(NBENCH) > /dev/null
	$(STRIP) ./recursive
	gzip -c ./recursive |wc -c > recursive-C++-size.csv

build:
	$(GPP) $(GPPOPTS) recursive.cpp -o recursive

clean:
	rm -fr *~ recursive $(FILE) *.csv

