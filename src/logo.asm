  module logo


  ;;
  ;; run
  ;;
run:
  call bios.disscr
  call load_color
  call show_anim
  jp bios.kilbuf


  ;;
  ;; load_color
  ;;
load_color:
  ld de,resources.logo_color
  ld hl,(sysvar.grpcol)
  jp uncompress.to_vram


  ;;
  ;; show_anim
  ;;
show_anim:
  ld b,2
.loop:
  push bc
 	ld de,resources.logo_frame1
  call show_frame
  call bios.enascr
 	ld de,resources.logo_frame2
  call show_frame
	ld de,resources.logo_frame3
  call show_frame
	ld de,resources.logo_frame4
  call show_frame
  pop bc
  djnz .loop
  ret


  ;;
  ;; show_frame
  ;;
show_frame:
  ld hl,(sysvar.grpcgp)
  halt
  call uncompress.to_vram
  call wait
  ret z
  pop hl
  ret


  ;;
  ;; wait
  ;;
wait:
  ld b,5
.loop:
  call bios.chsns
  ret nz
  halt
  djnz .loop
  ret
