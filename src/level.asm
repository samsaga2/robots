  module level


  ;;
  ;; variables
  ;;
current_level:  #1


  ;;
  ;; init
  ;;
init:
  ld a,1
  ld (current_level),a
  call robots.init
  call player.init
  call robots.random_pos
  ld hl,1000
  ld (player.score),hl
  ld (player.hiscore),hl
  ret


  ;;
  ;; draw
  ;;
draw:
  call draw_floor
  ;; draw score
  ld hl,(sysvar.grpnam)
  ld de,resources.msg_score
  call graphics.print_text
  call draw_score
  ret


  ;;
  ;; draw_floor
  ;;
draw_floor:
  ld hl,(sysvar.grpnam)
  ld de,32
  add hl,de
  ld bc,768
  ld a,1
  jp bios.filvrm

  ;;
  ;; draw_score
  ;;
draw_score:
  ;; score
  ld hl,(player.score)
  ex de,hl
  ld hl,(sysvar.grpnam)
  ld bc,6
  add hl,bc
  call graphics.print_number16

  ;; hi-score
  ld hl,(player.hiscore)
  ex de,hl
  ld hl,(sysvar.grpnam)
  ld bc,26
  add hl,bc
  jp graphics.print_number16


  ;;
  ;; draw_title
  ;;
draw_title:
  push bc
  ld hl,(sysvar.grpnam)
  ld bc,32*10+10
  add hl,bc
  call graphics.print_text

  ld hl,(sysvar.grpnam)
  ld bc,32*9+10
  add hl,bc
  pop de
  push de
  call graphics.print_text

  ld hl,(sysvar.grpnam)
  ld bc,32*11+10
  add hl,bc
  pop de
  jp graphics.print_text


  ;;
  ;; draw_game_over
  ;;
draw_game_over:
  ld de,resources.msg_dead0
  ld bc,resources.msg_dead1
  jp draw_title


  ;;
  ;; draw_level_title
  ;;
draw_level_title:
  ld de,resources.msg_title0
  ld bc,resources.msg_title1
  call draw_title
  ;; score
  ld a,(current_level)
  ld d,0
  ld e,a
  ld hl,(sysvar.grpnam)
  ld bc,32*10+18
  add hl,bc
  jp graphics.print_number8


  ;;
  ;; tile
  ;;
tile:
  push af
  ;; x
  ld a,(ix+0)
  ld e,a
  ld d,0
  ;; y
  ld a,(ix+1)
  ld l,a
  ld h,0
  add hl,hl
  add hl,hl
	add hl,hl
	add hl,hl
	add hl,hl
  ;; name table
  ld de,(sysvar.grpnam)
  add hl,de
  pop af
  jp bios.wrtvrm


  ;;
  ;; next
  ;;
next:
  ld de,1000
  call player.add_score
  ld hl,current_level
  inc (hl)
  call game.show_level
  call robots.init
  call player.init
  jp robots.random_pos
