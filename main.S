; Blink PB5 on ATmega328P (Arduino Uno LED pin)
;
; This file is self-contained (does not require m328pdef.inc).

; ATmega328P I/O register addresses (I/O space, for SBI/CBI)
.equ DDRB,  0x04
.equ PORTB, 0x05

; Bit positions
.equ DDB5,   5
.equ PORTB5, 5

.text
.global main
.type main, @function

main:
    sbi DDRB, DDB5

loop:
    sbi PORTB, PORTB5
    rcall delay
    cbi PORTB, PORTB5
    rcall delay
    rjmp loop

delay:
    ldi r18, 80
d1: ldi r19, 255
d2: dec r19
    brne d2
    dec r18
    brne d1
    ret