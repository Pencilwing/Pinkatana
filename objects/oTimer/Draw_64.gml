draw_set_font(fTimer);


if(hour <10)
{
	 hour = "0"+string(hour)
}

if(minute <10)
{
	 minute = "0"+string(minute)
}

if(second <10)
{
	 second = "0"+string(second)
}

draw_text_outlined(30,5,$13052E,c_white,string(hour)+":"+string(minute)+":"+string(second),5);
