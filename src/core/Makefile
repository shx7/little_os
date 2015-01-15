AC=nasm
ACFLAGS=-f bin -i $(SRC_DIRS)
SRC_DIRS=../print/ 
BIN_NAME=../../build/boot_sector.bin

all: 
	$(AC) main.asm $(ACFLAGS) -o $(BIN_NAME) 

run:
	cd ../../build && ./run.sh

clean:
	rm $(BIN_NAME)
