	
	var array = collision_line_point(owner.x,owner.y,owner.x,owner.y+400,oBlocker,true, true);
	x = owner.x
	y = array[2]
	
	image_xscale = 1*((min(y-owner.y,160)-160)/160)