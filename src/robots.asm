  module robots


  ;;
  ;; variables
  ;;
count:  equ 60
array:  #count*robot.size


  ;;
  ;; init
  ;;
init:
  ld ix,array
  ld b,count
.loop:
  call robot.init
  ld de,robot.size
  add ix,de
  djnz .loop
  ret


  ;;
  ;; level_robots_count
  ;;
level_robots_count:
  ld a,(level.current_level)
  add a,9
  cp 59
  jr nz,.skip
  ld a,59
.skip:
  ret


  ;;
  ;; random_pos
  ;;
random_pos:
  call level_robots_count
  ld b,a
  ld ix,array
.loop:
  push bc
  call robot.random_pos
  pop bc
  ld de,robot.size
  add ix,de
  djnz .loop
  ret


  ;;
  ;; update
  ;;
update:
  ld ix,array
  ld b,count
.loop:
  push bc
  call robot.update
  pop bc
  ld de,robot.size
  add ix,de
  djnz .loop
  jp check_all_dead


  ;;
  ;; collide
  ;;
collide:
  ld ix,array
  ld b,count
.loop:
  push bc
  call robot.collide
  pop bc
  ld de,robot.size
  add ix,de
  djnz .loop
  ret


  ;;
  ;; check_all_dead
  ;;
check_all_dead:
  ld ix,array
  ld de,robot.size
  ld b,count
.loop:
  ld a,(ix+robot.state_offset)
  cp robot.state_normal
  ret z
  add ix,de
  djnz .loop
  jp level.next
