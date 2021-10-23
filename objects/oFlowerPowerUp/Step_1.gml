t = t - 1*oAtuin.playSpeed

if(t <= 0 && state = "open")
{
	var petal = instance_create_layer(x,y+5,"VFX",oPetalVFX);
	petal.image_index = random_range(1,10)
	t = petalTimer;
}

if(oPlayer.onGround && state = "closed")
{
	state = "open"
	image_xscale = 1.3
	image_yscale = 1.3
}

if(state = "closed")
{
	sprite_index = spr_flowerClosed
}else{
	sprite_index = spr_flowerOpen
}

image_yscale=lerp(image_yscale,1,0.1*oAtuin.playSpeed)
image_xscale=lerp(image_xscale,1,0.1*oAtuin.playSpeed)