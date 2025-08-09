# Spiel im Master Boot Record (MBR) programmieren

## Überblick

Der Master Boot Record (MBR) ist der erste Sektor einer Festplatte (512 Bytes) und enthält den Bootloader-Code, der vom BIOS geladen wird. Ein einfaches Spiel im MBR zu programmieren ist eine herausfordernde, aber spannende Aufgabe, da nur sehr wenig Speicher und Ressourcen zur Verfügung stehen.

---

## Voraussetzungen

- Kenntnisse in x86-Assembler (16-Bit Real Mode)
- Grundverständnis von BIOS-Interrupts
- Entwicklungsumgebung mit Assembler (z.B. NASM)
- Möglichkeit, binäre Dateien auf bootfähige Medien (z.B. USB-Stick oder virtuelle Maschine) zu schreiben
- Emulator (z.B. QEMU, Bochs) zum Testen

---

## Schritt-für-Schritt Übersicht

### 1. Grundstruktur des MBR erstellen

- MBR ist 512 Bytes groß
- Letzte 2 Bytes müssen die Signatur `0x55 0xAA` sein
- Bootloader-Code startet bei Adresse `0x7C00`

### 2. Setup des Bootloaders

- Setup des Segment-Registers (z.B. `DS`, `ES`)
- Initialisierung des Stacks
- Ausgabe von Text auf den Bildschirm (z.B. "Hello World" oder Spielmenü) via BIOS-Interrupt `INT 0x10`

### 3. Eingabe verarbeiten

- Lesen von Tastatureingaben mit BIOS-Interrupt `INT 0x16`
- Einfache Steuerung (z.B. Pfeiltasten, Buchstaben)

### 4. Spiel-Logik implementieren

- Beispiel: Einfaches Zahlenspiel, Snake, Pong oder Tetris in stark vereinfachter Form
- Status speichern in Registern oder im Speicherbereich um `0x7C00`
- Animation und Spiellogik mit Schleifen und Interrupts

### 5. Ausgabe auf Bildschirm

- Zeichnen von Spielfiguren mit BIOS-Interrupt `INT 0x10`
- Aktualisierung des Bildschirms je nach Spielstatus

### 6. Endlosschleife / Neustart

- Spiel läuft in einer Endlosschleife, wartet auf Eingaben
- Optional: Reset oder Neustart des Systems mit `INT 0x19`

---

## Tipps & Tricks

- MBR ist extrem begrenzt (nur 512 Bytes), also Code so klein wie möglich halten
- Nutze Makros und Inline-Comments für bessere Lesbarkeit im Assembler-Code
- Teste deinen Code zuerst im Emulator, bevor du auf echte Hardware gehst
- Vermeide komplexe Datenstrukturen — einfache Arrays und Bytes bevorzugen
- Nutze Stack und Register effizient, da Speicher knapp ist

---

## Beispiel-Tools

- **NASM** – Assembler zum Kompilieren des Codes
- **dd** (Linux) – zum Schreiben des binären MBR-Images auf ein Gerät
- **QEMU** oder **Bochs** – Emulatoren zum Testen

---

## Ressourcen

- [Ralf Brown’s Interrupt List](https://www.ctyme.com/rbrown.htm)
- [OSDev Wiki – Bootloader](https://wiki.osdev.org/Bootloader)
- [MBR Reverse Engineering Tutorials](https://wiki.osdev.org/MBR)
- Bücher zum Thema Assembler und x86-Programmierung

---

## Fazit

Ein Spiel im MBR zu programmieren ist eine spannende Challenge, die dir tiefes Verständnis für Hardware, BIOS und Low-Level-Programmierung vermittelt. Es erfordert viel Optimierung und Kreativität, kann aber sehr lehrreich sein!

---

