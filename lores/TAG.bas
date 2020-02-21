1  REM  TAG
2  REM  BY JENNY SCHMIDT
5  INPUT "Do you want instructions?";A$:A$ =  LEFT$(A$,1): IF A$ = "Y"  THEN  GOSUB 6000
7  POKE 768,160: POKE 770,173: POKE 771,48: POKE 772,192: POKE 773,162: POKE 775,202: POKE 776,208: POKE 777,253: POKE 778,136: POKE 779,208: POKE 780,245: POKE 781,96
10  GR 
20  COLOR= 15
30  HLIN 0,36 AT 0: HLIN 0,36 AT 36: VLIN 0,36 AT 0: VLIN 0,36 AT 36
40  FOR W = 1 TO 10: GOSUB 1000: NEXT W
50 CA = 11:CC = 2
60 A = 2:B = 1:C = 34:D = 31
70  COLOR= CA:X = A:Y = B: GOSUB 1050: COLOR= CC:X = C:Y = D: GOSUB 1050
75  GOSUB 2010
77  HOME 
80 K =  PEEK( -16384): POKE  -16368,0
85  VTAB 22: HTAB 15: PRINT "             ": VTAB 22: HTAB 15: PRINT "Score: ";PT
90  IF K = 197  AND  SCRN( A,B -1) < >15  THEN  COLOR= 0:X = A:Y = B: GOSUB 1050:B = B -6: GOTO 170
100  IF K = 216  AND  SCRN( A,B +5) < >15  THEN  COLOR= 0:X = A:Y = B: GOSUB 1050:B = B +6: GOTO 170
110  IF K = 211  AND  SCRN( A -2,B) < >15  THEN  COLOR= 0:X = A:Y = B: GOSUB 1050:A = A -4: GOTO 170
120  IF K = 196  AND  SCRN( A +2,B) < >15  THEN  COLOR= 0:X = A:Y = B: GOSUB 1050:A = A +4: GOTO 170
130  IF K = 201  AND  SCRN( C,D -1) < >15  THEN  COLOR= 0:X = C:Y = D: GOSUB 1050:D = D -6: GOTO 170
140  IF K = 205  AND  SCRN( C,D +5) < >15  THEN  COLOR= 0:X = C:Y = D: GOSUB 1050:D = D +6: GOTO 170
150  IF K = 202  AND  SCRN( C -2,D) < >15  THEN  COLOR= 0:X = C:Y = D: GOSUB 1050:C = C -4: GOTO 170
160  IF K = 203  AND  SCRN( C +2,D) < >15  THEN  COLOR= 0:X = C:Y = D: GOSUB 1050:C = C +4
170  IF  SCRN( A,B) = 12  OR  SCRN( C,D) = 12  THEN PT = PT -25: GOSUB 2000
180  IF  SCRN( A,B) = 4  OR  SCRN( C,D) = 4  THEN PT = PT +100: GOSUB 2000
190  IF  INT( RND(1) *15) = 0  THEN  COLOR= 0: GOSUB 1000: COLOR= 15: GOSUB 1000
200  IF  INT( RND(1) *50) = 0  AND CA = 11  THEN CA = 1:CC = 6: GOTO 300
210  IF  INT( RND(0) *50) = 0  AND CA = 1  THEN CA = 11:CC = 2
220  POKE 769, ABS(B -D) +51: POKE 774, ABS((A -C) *6) +51: CALL 768
300  COLOR= CA:X = A:Y = B: GOSUB 1050: COLOR= CC:X = C:Y = D: GOSUB 1050
305  IF A = C  AND B = D  THEN  GOSUB 3000
310  GOTO 80
1000 RH =  INT( RND(1) *7 +2):RV =  INT( RND(1) *4 +2)
1010  VLIN 6 *RV -5,6 *RV AT 4 *RH: HLIN 4 *RH -3,4 *RH AT 6 *RV
1030  RETURN 
1050  VLIN Y,Y +2 AT X: VLIN Y +3,Y +4 AT X -1: VLIN Y +3,Y +4 AT X +1: PLOT X -1,Y +1: PLOT X +1,Y +1: RETURN 
2000  COLOR= 0: FOR W = 0 TO 2: VLIN P1,P1 +4 AT P0 +W: VLIN P3,P3 +4 AT P2 +W: NEXT W
2010 P0 =  INT( RND(1) *7 +2) *4 +1:P2 =  INT( RND(1) *7 +2) *4 +1:P1 =  INT( RND(1) *4 +2) *6 +1:P3 =  INT( RND(1) *4 +2) *6 +1
2015  IF (P0 +1 = A  OR P0 +1 = C  OR P2 +1 = A  OR P2 +1 = C)  AND (P1 = B  OR P1 = D  OR P3 = B  OR P3 = D)  THEN 2010
2020  FOR W = 0 TO 2: COLOR= 4: VLIN P1,P1 +4 AT P0 +W: COLOR= 12: VLIN P3,P3 +4 AT P2 +W: NEXT W
2030  RETURN 
3000 X = A:B = Y: COLOR= 0: GOSUB 1050:X = C:Y = D: GOSUB 1050
3005  IF CA = 11  THEN BP = BP +PT: VTAB 22: HTAB 30: PRINT "            ": VTAB 22: HTAB 30: PRINT "Blue: ";BP:CA = 1:CC = 6:A = 2:B = 1:C = 34:D = 31: GOTO 3015
3010  IF CC = 6  THEN RP = RP +PT: VTAB 22: HTAB 1: PRINT "           ": VTAB 22: HTAB 1: PRINT "Red: ";RP:CA = 11:CC = 2:A = 2:B = 1:C = 34:D = 31
3015  VTAB 23: HTAB 18: PRINT "<CTRL-G><CTRL-G>Tag": FOR W = 1 TO 250: NEXT W: VTAB 23: HTAB 18: PRINT "<CTRL-G><CTRL-G>   "
3020 PT = 0:TT = TT +1: IF TT = 6  THEN  POP : GOTO 5000
3030  RETURN 
5000  HOME : IF BP >RP  THEN  PRINT "Blue wins with ";BP;" points"
5010  IF BP = RP  THEN  PRINT "It's a tie with ";BP;" points"
5020  IF BP <RP  THEN  PRINT "Red wins with ";RP;" points"
5030  INPUT "Play again?";A$:A$ =  LEFT$(A$,1): IF A$ = "Y"  THEN RP = 0:BP = 0: GOTO 10
5040  TEXT : HOME : PRINT "Bye": END 
6000  TEXT : HOME 
6010  PRINT "Tag is a chase game for two players. Theobject is for the chaser to catch the   chasee."
6020  PRINT : PRINT "Movement is through the apple keyboard. Red moves using E, S, D, and X keys.    Blue uses I, J, K, and M keys. These    keys point in the direction they move.";
6030  PRINT "  For example, I and E move players up andare at the top of the keyboard."
6040  PRINT : PRINT "The dark color always chases the light  color. Dark blue chases pink and red    chases light blue. Be prepared to changeroles when your color changes from lightto dark or from dark to light."
6050  PRINT : PRINT "Landing on a dark green square increasesthe score, but landing on a light green square decreases the score. The chaser  recieves the points in the score box    when he catches his opponent."
6060  PRINT : PRINT "Press a key to start the game.";: GET A$: PRINT A$: RETURN 
8000  PRINT  PEEK( -16384): GOTO 8000
