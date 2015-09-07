  module resources


  ;;
  ;; strings
  ;;
msg_score:
  db "SCORE      0     HI-SCORE      0", 0
msg_title0:
  db "  LEVEL 000  ", 0
msg_title1:
  db "             ", 0
msg_dead0:
  db "  GAME OVER  ", 0
msg_dead1:
  db "             ", 0


  ;;
  ;; logo
  ;;
logo_color:
 incbin logofinal.col
logo_frame1:
 incbin logo1.pat
logo_frame2:
 incbin logo2.pat
logo_frame3:
 incbin logo3.pat
logo_frame4:
 incbin logo4.pat


  ;;
  ;; game tiles
  ;;
tiles_pattern:
  incbin game.pat
tiles_color:
  incbin game.col
