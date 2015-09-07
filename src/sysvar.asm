  ;; http://fms.komkon.org/MSX/Docs/SysArea.txt

  module sysvar

drive   equ 0xf2e1 ;; current drive
nmbdrv  equ 0xf347 ;; total number of drivies
dpblst  equ 0xf355 ;; list of drive parameters block
setrom  equ 0xf368 ;; set disk-basic rom
setram  equ 0xf36b ;; set system ram configuration
sltmov  equ 0xf36e ;; inter slot move
rombdos equ 0xf37d ;; rom bdos vector
rdprim  equ 0xf380 ;; read from basic slot
wrprim  equ 0xf385 ;; write to basic slot
clprim  equ 0xf38c ;; call basic slot
usrtab  equ 0xf39a ;; usr function starting addresses
linl40  equ 0xf3ae ;; screen width per line in screen 0
linl32  equ 0xf3af ;; screen width per line in screen 1
linlen  equ 0xf3b0 ;; current screen width per line
crtcnt  equ 0xf3b1 ;; number of lines of current screen
clmlst  equ 0xf3b2 ;; horizontal location in the case that items are divided by commas in print statement
txtnam  equ 0xf3b3 ;; pattern name tabte
txtcol  equ 0xf3b5 ;; color table
txtcgp  equ 0xf3b7 ;; pattern ganarator table
txtatr  equ 0xf3b9 ;; unused
txtpat  equ 0xf3bb ;; unused
t32nam  equ 0xf3bd ;; pattern name tabte
t32col  equ 0xf3bf ;; color table
t32cgp  equ 0xf3c1 ;; pattern ganarator table
t32atr  equ 0xf3c3 ;; sprite attribute table
t32pat  equ 0xf3c5 ;; sprite generator table
grpnam  equ 0xf3c7 ;; pattern name tabte
grpcol  equ 0xf3c9 ;; color table
grpcgp  equ 0xf3cb ;; pattern ganarator table
grpatr  equ 0xf3cd ;; sprite attribute table
grppat  equ 0xf3cf ;; sprite generator table
mltnam  equ 0xf3d1 ;; pattern name tabte
mltcol  equ 0xf3d3 ;; color table
mltcgp  equ 0xf3d5 ;; pattern ganarator table
mltatr  equ 0xf3d7 ;; sprite attribute table
mltpat  equ 0xf3d9 ;; sprite generator table
cliksw  equ 0xf3db ;; key click switch
csry    equ 0xf3dc ;; y-coordinate of cursor
csrx    equ 0xf3dd ;; x-coordinate of cursor
cnsdfg  equ 0xf3de ;; functon key display switch
rg0sav  equ 0xf3df
rg1sav  equ 0xf3e0
rg2sav  equ 0xf3e1
rg3sav  equ 0xf3e2
rg4sav  equ 0xf3e3
rg5sav  equ 0xf3e4
rg6sav  equ 0xf3e5
rg7sav  equ 0xf3e6
statfl  equ 0xf3e7 ;; stores vdp status (msx2- vdp status register 0
trgflg  equ 0xf3e8 ;; stories trigger button status of joystick
forclr  equ 0xf3e9 ;; foreground colour
bakclr  equ 0xf3ea ;; background colour
bdrclr  equ 0xf3eb ;; border colour
maxupd  equ 0xf3ec ;; jmp 0000 (used by circle statement
minupd  equ 0xf3ef ;; jmp 0000 (used by circle statement
atrbyt  equ 0xf3f2 ;; color code in csing graphic
queues  equ 0xf3f3 ;; points to queue table at the execution of play st.
frcnew  equ 0xf3f5 ;; db 255
scncnt  equ 0xf3f6 ;; interval for the key scan
repcnt  equ 0xf3f7 ;; delay until the auto-repeat of the key begins
putpnt  equ 0xf3f8 ;; dw keybuf points to adress to write in the key buffer
getpnt  equ 0xf3fa ;; dw keybuf points to adress to read from the key buffer
cs120   equ 0xf3fc ;; reading parameters
low     equ 0xf406
high    equ 0xf408
header  equ 0xf40a
aspct1  equ 0xf40b ;; 256/aspect ratio
aspct2  equ 0xf40d ;; 256*aspect ratio
endpgm  equ 0xf40f ;; db ":" dummy program end for resume next st.
errflg  equ 0xf414 ;; error number
lptpos  equ 0xf415 ;; position of printer head
prtflg  equ 0xf416 ;; flag whether to send to printer
ntmsxp  equ 0xf417 ;; =0 if msx printer
rawprt  equ 0xf418 ;; <>0 if printing is in 'raw mode'
vlzadr  equ 0xf419 ;; address of character replaced by val
vlzdat  equ 0xf41b ;; character replaced with 0 by val
curlin  equ 0xf41c ;; current execution line number of basic
kbuf    equ 0xf41f ;; crunch buffer;translated into intermediate language from buf
bufmin  equ 0xf55d ;; used in input st.
buf     equ 0xf55e ;; buffer to store characters typed( in ascii code
endbuf  equ 0xf660 ;; preventoverflow of buf
ttypos  equ 0xf661 ;; virtual cursor location internally retained by basic
dimflg  equ 0xf662 ;; array flag
valtyp  equ 0xf663 ;; type indicator
oprtyp  equ 0xf664 ;; store operator number in the extended momentarily before operator application
dores   equ 0xf664 ;; indicates whether stored word can be crunched
donum   equ 0xf665 ;; flag for crunch
contxt  equ 0xf666 ;; text address used by cnrget
consav  equ 0xf668 ;; store token of constant after calling chrget
contyp  equ 0xf669 ;; type of stored constant
conlo   equ 0xf66a ;; valu of stored constant
memsiz  equ 0xf672 ;; highest location in memory used by basic
stktop  equ 0xf674 ;; top location to be used for the stack
txttab  equ 0xf676 ;; starting address of basic text area
temppt  equ 0xf678 ;; starting address of unused area of temporary descriptor
tempst  equ 0xf67a ;; temporary descriptors
dsctmp  equ 0xf698 ;; string descriptor wich is the result of string fun.
fretop  equ 0xf69b ;; starting address of unused area of string area
temp3   equ 0xf69d ;; used for garbage collection or by usr function
temp8   equ 0xf69f ;; used for garbage collection
endfor  equ 0xf6a1 ;; next address of for st.
datlin  equ 0xf6a3 ;; line number of data st.read by read st.
subflg  equ 0xf6a5 ;; flag for array for usr fun.
usflg   equ 0xf6a6
flginp  equ 0xf6a6 ;; flag for input or read
temp    equ 0xf6a7 ;; location for temporary reservation for st.code
ptrflg  equ 0xf6a9 ;; =0 if no line number converted to pointers
autflg  equ 0xf6aa ;; auto mode flag
autlin  equ 0xf6ab ;; current line number for auto
autinc  equ 0xf6ad ;; increment for auto
savtxt  equ 0xf6af ;; text pointer for resume
savstk  equ 0xf6b1 ;; save stack when error occurs
errlin  equ 0xf6b3 ;; line where last error
dot     equ 0xf6b5 ;; current line for edit & list
errtxt  equ 0xf6b7 ;; text pointer for use by resume
onelin  equ 0xf6b9 ;; line to go when error
oneflg  equ 0xf6bb ;; =1 if executing an error trap routine
temp2   equ 0xf6bc
oldlin  equ 0xf6be ;; old line number set up ^c ...
oldtxt  equ 0xf6c0 ;; points st. to be executed next
vartab  equ 0xf6c2 ;; pointer to start of variable space
arytab  equ 0xf6c4 ;; pointer to begging of array table
strend  equ 0xf6c6 ;; end of storage in use
datptr  equ 0xf6c8 ;; data pointer
deftbl  equ 0xf6ca ;; default valtype for each letter
prmstk  equ 0xf6e4 ;; previous definition block on stack
prmlen  equ 0xf6e6 ;; number of bytes of objective table
parm1   equ 0xf6e8 ;; objective prameter definition table
prmprv  equ 0xf74c ;; pointer to previous parameter block
prmln2  equ 0xf74e ;; size of parameter block
parm2   equ 0xf750 ;; for parameter storage
prmflg  equ 0xf7b4 ;; flag to indicate whether parm1 was searching
aryta2  equ 0xf7b5 ;; end point of search
nofuns  equ 0xf7b7 ;; 0 if no function active
temp9   equ 0xf7b8 ;; location of temporary storage for garbage collection
funact  equ 0xf7ba ;; count of active functions
swptmp  equ 0xf7bc ;; value of first  variable in swap st.
trcflg  equ 0xf7c4 ;; 0 means no trace
fbuffr  equ 0xf7c5 ;; buffer for fout
dectmp  equ 0xf7f0 ;; used to transform decimal integer to floating point number
dectm2  equ 0xf7f2 ;; used at division routine execution
deccnt  equ 0xf7f4 ;; used at division routine execution
dac     equ 0xf7f6 ;; decimal accumulator
hold8   equ 0xf806 ;; registers for decimal multiplication
hold2   equ 0xf836
hold    equ 0xf83e
arg     equ 0xf847 ;; area to set the value to be calculate with dac
rndx    equ 0xf857 ;; last random number
maxfil  equ 0xf85f ;; high legal file number
filtab  equ 0xf860 ;; starting address of of file data area
nulbuf  equ 0xf862 ;; points to file 0 buffer ( used in save & load st.
ptrfil  equ 0xf864 ;; points to file data of currently accessing file
runflg  equ 0xf866 ;; non-zero for run after load
filnam  equ 0xf866 ;; name for files, name & others
filnm2  equ 0xf871 ;; second name for name
nlonly  equ 0xf87c ;; <>0 when loading program
savend  equ 0xf87d ;; end address for bsave
fnkstr  equ 0xf87f ;; function key area
cgpnt   equ 0xf91f ;; address to store charecter font in rom
nambas  equ 0xf922 ;; base address of current pattern name table
cgpbas  equ 0xf924 ;; base address of current pattern generator table
patbas  equ 0xf926 ;; base address of current sprite generator table
atrbas  equ 0xf928 ;; base address of current sprite attribute table
cloc    equ 0xf92a
cmask   equ 0xf92c
mindel  equ 0xf92d
maxdel  equ 0xf92f
aspect  equ 0xf931 ;; aspect ratio of the circle; set by <ratio> of circle
cencnt  equ 0xf933 ;; end count
clinef  equ 0xf935 ;; flag to draw line to centre
cnpnts  equ 0xf936 ;; point to be plottted
cplotf  equ 0xf938 ;; plot polarity flag
cpcnt   equ 0xf939 ;; 1/8 of number of points in circle
cpcnt8  equ 0xf93b
crcsum  equ 0xf93d
cstcnt  equ 0xf93f
csclxy  equ 0xf941 ;; scale of x & y
csavea  equ 0xf942 ;; reservation area of advgrp
csavem  equ 0xf944 ;; reservation area of advgrp
cxoff   equ 0xf945 ;; x offset from center
cyoff   equ 0xf947 ;; y offset from center
lohmsk  equ 0xf949
lohdir  equ 0xf94a
lohadr  equ 0xf94b
lohcnt  equ 0xf94d
skpcnt  equ 0xf94f ;; skip count
movcnt  equ 0xf951 ;; movement count
pdirec  equ 0xf953 ;; direction of the paint
lfprog  equ 0xf954
rtprog  equ 0xf955
mcltab  equ 0xf956
mclflg  equ 0xf958 ;; play / draw
quetab  equ 0xf959
quebak  equ 0xf971
voicaq  equ 0xf975
voicbq  equ 0xf9f5
voiccq  equ 0xfa75
dppage  equ 0xfaf5 ;; display page number
acpage  equ 0xfaf6 ;; active page number
avcsav  equ 0xfaf7 ;; reserves av control port
exbrsa  equ 0xfaf8 ;; sub_rom slot address
chrcnt  equ 0xfaf9 ;; character counter in the buffer; used in roman-kana translation
roma    equ 0xfafa ;; area to store character (japan version only
mode    equ 0xfafc ;; mode svitch for vram size
noruse  equ 0xfafd ;; unused
xsave   equ 0xfafe ;; [10000000 xxxxxxxx]
ysave   equ 0xfb00 ;; [*0000000 yyyyyyyy] *-light pen interrupt request
logopr  equ 0xfb02 ;; logical operation code data area used by rs-232c or disk drive
rstmp   equ 0xfb03
tocnt   equ 0xfb03
rsfcb   equ 0xfb04
rsiqln  equ 0xfb06
mexbih  equ 0xfb07 ;; hook
oldstt  equ 0xfb0c ;; hook
oldint  equ 0xfb12 ;; hook
devnum  equ 0xfb17
datcnt  equ 0xfb18 ;; hook
errors  equ 0xfb1b
flags   equ 0xfb1c
estbls  equ 0xfb1d
commsk  equ 0xfb1e
lstcom  equ 0xfb1f
lstmod  equ 0xfb20
prscnt  equ 0xfb35
savsp   equ 0xfb36
voicen  equ 0xfb38
savvol  equ 0xfb39
mcllen  equ 0xfb3b
mclptr  equ 0xfb3c
queuen  equ 0xfb3e
musicf  equ 0xfb3f
plycnt  equ 0xfb40
vcba    equ 0xfb41
vcbb    equ 0xfb66
vcbc    equ 0xfb8b
enstop  equ 0xfbb0 ;; <>0 if warm start enabled
basrom  equ 0xfbb1 ;; <>0 if basic is in rom
linttb  equ 0xfbb2 ;; line terminator table
fstpos  equ 0xfbca ;; first position for inlin
codsav  equ 0xfbcc ;; code save area for cursor
fnkswi  equ 0xfbcd ;; indicate which func key is displayed
fnkflg  equ 0xfbce ;; fkey which have subroutine
ongsbf  equ 0xfbd8 ;; global event flag
clikfl  equ 0xfbd9
oldkey  equ 0xfbda
newkey  equ 0xfbe5
keybuf  equ 0xfbf0 ;; key code buffer
bufend  equ 0xfc18 ;; end of key buffer
linwrk  equ 0xfc18
patwrk  equ 0xfc40
bottom  equ 0xfc48
himem   equ 0xfc4a
trptbl  equ 0xfc4c
rtycnt  equ 0xfc9a
intflg  equ 0xfc9b
pady    equ 0xfc9c
padx    equ 0xfc9d
jiffy   equ 0xfc9e
intval  equ 0xfca0
intcnt  equ 0xfca2
lowlim  equ 0xfca4
winwid  equ 0xfca5
grphed  equ 0xfca6 ;; flag for graph. char
esccnt  equ 0xfca7 ;; escape sequence counter
insflg  equ 0xfca8 ;; insert mode flag
csrsw   equ 0xfca9 ;; cursor display switch
cstyle  equ 0xfcaa ;; cursor style
capst   equ 0xfcab ;; capital status
kanast  equ 0xfcac ;; russian key status
kanamd  equ 0xfcad
flbmem  equ 0xfcae ;; 0 if loading basic programm
scrmod  equ 0xfcaf ;; screen mode
oldscr  equ 0xfcb0 ;; old screen mode
casprv  equ 0xfcb1
brdatr  equ 0xfcb2 ;; border color for paint
gxpos   equ 0xfcb3
gypos   equ 0xfcb5
grpacx  equ 0xfcb7
grpacy  equ 0xfcb9
drwflg  equ 0xfcbb
drwscl  equ 0xfcbc
drwang  equ 0xfcbd
runbnf  equ 0xfcbe ;; doing bload bsave or not
savent  equ 0xfcbf ;; start address for bsave
exptbl  equ 0xfcc1 ;; flag for expanded slot
slttbl  equ 0xfcc5 ;; current expanded slot reg
sltatr  equ 0xfcc9
sltwrk  equ 0xfd09
procnm  equ 0xfd89 ;; name of expanded statement
device  equ 0xfd99 ;; device id for cartrige 0-3
