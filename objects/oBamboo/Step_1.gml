if(!isCloned && !hasCreated)
{
	clone = instance_create_layer(x,y,"Collisions",oBamboo);
	hasCreated = true;
	clone.isCloned = true;
	clone.daddy = self
	clone.image_angle= image_angle-180
}


if(oPlayer.onGround && !place_meeting(x,y,oPlayer))
{
	active = true;
	if(isCloned) daddy.active = true;
	else clone.active = true;
}

if(place_meeting(x,y,oSlash))
{
	active = false;
	if(isCloned) daddy.active = false;
	else clone.active = false;
}

if(place_meeting(x,y,oPlayer) && active)
{
	
	var v = vector_calc(1,image_angle)
	oPlayer.xSpeed = v[0]//*oPlayer.facing
	oPlayer.ySpeed = v[1]
}

if(active)
{
	image_index = 0;
}else{
	image_index = 1;
}