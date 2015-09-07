  module player


  ;;
  ;; variables
  ;;
score:   #2
hiscore: #2
x:       #1
y:       #1
moved:   #1


  ;;
  ;; enums
  ;;
move_index: equ 2


  ;;
  ;; init
  ;;
init:
  ld ix,x
  ld (ix+move_index),0
  jp safe_teleport


  ;;
  ;; update_keyboard
  ;;
update_keyboard:
  call bios.chsns
  ret z
  call bios.chget
  ld (ix+move_index),1
  cp 0x1c
  jp z,move_right
  cp 0x1d
  jp z,move_left
  cp 0x1e
  jp z,move_up
  cp 0x1f
  jp z,move_down
  cp 77
  jp z,safe_teleport
  cp 109
  jp z,safe_teleport
  cp 0x20
  jp z,wait
  ld (ix+move_index),0
  ret


  ;;
  ;; wait
  ;;
wait:
  ld de,-5
  jp add_score


  ;;
  ;; add_score
  ;;
add_score:
  ld hl,(score)
  add hl,de
  ld (score),hl
  ;; check hi score
  ld hl,(hiscore)
  ld de,(score)
  xor a
  sbc hl,de
  jr nc,.noupdate
  ld (hiscore),de
.noupdate:
  jp level.draw_score


  ;;
  ;; move_right
  ;;
move_right:
  ld de,-10
  call add_score
  jp spr.move_right


  ;;
  ;; move_left
  ;;
move_left:
  ld de,-10
	call add_score
	jp spr.move_left


  ;;
  ;; move_up
  ;;
move_up:
  ld de,-10
  call add_score
  jp spr.move_up


  ;;
  ;; move_down
  ;;
move_down:
  ld de,-10
  call add_score
  jp spr.move_down


  ;;
  ;; update
  ;;
update:
  ld ix,x
  call spr.clear
  call update_keyboard
  jp spr.draw_player


  ;;
  ;; teleport
  ;;
teleport:
  ld de,-10
  call add_score
  ld (ix+move_index),0
  jp spr.random_pos


  ;;
  ;; safe_teleport
  ;;
safe_teleport:
  ld de,-50
  call add_score
  ld (ix+move_index),0
  ld ix,x
  call spr.random_pos

.loop:
  call collision.check_robots
  or a
  ret z
  call spr.random_pos
  jr .loop


  ;;
  ;; clear_pos_flag
  ;;
clear_pos_flag:
  xor a
  ld (moved),a
  ret


  ;;
  ;; collide
  ;;
collide:
  ld ix,x
  call collision.check_robots
  or a
  ret z
  call game.game_over
  pop hl                        ; to avoid stack overflow
  jp game.start_game
