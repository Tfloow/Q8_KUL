# go over each folder and compile the markdown into pdf with pandoc

compile : all

SUBDIRS = $(wildcard */.)

all :
	for i in $(SUBDIRS); do \
		$(MAKE) -C $$i; \
	done
	cp */*.pdf .

clean :
	for i in $(SUBDIRS); do \
		$(MAKE) -C $$i clean; \
	done

