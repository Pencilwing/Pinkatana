chk = 1

x1 = 574
y1 = 1568

x2 = 2519
y2 = 1388

x3 = 3956
y3 = 1112.92

chk1new = true;
chk2new = true;
chk3new = true;

lastPosX = x;
facing = 1;

t = 0

depth = oPlayer.depth+1

characterName = "Dersuke"

Line11 = "Pink!"
Line12 = "Off to rescue Purple? \n(WASD or the Left Analog to move around)"
Line13 = "Remember you can slash to get over obstacles! \n(LMB or the R button) "
Line21 = "Ah right, forgot to mention. You can bounce off \nof surfaces with your slash."
Line22 = "Different surfaces will send you flying at \ndifferent speeds!"
Line31 = "A cherry blossom! You can slash in the air if \nyou nab them when flying around."

Dialog1[0] = Line11
Dialog1[1] = Line12
Dialog1[2] = Line13

Dialog2[0] = Line21
Dialog2[1] = Line22

Dialog3[0] = Line31

dialogRunning = false;

CurrentDialog = Dialog1
currentLine = 1