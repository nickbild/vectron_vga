;;;;
; Display image on Vectron 64 VGA generator.
; Nick Bild - nick.bild@gmail.com
; https://github.com/nickbild/vectron_vga
;
; Reserved memory:
; $0100-$01FF - 6502 stack
;
; $FFF5 - VGA mode - program or display.
; $FFF6 - VRAM write enable (WE) pin.
; $FFF7 - VRAM data clock.
; $FFF8 - VRAM lower address clock.
; $FFF9 - VRAM upper address clock.
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
    sta $FFF5

    ;;;;
    ;; Load data to VRAM.
    ;;;;

    lda #$00
    sta $FFF8 ; Clock lower address.
    lda #$00
    sta $FFF9 ; Clock upper address.
    lda #$00
    sta $FFF7 ; Clock data.
    lda $FFF6 ; Pulse WE.

    lda #$01
    sta $FFF8 ; Clock lower address.
    lda #$00
    sta $FFF9 ; Clock upper address.
    lda #$02
    sta $FFF7 ; Clock data.
    lda $FFF6 ; Pulse WE.

    lda #$02
    sta $FFF8 ; Clock lower address.
    lda #$00
    sta $FFF9 ; Clock upper address.
    lda #$04
    sta $FFF7 ; Clock data.
    lda $FFF6 ; Pulse WE.

    lda #$03
    sta $FFF8 ; Clock lower address.
    lda #$00
    sta $FFF9 ; Clock upper address.
    lda #$00
    sta $FFF7 ; Clock data.
    lda $FFF6 ; Pulse WE.

    lda #$04
    sta $FFF8 ; Clock lower address.
    lda #$00
    sta $FFF9 ; Clock upper address.
    lda #$02
    sta $FFF7 ; Clock data.
    lda $FFF6 ; Pulse WE.

    lda #$05
    sta $FFF8 ; Clock lower address.
    lda #$00
    sta $FFF9 ; Clock upper address.
    lda #$04
    sta $FFF7 ; Clock data.
    lda $FFF6 ; Pulse WE.

    lda #$06
    sta $FFF8 ; Clock lower address.
    lda #$00
    sta $FFF9 ; Clock upper address.
    lda #$00
    sta $FFF7 ; Clock data.
    lda $FFF6 ; Pulse WE.

    lda #$07
    sta $FFF8 ; Clock lower address.
    lda #$00
    sta $FFF9 ; Clock upper address.
    lda #$02
    sta $FFF7 ; Clock data.
    lda $FFF6 ; Pulse WE.

    lda #$08
    sta $FFF8 ; Clock lower address.
    lda #$00
    sta $FFF9 ; Clock upper address.
    lda #$04
    sta $FFF7 ; Clock data.
    lda $FFF6 ; Pulse WE.

    ; Set VGA generator to "display" mode.
    lda #$00
    sta $FFF5

; Store the location of key program sections.
		ORG $FFFC
ResetVector
		.word StartExe		        ; Start of execution.
