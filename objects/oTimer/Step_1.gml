time = current_time;

if(time == 0)
{
	startingTime = current_time;
}

if(timerRunning)
{
	//returns time in seconds
	time = floor((current_time - startingTime) /1000)
	
	hour = time div 3600;
	minute = (time-(hour*3600)) div 60;
	second = time - hour*3600 - minute*60;
	
}