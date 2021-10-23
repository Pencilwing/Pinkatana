if (y != 0 && !endSequence)
{
	y = lerp(y,0,0.1)
}

if(oAtuin.controlScheme=1)
{
	if ((gamepad_button_check_pressed(oAtuin.currentGamepad,gp_padd)) || (oAtuin.LAxDown && !oAtuin.LAxDownHold))
	{
		selectedBtn ++
	}
	if ((gamepad_button_check_pressed(oAtuin.currentGamepad,gp_padu)) || (oAtuin.LAxUp && !oAtuin.LAxUpHold))
	{
		selectedBtn --
	}
	
		if ((gamepad_button_check_pressed(oAtuin.currentGamepad,gp_padr)) || (oAtuin.LAxRight && !oAtuin.LAxRightHold))
	{
		if(selectedBtn == 0 ) selectedBtn = 1
		else selectedBtn = 0
	}
	if ((gamepad_button_check_pressed(oAtuin.currentGamepad,gp_padl)) || (oAtuin.LAxLeft && !oAtuin.LAxLeftHold))
	{
		if(selectedBtn == 1) selectedBtn = 0
		else selectedBtn = 1
	}
	
	if(selectedBtn > btnAmount)
	{
		selectedBtn = 0
	}
	
	if(selectedBtn < 0)
	{
		selectedBtn = 1
	}
}

if(btnBack.confirmed || keyboard_check_pressed(vk_escape) || gamepad_button_check_pressed(oAtuin.currentGamepad,gp_face2))
{
	endSequence = true
}

if (endSequence = true)
{
	y = lerp(y,380,0.1)
	if (y >= 360)
	{
		room_goto(rMainMenu);
	}
}
