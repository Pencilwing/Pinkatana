
function playOST(sound){
	volume = (oAtuin.musicLevel*0.2)*(oAtuin.volumeLevel*0.2)
	oAtuin.currentOST = sound;
	audio_sound_gain(sound,volume,0)
	audio_play_sound(sound,1,true)
}