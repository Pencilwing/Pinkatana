
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
	if(parentMenu != 0)instance_create_layer(x,y,"UI",parentMenu)
	instance_destroy(id);
}

if(btnYes.confirmed)
{
	if(nextRoom == "ExitGame"){ game_end();
	}else if(nextRoom != 0){ room_goto(nextRoom);}
}
