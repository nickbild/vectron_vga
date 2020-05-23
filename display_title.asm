;;;;
; Display image on Vectron 64 VGA generator.
; Nick Bild - nick.bild@gmail.com
; https://github.com/nickbild/vectron_vga
;
; Reserved memory:
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

; Start at beginning of ROM.
StartExe	ORG $8000
    ; Set VGA generator to "program" mode.
    lda #$01
    sta $00F8

    ;;;;
    ;; Load data to VRAM.
    ;;;;

    lda #$A0
    sta $0006 ; Clock lower address.
    lda #$00
    sta $0007 ; Clock upper address.
    lda #$01
    sta $0005 ; Clock data.
    lda $00F9 ; Pulse WE.

    lda #$A1
    sta $0006 ; Clock lower address.
    lda #$00
    sta $0007 ; Clock upper address.
    lda #$02
    sta $0005 ; Clock data.
    lda $00F9 ; Pulse WE.

    lda #$A2
    sta $0006 ; Clock lower address.
    lda #$00
    sta $0007 ; Clock upper address.
    lda #$04
    sta $0005 ; Clock data.
    lda $00F9 ; Pulse WE.

    lda #$A3
    sta $0006 ; Clock lower address.
    lda #$00
    sta $0007 ; Clock upper address.
    lda #$01
    sta $0005 ; Clock data.
    lda $00F9 ; Pulse WE.

    lda #$A4
    sta $0006 ; Clock lower address.
    lda #$00
    sta $0007 ; Clock upper address.
    lda #$02
    sta $0005 ; Clock data.
    lda $00F9 ; Pulse WE.

    lda #$A5
    sta $0006 ; Clock lower address.
    lda #$00
    sta $0007 ; Clock upper address.
    lda #$04
    sta $0005 ; Clock data.
    lda $00F9 ; Pulse WE.

    lda #$A6
    sta $0006 ; Clock lower address.
    lda #$00
    sta $0007 ; Clock upper address.
    lda #$01
    sta $0005 ; Clock data.
    lda $00F9 ; Pulse WE.

    lda #$A7
    sta $0006 ; Clock lower address.
    lda #$00
    sta $0007 ; Clock upper address.
    lda #$02
    sta $0005 ; Clock data.
    lda $00F9 ; Pulse WE.

    lda #$A8
    sta $0006  ; Clock lower address.
    lda #$00
    sta $0007 ; Clock upper address.
    lda #$04
    sta $0005 ; Clock data.
    lda $00F9 ; Pulse WE.

    ; Set VGA generator to "display" mode.
    lda #$00
    sta $00F8

MainLoop
    jmp MainLoop

; Store the location of key program sections.
		ORG $FFFC
ResetVector
		.word StartExe		        ; Start of execution.
