#sudo apt-get install zlib1g-dev

SRC = src
BUILD = build
PREFIX = /usr/local
INSTALLDIR = $(PREFIX)/bin

$(shell mkdir -p $(BUILD))

default: all

all: osmconvert osmfilter

osmconvert: $(SRC)/osmconvert.c
	cc -static $(SRC)/osmconvert.c -o $(BUILD)/osmconvert -lz -O3 

osmfilter: $(SRC)/osmfilter.c
	cc -static $(SRC)/osmfilter.c -o $(BUILD)/osmfilter -O3 

clean:
	-rm -rf $(BUILD)

install:
	install -m755 $(BUILD)/osmconvert $(INSTALLDIR)/
	install -m755 $(BUILD)/osmfilter $(INSTALLDIR)/

uninstall:
	-rm $(INSTALLDIR)/osmconvert
	-rm $(INSTALLDIR)/osmfilter
