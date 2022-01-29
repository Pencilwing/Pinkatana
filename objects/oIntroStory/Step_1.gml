t++;
if(t > 15 && sprite_index = spr_solid)
{
	sprite_index = spr_introStory01
	image_alpha = 0
}

if(sprite_index == spr_introStory01)
{
	if(image_alpha<1 && !next)image_alpha += 0.07
	
	sprite_index = spr_introStory01
	if(t < 60*5) x = x + x2/(60*5)
	
	if(t > 60*7 || next)
	{
		next = true;
		image_alpha = image_alpha-0.04
		if(image_alpha <= 0) 
		{
			sprite_index = spr_introStory02;	
			x = 0; y = y1;
			t = 0
			next = false;
		}
	}
}

if(sprite_index = spr_introStory02)
{
	if(image_alpha<1 && !next)image_alpha += 0.07
	
	sprite_index = spr_introStory02
	if(t < 60*5) y = y + y2/(60*5)
	
	if(t > 60*7 || next)
	{
		next = true;
		image_alpha = image_alpha-0.04
		if(image_alpha <= 0) 
		{
			sprite_index = spr_introStory03;	
			x = 0; y = z1;
			t = 0
			next = false;
		}
	}
}


if(sprite_index = spr_introStory03)
{
	if(image_alpha<1 && !next)image_alpha += 0.07
	sprite_index = spr_introStory03
	if(t < 60*5) y = y + z2/(60*5)
	
	if(t > 60*7 || next)
	{
		next = true;
		image_alpha = image_alpha-0.03
		if(image_alpha <= -1) room_goto(rJamLevel)
	}
}

if(mouse_check_button_pressed(mb_left) || gamepad_button_check_pressed(oAtuin.currentGamepad,gp_face1))
{
	next = true;
}