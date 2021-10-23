/// @description Insert description here
// You can write your code in this editor
x =  camera_get_view_x(view_camera[0])+view_xport[0]+(view_wport[0]/2)/2
y =  camera_get_view_y(view_camera[0])+view_yport[0]+(view_hport[0]/2)/2


btnResume.y = y+resumeY;
btnOptions.y = y+optionsY;
btnMainMenu.y = y+mainMenuY;
btnExit.y = y+exitY;

btnResume.x = x
btnOptions.x = x
btnMainMenu.x = x
btnExit.x = x

if(oAtuin.controlScheme=1 && active)
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

if(btnOptions.confirmed && !instance_exists(oOptionsPopup))
{
	
	btnResume.visible = false;
	btnOptions.visible = false;
	btnMainMenu.visible = false;
	btnExit.visible = false;
	visible = false;
	active = false;
	btnOptions.confirmed = false;
	instance_create_depth(x,y,60,oOptionsPopup);
}

btnResume.active = active
btnOptions.active = active
btnMainMenu.active = active
btnExit.active = active


if(btnMainMenu.confirmed)
{
	oAtuin.controlsEnabled = true;
	oAtuin.playSpeed = 1;
	room_goto(rTitleScreen);
}

if(btnExit.confirmed)
{
	game_end();
}

if((btnResume.confirmed || keyboard_check_pressed(vk_escape)
	|| gamepad_button_check_pressed(oAtuin.currentGamepad, gp_start) 
	|| gamepad_button_check_pressed(oAtuin.currentGamepad,gp_face2)) && active)
{
	oAtuin.controlsEnabled = true;
	oAtuin.playSpeed = 1;
	instance_destroy(btnResume);
	instance_destroy(btnOptions);
	instance_destroy(btnMainMenu);
	instance_destroy(btnExit);
	instance_destroy(blackBG);
	instance_destroy(self);
}

