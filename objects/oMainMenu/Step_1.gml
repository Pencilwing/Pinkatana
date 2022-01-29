/// @description Insert description here
// You can write your code in this editor
ease = ease*1.05

if(oAtuin.lastRoom == rTitleScreen)
{
	if(camera_get_view_y(camera) <= cameraStartY + cameraFinalY-270)
	{
		camera_set_view_pos(camera,camera_get_view_x(camera),lerp(camera_get_view_y(camera),cameraFinalY,ease));
	}else{
		if(cameraFinalY - camera_get_view_y(camera) > 1)
		{
			camera_set_view_pos(camera,camera_get_view_x(camera),lerp(camera_get_view_y(camera),cameraFinalY,0.1));
		}else
		{
			camera_set_view_pos(camera,camera_get_view_x(camera),cameraFinalY)
		}
	}
}else{
	camera_set_view_pos(camera,camera_get_view_x(camera),cameraFinalY)
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
	
	if(selectedBtn >= btnAmount)
	{
		selectedBtn = 0
	}
	
	if(selectedBtn < 0)
	{
		selectedBtn = 3
	}
}

if(btnPlay.confirmed)
{
	oAtuin.timerRunning = false;
	room_goto(btnPlay.roomTo);
}

if(btnOptions.confirmed)
{
	
	instance_create_depth(x,y+120,90,oInputMappingPopup);
	btnPlay.visible = false;
	btnOptions.visible = false;
	btnCredits.visible = false;
	btnExit.visible = false;
	btnPlay.active = false;
	btnOptions.active= false;
	btnCredits.active = false;
	btnExit.active = false;
	visible = false;
	active = false;
	btnOptions.confirmed = false;
	/*
	room_goto(btnOptions.roomTo);
	btnOptions.confirmed = false;
	*/
}

if(btnCredits.confirmed)
{
	room_goto(btnCredits.roomTo);
}

if(btnExit.confirmed)
{
	game_end();	
}
