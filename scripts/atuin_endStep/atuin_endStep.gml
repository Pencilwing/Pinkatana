// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function atuin_endStep(){


	if(!pause && instance_exists(oCam))
	{
		if (keyboard_check_pressed(vk_escape) || gamepad_button_check_pressed(currentGamepad,gp_start))
		{
			instance_create_layer(oCam.x,oCam.y,"UI",oPauseMenu)
			pause = true;
			controlsEnabled = false;
			playSpeed = 0;
			show_debug_message("i run")
		}
	}
	
	if(!instance_exists(oPauseMenu))
	{
		pause = false;
	}
	
	if (keyboard_check_pressed(vk_f5))
	{
		var full = window_get_fullscreen()
		window_set_fullscreen(!full);
	}
}