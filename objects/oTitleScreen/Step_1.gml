/// @description Insert description here
// You can write your code in this editor


if (t >= 100 && !instance_exists(oTitle))
{
	image_alpha = 0;
	instance_create_layer(x,y,"press",oPressAny)
	var title = instance_create_layer(x,y,"press",oTitle)
	title.image_xscale = 0.5
}


t ++