# Makefile zum Kompilieren des MBR Bootloaders und Erzeugen eines Disk-Images

# Name der Assembler-Quelldatei (ohne Endung)
SRC = boot

# Output-Dateien
BIN = $(SRC).bin
IMG = $(SRC)_disk.img

# NASM zum Assemblieren
ASM = nasm

# Größe der Disk in Sektoren (1MB = 2048 Sektoren á 512 Bytes)
SECTORS = 2048

.PHONY: all clean run qemu

all: $(IMG)

$(BIN): $(SRC).asm
	$(ASM) -f bin $< -o $@

$(IMG): $(BIN)
	# 1. Lege 1MB Null-gefülltes Image an
	dd if=/dev/zero of=$@ bs=512 count=$(SECTORS)
	# 2. Schreibe den MBR (erste 512 Bytes) in das Image
	dd if=$(BIN) of=$@ bs=512 count=1 conv=notrunc

clean:
	rm -f $(BIN) $(IMG)

run: $(IMG)
	# Starte die VM in VirtualBox (hier musst du ggf. manuell anpassen)
	echo "Starte VirtualBox - bitte die VM mit $(IMG) als Festplatte konfigurieren."

qemu: $(IMG)
	# Starte QEMU mit dem erzeugten Image
	qemu-system-x86_64 -drive format=raw,file=$(IMG)
