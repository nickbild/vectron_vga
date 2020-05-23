;;;;
; Display image on Vectron 64 VGA generator.
; Nick Bild - nick.bild@gmail.com
; https://github.com/nickbild/vectron_vga
;
; Reserved memory:
;
; $0002 - 16-bit counter low bits.
; $0003 - 16-bit counter high bits.
;
; $0005 - VRAM data clock.
; $0006 - VRAM lower address clock.
; $0007 - VRAM upper address clock.
; $00F8 - VGA mode - program or display.
; $00F9 - VRAM write enable (WE) pin.
;
; $0100-$01FF - 6502 stack
;
; $FFFA - NMI IRQ Vector
; $FFFB - NMI IRQ Vector
; $FFFC - Reset Vector - Stores start address of this ROM.
; $FFFD - Reset Vector
; $FFFE - IRQ Vector - Keyboard ISR address.
; $FFFF - IRQ Vector
;;;;

		processor 6502

    ; Named variables in RAM.
    		ORG $0002

CounterLow
		.byte #$00
CounterHigh
		.byte #$00

; Start at beginning of ROM.
StartExe	ORG $8000
    ; Initialize counter.
    lda #$A0
    sta CounterLow
    lda #$00
    sta CounterHigh

    ; Set VGA generator to "program" mode.
    lda #$01
    sta $00F8

    ;;;;
    ;; Load data to VRAM.
    ;;;;

LoadMemory1
    lda CounterLow
    sta $0006 ; Clock lower address.
    lda CounterHigh
    sta $0007 ; Clock upper address.
    lda #$01
    sta $0005 ; Clock data.
    lda $00F9 ; Pulse WE.

    ; 16 bit counter increment.
    inc CounterLow
    bne skipHighInc1
    inc CounterHigh
skipHighInc1

    lda CounterHigh
    cmp #$05  ; Next 8 lines (1280 pixels).
    bne LoadMemory1

LoadMemory2
    lda CounterLow
    sta $0006 ; Clock lower address.
    lda CounterHigh
    sta $0007 ; Clock upper address.
    lda #$02
    sta $0005 ; Clock data.
    lda $00F9 ; Pulse WE.

    ; 16 bit counter increment.
    inc CounterLow
    bne skipHighInc2
    inc CounterHigh
skipHighInc2

    lda CounterHigh
    cmp #$0A  ; Next 8 lines (1280 pixels).
    bne LoadMemory2

LoadMemory3
    lda CounterLow
    sta $0006 ; Clock lower address.
    lda CounterHigh
    sta $0007 ; Clock upper address.
    lda #$03
    sta $0005 ; Clock data.
    lda $00F9 ; Pulse WE.

    ; 16 bit counter increment.
    inc CounterLow
    bne skipHighInc3
    inc CounterHigh
skipHighInc3

    lda CounterHigh
    cmp #$0F  ; Next 8 lines (1280 pixels).
    bne LoadMemory3

LoadMemory4
    lda CounterLow
    sta $0006 ; Clock lower address.
    lda CounterHigh
    sta $0007 ; Clock upper address.
    lda #$04
    sta $0005 ; Clock data.
    lda $00F9 ; Pulse WE.

    ; 16 bit counter increment.
    inc CounterLow
    bne skipHighInc4
    inc CounterHigh
skipHighInc4

    lda CounterHigh
    cmp #$14  ; Next 8 lines (1280 pixels).
    bne LoadMemory4

LoadMemory5
    lda CounterLow
    sta $0006 ; Clock lower address.
    lda CounterHigh
    sta $0007 ; Clock upper address.
    lda #$05
    sta $0005 ; Clock data.
    lda $00F9 ; Pulse WE.

    ; 16 bit counter increment.
    inc CounterLow
    bne skipHighInc5
    inc CounterHigh
skipHighInc5

    lda CounterHigh
    cmp #$19  ; Next 8 lines (1280 pixels).
    bne LoadMemory5

LoadMemory6
    lda CounterLow
    sta $0006 ; Clock lower address.
    lda CounterHigh
    sta $0007 ; Clock upper address.
    lda #$06
    sta $0005 ; Clock data.
    lda $00F9 ; Pulse WE.

    ; 16 bit counter increment.
    inc CounterLow
    bne skipHighInc6
    inc CounterHigh
skipHighInc6

    lda CounterHigh
    cmp #$1E  ; Next 8 lines (1280 pixels).
    bne LoadMemory6

LoadMemory7
    lda CounterLow
    sta $0006 ; Clock lower address.
    lda CounterHigh
    sta $0007 ; Clock upper address.
    lda #$07
    sta $0005 ; Clock data.
    lda $00F9 ; Pulse WE.

    ; 16 bit counter increment.
    inc CounterLow
    bne skipHighInc7
    inc CounterHigh
skipHighInc7

    lda CounterHigh
    cmp #$23  ; Next 8 lines (1280 pixels).
    bne LoadMemory7

LoadMemory8
    lda CounterLow
    sta $0006 ; Clock lower address.
    lda CounterHigh
    sta $0007 ; Clock upper address.
    lda #$00
    sta $0005 ; Clock data.
    lda $00F9 ; Pulse WE.

    ; 16 bit counter increment.
    inc CounterLow
    bne skipHighInc8
    inc CounterHigh
skipHighInc8

    lda CounterHigh
    cmp #$28  ; Next 8 lines (1280 pixels).
    bne LoadMemory8

LoadMemory9
    lda CounterLow
    sta $0006 ; Clock lower address.
    lda CounterHigh
    sta $0007 ; Clock upper address.
    lda #$07
    sta $0005 ; Clock data.
    lda $00F9 ; Pulse WE.

    ; 16 bit counter increment.
    inc CounterLow
    bne skipHighInc9
    inc CounterHigh
skipHighInc9

    lda CounterHigh
    cmp #$2D  ; Next 8 lines (1280 pixels).
    bne LoadMemory9

LoadMemory10
    lda CounterLow
    sta $0006 ; Clock lower address.
    lda CounterHigh
    sta $0007 ; Clock upper address.
    lda #$06
    sta $0005 ; Clock data.
    lda $00F9 ; Pulse WE.

    ; 16 bit counter increment.
    inc CounterLow
    bne skipHighInc10
    inc CounterHigh
skipHighInc10

    lda CounterHigh
    cmp #$32  ; Next 8 lines (1280 pixels).
    bne LoadMemory10

LoadMemory11
    lda CounterLow
    sta $0006 ; Clock lower address.
    lda CounterHigh
    sta $0007 ; Clock upper address.
    lda #$05
    sta $0005 ; Clock data.
    lda $00F9 ; Pulse WE.

    ; 16 bit counter increment.
    inc CounterLow
    bne skipHighInc11
    inc CounterHigh
skipHighInc11

    lda CounterHigh
    cmp #$37  ; Next 8 lines (1280 pixels).
    bne LoadMemory11

LoadMemory12
    lda CounterLow
    sta $0006 ; Clock lower address.
    lda CounterHigh
    sta $0007 ; Clock upper address.
    lda #$04
    sta $0005 ; Clock data.
    lda $00F9 ; Pulse WE.

    ; 16 bit counter increment.
    inc CounterLow
    bne skipHighInc12
    inc CounterHigh
skipHighInc12

    lda CounterHigh
    cmp #$3C  ; Next 8 lines (1280 pixels).
    bne LoadMemory12

LoadMemory13
    lda CounterLow
    sta $0006 ; Clock lower address.
    lda CounterHigh
    sta $0007 ; Clock upper address.
    lda #$03
    sta $0005 ; Clock data.
    lda $00F9 ; Pulse WE.

    ; 16 bit counter increment.
    inc CounterLow
    bne skipHighInc13
    inc CounterHigh
skipHighInc13

    lda CounterHigh
    cmp #$41  ; Next 8 lines (1280 pixels).
    bne LoadMemory13

LoadMemory14
    lda CounterLow
    sta $0006 ; Clock lower address.
    lda CounterHigh
    sta $0007 ; Clock upper address.
    lda #$02
    sta $0005 ; Clock data.
    lda $00F9 ; Pulse WE.

    ; 16 bit counter increment.
    inc CounterLow
    bne skipHighInc14
    inc CounterHigh
skipHighInc14

    lda CounterHigh
    cmp #$46  ; Next 8 lines (1280 pixels).
    bne LoadMemory14

LoadMemory15
    lda CounterLow
    sta $0006 ; Clock lower address.
    lda CounterHigh
    sta $0007 ; Clock upper address.
    lda #$01
    sta $0005 ; Clock data.
    lda $00F9 ; Pulse WE.

    ; 16 bit counter increment.
    inc CounterLow
    bne skipHighInc15
    inc CounterHigh
skipHighInc15

    lda CounterHigh
    cmp #$50  ; Next 8 lines (1280 pixels).
    bne LoadMemory15

    ; Set VGA generator to "display" mode.
    lda #$00
    sta $00F8

MainLoop
    jmp MainLoop

; Store the location of key program sections.
		ORG $FFFC
ResetVector
		.word StartExe		        ; Start of execution.
