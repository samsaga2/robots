  module graphics


  ;;
  ;; tiles enums
  ;;
tiles_floor:  equ 1
tiles_player:  equ 2
tiles_robot1:  equ 3
tiles_robot2:  equ 4
tiles_explosion:  equ 5
tiles_junk: equ 6


  ;;
  ;; clear
  ;;
clear:
  ld hl,(sysvar.grpnam)
  ld de,32
  ld bc,768
  xor a
  jp bios.filvrm


  ;;
  ;; print_text
  ;;
print_text:
  di
  call bios.setwrt
.loop:
  ld a,(de)
  or a
  jr z,.exit
  inc de
  out (0x98),a
  jr .loop
.exit:
  ei
  ret


  ;;
  ;; print_number8
  ;;
print_number8:
  di
  push de
  call bios.setwrt
  pop hl
  ld bc,-100
  call .num1
  ld c,-10
  call .num1
  ld c,-1
  call .num1
  ei
  ret
.num1:
  ld a,47
.loop:
  inc a
  add hl,bc
  jr c,.loop
  sbc hl,bc
  out (0x98),a
  ret


  ;;
  ;; print_number16
  ;;
print_number16:
  di
  push de
  call bios.setwrt
  pop hl
	ld bc,-10000
	call print_number8.num1
	ld bc,-1000
	call print_number8.num1
  ld bc,-100
	call print_number8.num1
	ld c,-10
	call print_number8.num1
	ld c,-1
	call print_number8.num1
	ei
	ret
