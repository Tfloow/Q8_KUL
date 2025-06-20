# go over each folder and compile the markdown into pdf with pandoc

compile : all

SUBDIRS = $(wildcard */.)

test:
	@echo $(SUBDIRS)
	@for i in $(SUBDIRS); do \
		VAL=$$(echo $$i | sed 's/\/.//'); \
		echo "$$VAL"; \
	done
all :
# iterate over each subdirectory and use pandoc to create summary
	for i in $(SUBDIRS); do \
		VAL=$$(echo $$i | sed 's/\/.//'); \
		echo "Processing $$VAL..."; \
		cd $$VAL; pandoc -s -o $$VAL.pdf summary.md; cd ..;\
		echo "Created $$VAL.pdf"; \
	done
	cp */*.pdf .

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

