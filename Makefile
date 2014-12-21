SUB_DIRS=src

.PHONY: src

all:
	$(MAKE) -C $(SUB_DIRS)

run:
	cd build && ./run.sh

clean:
	rm build/*.bin
