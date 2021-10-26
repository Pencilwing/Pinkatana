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

Line1 = "Off to rescue Purple?"
Line2 = "Remember you can slash to move around! \n(LMB or the A button) "
Line3 = "Ah right, forgot to mention. You can bounce off \nof surfaces with your slash."
Line4 = "Different surfaces will send you flying at \ndifferent speeds!"
Line5 = "A cherry blossom! You can slash in the air if \nyou nab them when flying around."

Dialog1[0] = Line1
Dialog1[1] = Line2

Dialog2[0] = Line3
Dialog2[1] = Line4

Dialog3[0] = Line5

dialogRunning = false;

CurrentDialog = Dialog1
currentLine = 1