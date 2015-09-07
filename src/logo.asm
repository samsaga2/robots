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
  call load_frame0
  call wait
	ret nz
  call load_frame1
  call wait
  ret nz
  jr show_anim


  ;;
  ;; load_frame0
  ;;
load_frame0:
  ld de,resources.logo_frame0
  ld hl,(sysvar.grpcgp)
  call uncompress.to_vram
  jp bios.enascr


  ;;
  ;; load_frame1
  ;;
load_frame1:
  ld de,resources.logo_frame1
  ld hl,(sysvar.grpcgp)
  call uncompress.to_vram
  jp bios.enascr


  ;;
  ;; wait
  ;;
wait:
  ld b,20
.loop:
  call bios.chsns
  ret nz
  halt
  djnz .loop
  ret
