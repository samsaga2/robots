  module spr


  ;;
  ;; enums
  ;;
x:  equ 0
y:  equ 1


  ;;
  ;; random_pos
  ;;
random_pos:
  ;; rnd x
  call math.random
  and 0x1f
  ld (ix+spr.x),a
  ;; rnd y
.loop:
  call math.random
  cp 23
  inc a
  jr nc,.loop
  ld (ix+spr.y),a
  ret


  ;;
  ;; move_right
  ;;
move_right:
  ld a,(ix+x)
  cp 31
  ret z
  inc (ix+x)
  ret


  ;;
  ;; move_left
  ;;
move_left:
  ld a,(ix+x)
  or a
  ret z
  dec (ix+x)
  ret


  ;;
  ;; move_up
  ;;
move_up:
  ld a,(ix+y)
  cp 1
  ret z
  dec (ix+y)
  ret


  ;;
  ;; move_down
  ;;
move_down:
  ld a,(ix+y)
  cp 23
  ret z
  inc (ix+y)
  ret


  ;;
  ;; draw
  ;;
draw:
  push af
  ;; x
  ld a,(ix+x)
  ld e,a
  ld d,0
  ;; y
  ld a,(ix+y)
  ld l,a
  ld h,0
  add hl,hl
  add hl,hl
	add hl,hl
	add hl,hl
  add hl,hl
  add hl,de
  ;; name table
  ld de,(sysvar.grpnam)
  add hl,de
  pop af
  jp bios.wrtvrm


  ;;
  ;; clear
  ;;
clear:
  ld a,graphics.tiles_floor
  jp draw


  ;;
  ;; draw_player
  ;;
draw_player:
  ld a,graphics.tiles_player
  jp draw


  ;;
  ;; draw_robot1
  ;;
draw_robot1:
  ld a,graphics.tiles_robot1
  jp draw


  ;;
  ;; draw_robot2
  ;;
draw_robot2:
  ld a,graphics.tiles_robot2
  jp draw


  ;;
  ;; draw_explosion
  ;;
draw_explosion:
  ld a,graphics.tiles_explosion
  jp draw


  ;;
  ;; draw_junk
  ;;
draw_junk:
  ld a,graphics.tiles_junk
  jp draw
