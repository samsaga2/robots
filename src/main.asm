  module main


  ;;
  ;; start
  ;;
start:
  call init
  call logo.run
  call game.run
  ret


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
