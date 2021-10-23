function samurai_beginStep() {

	//inherit code from physics
	event_inherited();
	
	if (sign(xSpeed)!=0) facing = sign(xSpeed)
	image_xscale = 1*facing
	image_speed = oAtuin.playSpeed
	
	switch(state)
	
	{
		case states.idle:
		if (onGround)
		{
			if(abs(xSpeed) >= 3)
			{
				sprite_index = spr_samurai_slide
			}else{
				sprite_index = spr_samurai
			}
		}else{
			if (ySpeed >= 2)
			{
				sprite_index = spr_samurai_rise
			}else{
				sprite_index = spr_samurai_fall
			}
		}
		break;
		
		case states.bounce:
		if (onGround)
		{
			sprite_index = spr_samurai_slide
		}else{
		sprite_index = spr_samurai_roll
		}
		break;
	
	}
	
}
