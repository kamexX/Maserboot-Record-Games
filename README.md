# Programming a Game in the Master Boot Record (MBR)

## Overview

The Master Boot Record (MBR) is the first sector of a hard drive (512 bytes) and contains the bootloader code loaded by the BIOS. Programming a simple game in the MBR is a challenging but exciting task, as very little memory and resources are available.

---

## Requirements

- Knowledge of x86 assembly (16-bit real mode)
- Basic understanding of BIOS interrupts
- Development environment with assembler (e.g., NASM)
- Ability to write binary files to bootable media (e.g., USB stick or virtual machine)
- Emulator (e.g., QEMU, Bochs) for testing

---

## Step-by-Step Overview

### 1. Create the Basic Structure of the MBR

- MBR is 512 bytes in size  
- Last 2 bytes must be the signature `0x55 0xAA`  
- Bootloader code starts at address `0x7C00`  

### 2. Set Up the Bootloader

- Set up segment registers (e.g., `DS`, `ES`)  
- Initialize the stack  
- Output text to the screen (e.g., "Hello World" or game menu) via BIOS interrupt `INT 0x10`  

### 3. Handle Input

- Read keyboard input with BIOS interrupt `INT 0x16`  
- Simple controls (e.g., arrow keys, letters)  

### 4. Implement Game Logic

- Examples: simple number game, Snake, Pong, or Tetris in a heavily simplified form  
- Store state in registers or memory around `0x7C00`  
- Animation and game logic with loops and interrupts  

### 5. Output to Screen

- Draw game elements using BIOS interrupt `INT 0x10`  
- Update the screen based on game state  

### 6. Infinite Loop / Restart

- The game runs in an infinite loop, waiting for input  
- Optional: reset or reboot the system with `INT 0x19`  

---

## Tips & Tricks

- MBR is extremely limited (only 512 bytes), so keep code as small as possible  
- Use macros and inline comments for better readability in assembly code  
- Test your code first in an emulator before using real hardware  
- Avoid complex data structures — prefer simple arrays and bytes  
- Use stack and registers efficiently due to limited memory  

---

## Example Tools

- **NASM** – assembler to compile the code  
- **dd** (Linux) – to write the binary MBR image to a device  
- **QEMU** or **Bochs** – emulators for testing  

---

## Resources

- [Ralf Brown’s Interrupt List](https://www.ctyme.com/rbrown.htm)  
- [OSDev Wiki – Bootloader](https://wiki.osdev.org/Bootloader)  
- [MBR Reverse Engineering Tutorials](https://wiki.osdev.org/MBR)  
- Books on assembly and x86 programming  

---

## Conclusion

Programming a game in the MBR is an exciting challenge that gives you deep insight into hardware, BIOS, and low-level programming. It requires a lot of optimization and creativity but can be very educational!

---
