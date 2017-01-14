# vala-benchmarks
# fannkuch mono bench makefile

include ../../Make.header
include ../info.txt

all: clean build test bench

test: build
	$(MONORUN) fannkuch.exe $(NTEST) > $(FILE)
	@if ! cmp $(FILE) ../$(FILE); then \
	echo ">> fannkuch mono: Failed"; exit 1; \
	fi

bench: build test
	$(TIME) --output=fannkuch-mono-time.csv \
		$(MONORUN) fannkuch.exe $(NBENCH) > /dev/null
	gzip -c fannkuch.exe |wc -c > fannkuch-mono-size.csv
	$(MEMORY) --output=fannkuch-mono-mem.csv \
		$(MONORUN) fannkuch.exe $(NBENCH) > /dev/null
	
build:
	$(MONOC) $(MONOCOPTS) fannkuch.cs
#Ahead of time mode
	$(MONORUN) $(MONORUNOPTS) fannkuch.exe > /dev/null

clean:
	rm -fr *~ fannkuch.exe *.so $(FILE) *.csv

