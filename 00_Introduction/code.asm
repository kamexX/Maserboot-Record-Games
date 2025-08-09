; minimal_mbr.asm
; Einfaches MBR "Spiel" - zeigt "Press any key to start" und wartet auf Tastendruck
; Größe: 512 Bytes mit Boot-Signatur 0x55 0xAA am Ende

BITS 16
ORG 0x7C00

start:
    cli                     ; Interrupts ausschalten
    xor ax, ax
    mov ds, ax              ; Segmentregister setzen
    mov es, ax
    mov ss, ax
    mov sp, 0x7C00          ; Stackpointer setzen
    sti                     ; Interrupts einschalten

    ; Bildschirm löschen (BIOS INT 10h Funktion 0x06)
    mov ah, 0x06
    mov al, 0
    mov bh, 0x07            ; Seitenfarbe
    mov cx, 0               ; Obere linke Ecke
    mov dx, 0x184F          ; Untere rechte Ecke (80x25)
    int 0x10

    ; Text ausgeben "Press any key to start"
    mov si, msg
.print_char:
    lodsb                   ; nächstes Byte aus SI in AL laden
    cmp al, 0
    je .wait_key            ; bei 0 (String-Ende) weiter
    mov ah, 0x0E            ; Teletype-Ausgabe BIOS
    mov bh, 0
    mov bl, 7               ; Textfarbe
    int 0x10
    jmp .print_char

.wait_key:
    ; Auf Tastendruck warten
    mov ah, 0
    int 0x16

    ; Nach Tastendruck zurück zum Anfang (Endlosschleife)
    jmp start

msg db 'Press any key to start', 0

times 510-($-$$) db 0     ; Rest mit 0 auffüllen
dw 0xAA55                 ; Boot-Signatur
