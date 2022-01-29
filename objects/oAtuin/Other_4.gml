startingTime = current_time;

if (room = rJamLevel)
{
	if(currentSave[1] != 1)
	{
		oPlayer.x = currentSave[2]
		oPlayer.y = currentSave[3]
		oCam.x = oPlayer.x;
		oCam.y = oPlayer.y;
		time = currentSave[5]
		hours  = time div 3600
		time -= hours*3600
		minutes = time div 60
		time -= minutes*60
		seconds = time
	}else{
		time = 0;
		hours = 0;
		minutes = 0;
		seconds = 0;
		milliseconds = 0;
	}
	playOST(sSakuya1);
}