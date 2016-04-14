#sudo apt-get install zlib1g-dev

SRC = src
BUILD = build
PREFIX = /usr/local
INSTALLDIR = $(PREFIX)/bin

$(shell mkdir -p $(BUILD))

default: osmconvert

osmconvert: $(SRC)/osmconvert.c
	cc -static $(SRC)/osmconvert.c -o $(BUILD)/osmconvert -lz -O3 

clean:
	-rm -rf $(BUILD)

install:
	install -m755 $(BUILD)/osmconvert $(INSTALLDIR)/	

uninstall:
	-rm $(INSTALLDIR)/osmconvert
