# vala-benchmarks
# recursive plain-C bench makefile

include ../../Make.header
include ../info.txt

all: clean build test bench

test: build
	./recursive $(NTEST) > $(FILE)
	@if ! cmp $(FILE) ../$(FILE); then \
	echo ">> recursive plain-C: Failed"; exit 1; \
	fi

bench: build test
	$(TIME) --output=recursive-plain-C-time.csv \
		./recursive $(NBENCH) > /dev/null
	$(MEMORY) --output=recursive-plain-C-mem.csv \
		./recursive $(NBENCH) > /dev/null
	$(STRIP) ./recursive
	gzip -c ./recursive |wc -c > recursive-plain-C-size.csv

build:
	$(GCC) $(GCCOPTS) recursive.c -o recursive

clean:
	rm -fr *~ recursive $(FILE) *.csv

