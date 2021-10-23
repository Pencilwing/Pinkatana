// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function screenFadeSequence(fadeIn,remainTime,fadeOut)
{
	t ++
			show_debug_message(t)
	
	if (t < fadeIn)
	{
		alpha = t/fadeIn
	}
	
	if (t > fadeIn && (t <= (fadeIn+remainTime))){
		alpha = 1
	}
	
	if (t > fadeIn+remainTime && t <= fadeIn+remainTime+fadeOut){
		alpha = abs(((t-remainTime-fadeIn)/fadeOut)-1)
	}
}