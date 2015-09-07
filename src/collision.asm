  module collision


  ;;
  ;; check_robot
  ;;
check_robot:
  ld a,(iy+robot.state_offset)
  cp robot.state_dead
  jr z,.nocollision
  ;; check ptr
  push ix
  pop hl
  push iy
  pop de
  or a
  sbc hl,de
  jr z,.nocollision
  ;; check x
  ld a,(ix+spr.x)
  cp (iy+spr.x)
  jr nz,.nocollision
  ;; check y
  ld a,(ix+spr.y)
  cp (iy+spr.y)
  jr nz,.nocollision
  ;; collision
  ld a,1
  ret
.nocollision:
  xor a
  ret


  ;;
  ;; check_robots
  ;;
check_robots:
  ld iy,robots.array
  ld b,robots.count
.loop:
  call check_robot
  or a
  ret nz
  ld de,robot.size
  add iy,de
  djnz .loop
  ret
