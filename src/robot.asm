  module robot


  ;;
  ;; enums
  ;;
size:  equ 5
frame_index:  equ 2
frame_time: equ 3
state_offset:  equ 4

state_normal: equ 0
state_explosion:  equ 1
state_junk: equ 2
state_dead:  equ 3


  ;;
  ;; init
  ;;
init:
  ld (ix+spr.y),a
  ld (ix+frame_index),0
  ld (ix+frame_time),10
  ld (ix+state_offset),state_dead
  ret


  ;;
  ;; random_pos
  ;;
random_pos:
  ld b,50
.loop:
  ld (ix+state_offset),state_normal
  call spr.random_pos
  ;; check
  push bc
  call collision.check_robots
  pop bc
  or a
  ret z
  djnz .loop
  ld (ix+state_offset),state_dead
  ret


  ;;
  ;; update_frame
  ;;
update_frame:
  dec (ix+frame_time)
  ret nz
  ld (ix+frame_time),10
  ld a,1
  sub (ix+frame_index)
  ld (ix+frame_index),a
  ret


  ;;
  ;; update_pos_x
  ;;
update_pos_x:
  ld a,(player.x)
  cp (ix+spr.x)
  ret z
  jp c,spr.move_left
  jp spr.move_right


  ;;
  ;; update_pos_y
  ;;
update_pos_y:
  ld a,(player.y)
  cp (ix+spr.y)
  ret z
  jp c,spr.move_up
  jp spr.move_down


  ;;
  ;; update_pos
  ;;
update_pos:
  ld a,(player.moved)
  or a
  ret z
  call update_pos_x
  jp update_pos_y


  ;;
  ;; update_collision
  ;;
update_collision:
  call collision.check_robots
  or a
  ret z
  ld (ix+state_offset),state_explosion
  ret


  ;;
  ;; update_normal
  ;;
update_normal:
  call spr.clear
  call update_frame
  call update_pos
  jp draw


  ;;
  ;; update_explosion
  ;;
update_explosion:
  ld (ix+state_offset),state_junk
  jp spr.draw_explosion


  ;;
  ;; update_junk
  ;;
update_junk:
  jp spr.draw_junk


  ;;
  ;; update
  ;;
update:
  ld a,(ix+state_offset)
  cp state_normal
  jp z,update_normal
  cp state_explosion
  jp z,update_explosion
  ld a,(player.moved)
  or a
  ret z
  ld a,(ix+state_offset)
  cp state_junk
  jr z,update_junk
  ret


  ;;
  ;; collide
  ;;
collide:
  ld a,(ix+state_offset)
  cp state_normal
  ret nz
  jp update_collision


  ;;
  ;; draw
  ;;
draw:
  ld a,(ix+frame_index)
  or a
  jp nz,spr.draw_robot2
  jp spr.draw_robot1
