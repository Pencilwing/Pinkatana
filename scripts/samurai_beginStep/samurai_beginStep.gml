function samurai_beginStep() {

	//inherit code from physics
	event_inherited();
	
	left = getInput("left")
	right = getInput("right")
	up = getInput("up")
	down = getInput("down")
		
	slash = getInput("slash");
	interact = getInput("interact")
		
	pause = getInput("pause")
	confirm = getInput("confirm")
	back = getInput("back")
	
	if (sign(xSpeed)!=0) facing = sign(xSpeed)
	image_xscale = 1*facing
	image_speed = oAtuin.playSpeed
	

	
	if(place_meeting(x,y,trigger1))
	{
	 oDersuke.chk = 1
	}
	
	if(place_meeting(x,y,trigger2))
	{
	 oDersuke.chk = 2
	}
	
	if(place_meeting(x,y,trigger3))
	{
	 oDersuke.chk = 3
	}
	
	switch(state)
	
	{
		case states.idle:
		if (onGround)
		{
			if(abs(xSpeed) >= 2)
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
