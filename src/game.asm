  module game


  ;;
  ;; init
  ;;
init:
  ;; screen 2
  ld a,2
  call bios.chgmod
  ;; disable keyboard click
  xor a
  ld (sysvar.cliksw),a
  ;; change border color
  ld (sysvar.bdrclr),a
  jp bios.chgclr


  ;;
  ;; run
  ;;
run:
  call bios.kilbuf
  call bios.disscr
  call load_tiles
  call graphics.clear
  call bios.enascr
  jp start_game


  ;;
  ;; load_tiles
  ;;
load_tiles:
  ;; pattern
  ld de,resources.tiles_pattern
  ld hl,(sysvar.grpcgp)
  call uncompress.to_vram
  ;; logo
  ld de,resources.tiles_color
  ld hl,(sysvar.grpcol)
  jp uncompress.to_vram


  ;;
  ;; start_game
  ;;
start_game:
  call level.init
  call show_level
  jp game_loop


  ;;
  ;; show_level
  ;;
show_level:
  halt
  call level.draw
  call level.draw_level_title
  call bios.chget
  halt
  jp level.draw


  ;;
  ;; game_loop
  ;;
game_loop:
  call player.update
  call robots.update
  call player.collide
  call robots.collide
  call player.clear_pos_flag
  halt
  jr game_loop


  ;;
  ;; game_over
  ;;
game_over:
  halt
  call level.draw
  call level.draw_game_over
  call bios.enascr
  call bios.chget
  halt
  jp level.draw
