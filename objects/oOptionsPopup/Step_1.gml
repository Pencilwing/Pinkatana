
image_xscale = lerp(image_xscale,1,0.4)

btnFullscreen.y = y;
btnVolume.y = y;
volumePips.y = y;
fullscreenX.y = y;

btnFullscreen.image_yscale = image_yscale;
btnVolume.image_yscale = image_yscale;
volumePips.image_yscale = image_yscale;
fullscreenX.image_yscale = image_yscale;

btnFullscreen.image_xscale = image_xscale;
btnVolume.image_xscale = image_xscale;
volumePips.image_xscale = image_xscale;
fullscreenX.image_xscale = image_xscale;

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
		if(selectedBtn == 0 || selectedBtn == 1) selectedBtn = 2
		else selectedBtn = 0
	}
	if ((gamepad_button_check_pressed(oAtuin.currentGamepad,gp_padl)) || (oAtuin.LAxLeft && !oAtuin.LAxLeftHold))
	{
		if(selectedBtn == 2) selectedBtn = 0
		else selectedBtn = 2
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

if(btnBack.confirmed || keyboard_check_pressed(vk_escape) || gamepad_button_check_pressed(oAtuin.currentGamepad,gp_face2))
{
	show_debug_message("yeah its this lol")
	oPauseMenu.active = true;
	oPauseMenu.btnResume.visible = true;
	oPauseMenu.btnOptions.visible = true;
	oPauseMenu.btnMainMenu.visible = true;
	oPauseMenu.btnExit.visible = true;
	oPauseMenu.visible = true;
	instance_destroy(btnVolume);
	instance_destroy(volumePips);
	instance_destroy(btnFullscreen);
	instance_destroy(fullscreenX);
	instance_destroy(btnBack);
	instance_destroy(self);
}

if(btnFullscreen.confirmed)
{
	var full = window_get_fullscreen()
	window_set_fullscreen(!full);
	
	ini_open("PINKsettings.ini")
	fullscreenState = ini_write_real("settings", "fullscreen", window_get_fullscreen());
	ini_close();
	
	btnFullscreen.confirmed = false;
}

if(btnVolume.confirmed)
{
	listenerCount = audio_get_listener_count();
	oAtuin.volumeLevel ++
	if (oAtuin.volumeLevel > 5) oAtuin.volumeLevel = 0;
	playSFX(sClickMenu);
	btnVolume.confirmed = false;
}