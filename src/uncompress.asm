  module uncompress


  ;;
	;; variables
	;;
ram_end # 256                   ; reusable ram


  ;;
  ;; to_vram
  ;;
  ;; in DE=compressed data ptr
  ;; in HL=start vram addr
to_vram:
  di
  call bios.setwrt
  push de
  pop ix
  call to_vram_write
  ei
  ret


  ;;
  ;; to_vram_noset
  ;;
  ;; in DE=compressed data ptr
to_vram_write:
  ;; bc=token count
  ld c,(ix+0)
  ld b,(ix+1)
  inc ix
  inc ix

  ;; de=dest (256 bytes align)
  ld hl,ram_end
  ld de,256
  add hl,de
  ld l,0
  ex de,hl

  ;; uncompress loop
.loop:
    ;; a=len
    ld a,(ix+0)
    inc ix
    or a
    jr z,.skip

        push bc
        ld b,a                  ; b=back reference len
        ld c,(ix+0)             ; c=back reference offset
        inc ix
        ;; hl:addr = (de-backoffset) mod 256
        ld a,e
        sub c
        ld l,a
        ld h,d
        ;; copy back reference
.loop2:
        ld a,(hl)
        inc l                         ; hl=hl mod 256
        out (0x98),a
        ld (de),a
        inc e                         ; de=de mod 256
        djnz .loop2
        pop bc

.skip:
    ;; a=next char
    ld a,(ix+0)

    ;; write nextchar
    out (0x98),a
    ld (de),a
    inc e
    inc ix

    ;; end?
    dec bc
    ld a,c
    or b

  jr nz,.loop
  ret
