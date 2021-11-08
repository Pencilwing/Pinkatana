
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
	ini_open("PINKsettings.ini")
	fullscreenState = ini_write_real("settings", "fullscreen", 0);
	ini_close();
	window_set_fullscreen(false);
	btnNo.confirmed = false;

	room_goto_next();
}

if(btnYes.confirmed)
{
	ini_open("PINKsettings.ini")
	fullscreenState = ini_write_real("settings", "fullscreen", 1);
	ini_close();
	
	window_set_fullscreen(true);
	btnYes.confirmed = false;
	room_goto_next();
}
