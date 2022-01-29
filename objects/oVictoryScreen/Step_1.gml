t ++

if(image_alpha < 1)
{image_alpha += 0.01}

if (t > 500)
{
	oAtuin.timerVisible = timerWasVisible;
	oAtuin.pause = false;
	audio_sound_gain(oAtuin.currentOST,0,2000)
	room_goto(rTitleScreen)
}