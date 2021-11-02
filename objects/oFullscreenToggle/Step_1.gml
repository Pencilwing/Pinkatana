
if(oAtuin.controlScheme=1)
{
	if ((gamepad_button_check_pressed(oAtuin.currentGamepad,gp_padr)) || (oAtuin.LAxRight && !oAtuin.LAxRightHold))
	{
		selectedBtn ++
	}
	if ((gamepad_button_check_pressed(oAtuin.currentGamepad,gp_padl)) || (oAtuin.LAxLeft && !oAtuin.LAxLeftHold))
	{
		selectedBtn --
	}
	
	if(selectedBtn >= btnAmount)
	{
		selectedBtn = 0
	}
	
	if(selectedBtn < 0)
	{
		selectedBtn = btnAmount-1
	}
}

if(btnNo.confirmed)
{
	room_goto_next();
}

if(btnYes.confirmed)
{
	var full = window_get_fullscreen()
	window_set_fullscreen(!full);
	btnYes.confirmed = false;
	room_goto_next();
}
