# vala-benchmarks
# recursive vala bench makefile

include ../../Make.header
include ../info.txt

all: clean build test bench

test: build
	./recursive $(NTEST) > $(FILE)
	@if ! cmp $(FILE) ../$(FILE); then \
	echo ">> recursive vala: Failed"; exit 1; \
	fi

bench: build test
	$(TIME) --output=recursive-vala-time.csv \
		./recursive $(NBENCH) > /dev/null
	$(MEMORY) --output=recursive-vala-mem.csv \
		./recursive $(NBENCH) > /dev/null
	$(STRIP) ./recursive
	gzip -c ./recursive |wc -c > recursive-vala-size.csv

build:
	$(VALAC) $(VALACOPTS) recursive.vala
	$(GCC) $(GCCOPTS) recursive.c -o recursive

clean:
	rm -fr *~ recursive.{c,h} recursive $(FILE) *.csv
