/// @description Insert description here
// You can write your code in this editor

screenFadeSequence(fadeIn,remainTime,fadeOut);

if (t > fadeIn+remainTime+fadeOut)
{
	room_goto_next();
}