# Vectron VGA

Vectron VGA generates a 640x480@60Hz 3-bit color VGA signal and is designed to interface with the [Vectron 64](https://github.com/nickbild/vectron_64) 6502-CPU based breadboard computer.  It was built with 7400-series integrated circuits.

The interface can also be used by other devices such as Arduino microcontroller dev boards ([example here](https://github.com/nickbild/vectron_vga/tree/master/sram_vectron_simulator)).

The resolution is reduced to 160x120@60Hz, because anything higher just isn't retro enough for me.  :)  This also reduces the VRAM requirements and processing overhead of screen updates as an added benefit.

## How It Works

Frequency dividing flip flops reduce the 25.175 MHz clock four-fold to 6.29375 MHz.  This causes each pixel to be repeated 4 times on the horizontal axis.  Each vertical line is also repeated 4 times to reduce the resolution to 160x120, while still generating a standard 640x480 VGA signal.  The crystal oscillator and frequency divider are soldered onto perfboard -- I don't trust breadboards at that speed -- and the 6.29375 MHz signal is fed into the breadboards.

## Media

Circuit diagram:

![circuit_diagram](https://raw.githubusercontent.com/nickbild/vectron_vga/master/diagrams/circuit_diagram_bb_sm.jpg)

[Fritzing Download](https://github.com/nickbild/vectron_vga/raw/master/diagrams/circuit_diagram.fzz)

Prince of Persia title screen:

![prince_of_persia](https://raw.githubusercontent.com/nickbild/vectron_vga/master/media/prince_of_persia_sm.jpg)

Color bars test, showing all 8 glorious colors.

![prince_of_persia](https://raw.githubusercontent.com/nickbild/vectron_vga/master/media/color_bars_sm.jpg)

Full setup (Vectron 64 on the left):

![full_setup](https://raw.githubusercontent.com/nickbild/vectron_vga/master/media/full_setup_sm.jpg)

Vectron VGA:

![full_setup](https://raw.githubusercontent.com/nickbild/vectron_vga/master/media/vectron_vga_sm.jpg)

## Bill of Materials

- 9 x 2.2kΩ Resistor
- 3 x 357Ω Resistor
- 3 x 100Ω Resistor
- 1 x 220Ω Resistor
- 20 x SN74LS682N
- 12 x SN74LS244N
- 5 x SN74LS74AN
- 7 x SN74HCT32N
- 5 x SN74LS245N
- 8 x SN74LS161A
- 8 x SN74LS283N
- 9 x SN74LS273N
- 2 x SN74HCT374N
- 1 x SN74LS08N
- 3 x SN74LS04N
- 1 x CY7C199-55PC 32KB SRAM
- 1 x 25.175 MHz Crystal Oscillator
- 14 x Full size breadboards
- 3 x Half size breadboards
- 1 x Perfboard
- Sprinkle capacitors liberally
- Miscellaneous wires

## About the Author

[Nick A. Bild, MS](https://nickbild79.firebaseapp.com/#!/)
