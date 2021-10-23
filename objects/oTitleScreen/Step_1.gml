/// @description Insert description here
// You can write your code in this editor


show_debug_message(sprite_get_number(spr_introSequence))
show_debug_message(t)

if (t >= sprite_get_number(spr_introSequence) && sprite_index != spr_titleScreen)
{
	sprite_index = spr_titleScreen
	instance_create_layer(x,y,"press",oPressAny)
}

if(sprite_index == spr_introSequence) t ++