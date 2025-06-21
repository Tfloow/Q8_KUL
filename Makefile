# go over each folder and compile the markdown into pdf with pandoc

compile : all

SUBDIRS = $(wildcard */.)
LAST_COMMIT_MESSAGE = $(git log -1 --pretty=%B)
pandoc_run = $(docker run --rm --volume "$(pwd):/data" pandoc/extra)

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
		cd $$VAL; docker run --rm --volume "$$PWD:/data" pandoc/extra summary.md -o $$VAL.pdf --template eisvogel --listings --number-sections;\
		if [ $$? -ne 0 ]; then \
			echo "[LOG]: $$VAL	X"; \
			exit 1; \
		fi; \
		echo "[LOG]: $$VAL	V"; \
		cp $$VAL.pdf ../; \
		rm -f $$VAL.pdf; \
		cd ..; \
	done
	zip -r summaries.zip *.pdf

create_summary :
# takes course name and author name as arguments
	@echo "Creating summary files..."
	mkdir $(DIR)
	cp template/summary.md $(DIR)/summary.md
	sed -i "s/TITLE NAME/$(TITLE)/g" $(DIR)/summary.md
	sed -i "s/AUTHOR/$(AUTHOR)/g" $(DIR)/summary.md

clean :
	for i in $(SUBDIRS); do \
		$(MAKE) -C $$i clean; \
	done

