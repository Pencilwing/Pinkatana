
function playSFX(sound){
	volume = oAtuin.volumeLevel*0.2
	audio_sound_gain(sound,volume,0)
	audio_play_sound(sound,1,false)
}