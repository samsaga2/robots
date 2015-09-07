  defpage 0, 0x4000, 0x4000
  map 0xc000

	page 0


  ;;
  ;; romheader
  ;;
romheader:
	db "AB"
	dw start
	ds 12


 	;;
  ;; start
  ;;
start:
  call game.init
  call logo.run
  call game.run
  ret


  ;; asm files
  include bios.asm
  include sysvar.asm
  include uncompress.asm
  include graphics.asm
  include math.asm
  include logo.asm
  include game.asm
  include level.asm
  include collision.asm
  include spr.asm
  include robots.asm
	include robot.asm
  include player.asm
  include resources.asm
