// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function atuin_endStep(){
	
	if (keyboard_check_pressed(vk_f5))
	{
		var full = window_get_fullscreen()
		window_set_fullscreen(!full);
	}
	
	if (keyboard_check_pressed(ord("R")) && room = rJamLevel && fastReset)
	{
		wipeCurrentFile(currentSave[0]);
		audio_stop_sound(currentOST)
		pause = false;
		playSpeed = 1
		controlsEnabled = true;
		timerRunning = false;
		room_restart();
	}
}