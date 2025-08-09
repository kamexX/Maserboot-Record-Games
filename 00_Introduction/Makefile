# Makefile with filename parameter and automatic QEMU start

ASM = nasm
ASM_FLAGS = -f bin

SRC ?= code.asm
BIN ?= $(SRC:.asm=.bin)

QEMU = qemu-system-x86_64
QEMU_FLAGS = -drive format=raw,file=$(BIN)

all: $(BIN) run

$(BIN): $(SRC)
	$(ASM) $(ASM_FLAGS) $< -o $@

run: $(BIN)
	$(QEMU) $(QEMU_FLAGS)

clean:
	rm -f $(BIN)

.PHONY: all clean run
