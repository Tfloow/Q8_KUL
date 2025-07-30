# go over each folder and compile the markdown into pdf with pandoc

compile : all_NEW

SUBDIRS = $(wildcard *)
LAST_COMMIT_MESSAGE = $(git log -1 --pretty=%B)
pandoc_run = $(docker run --rm --volume "$(pwd):/data" pandoc/extra)
PWD = $(shell pwd)

% : %/summary.md %/LICENSE.md
	@echo "Compiling $@"
	@cd $@; docker run --rm --volume "$(PWD)/$@:/data" pandoc/extra summary.md LICENSE.md -o initial_$@.pdf --template eisvogel --listings --number-sections
	@cd $@; gs -sDEVICE=pdfwrite \
	   -dCompatibilityLevel=1.4 \
	   -dPDFSETTINGS=/ebook \
	   -dNOPAUSE -dQUIET -dBATCH \
	   -sOutputFile=$@.pdf \
	   initial_$@.pdf
	@cp $@/$@.pdf . 
	@rm -f $@/initial_$@.pdf $@/$@.pdf
	@chmod 664 $@.pdf
	@echo "[LOG]: $@	V"

all_NEW : $(SUBDIRS)
	@echo "Finished compiling all summaries"

.PHONY: force_compile

force_compile :
	for i in $(SUBDIRS); do \
		VAL=$$(echo $$i | sed 's/\/.//'); \
		touch $$VAL/summary.md; \
	done

test:	
	@echo $(LAST_COMMIT_MESSAGE) Compiled
	@echo $(SUBDIRS)
	@for i in $(SUBDIRS); do \
		VAL=$$(echo $$i | sed 's/\/.//'); \
		echo "$$VAL"; \
	done

all :
# iterate over each subdirectory and use pandoc to create summary
	echo $(PWD)
	for i in $(SUBDIRS); do \
		VAL=$$(echo $$i | sed 's/\/.//'); \
		cd $$VAL; docker run --rm --volume "$$PWD:/data" pandoc/extra summary.md LICENSE.md -o $$VAL.pdf --template eisvogel --listings --number-sections;\
		gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/ebook -dNOPAUSE -dQUIET -dBATCH -sOutputFile=$$VAL.pdf $$VAL.pdf; \
		if [ $$? -ne 0 ]; then \
			echo "[LOG]: $$VAL	X"; \
			exit 1; \
		fi; \
		echo "[LOG]: $$VAL	V"; \
		cp $$VAL.pdf ../; \
		rm -f $$VAL.pdf; \
		cd ..; \
	done

zip :
	zip -r summaries.zip *.pdf


create_summary :
# takes course name and author name as arguments
	@echo "Creating summary files..."
	mkdir $(DIR)
	cp template/* $(DIR)
	sed -i "s/TITLE NAME/$(TITLE)/g" $(DIR)/summary.md
	sed -i "s/AUTHOR/$(AUTHOR)/g" $(DIR)/summary.md

clean :
	for i in $(SUBDIRS); do \
		rm -rf $$i.pdf; \
	done

.PHONY: clean compile

