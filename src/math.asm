  module math


  ;;
  ;; variables
  ;;
random_seed:  #2


  ;;
  ;; random
  ;;
random:
  push hl
  push de
  ld hl,(random_seed)
  ld a,r
  ld d,a
  ld e,(hl)
  add hl,de
  add a,l
  xor h
  ld (random_seed),hl
  pop de
  pop hl
  ret
