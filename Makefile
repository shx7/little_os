AC=nasm
ACFLAGS=-f bin 
BIN_NAME=boot_sector.bin

all: 
	$(AC) main.asm $(ACFLAGS) -o $(BIN_NAME)

clean:
	rm $(BIN_NAME)
