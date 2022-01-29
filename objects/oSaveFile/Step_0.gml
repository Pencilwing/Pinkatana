


time = fileTime

hours = time div 3600
time -= hours*3600
minutes = time div 60
time -= minutes*60
seconds = time

hours = string(hours)
minutes = string(minutes)
seconds = string(seconds)
			
if(string_length(hours) <= 1) hours = "0" + hours
if(string_length(minutes) <= 1) minutes = "0" + minutes
if(string_length(seconds) <= 1) seconds = "0" + seconds
			
victory = false;
			
fileTimeStr = hours+":"+minutes+":"+ seconds;