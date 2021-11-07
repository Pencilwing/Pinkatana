// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function playRandomSFX(soundName,variations){
	var randomSFX = irandom_range(1,variations)
	var sound = asset_get_index(string(soundName + string(randomSFX)))
	show_debug_message(string(soundName + string(randomSFX)))
	playSFX(sound)
}