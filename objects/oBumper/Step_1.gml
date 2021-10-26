if (isBumperEnemy && bumper == -1)
{
	bumper = instance_create_layer(x,y,"Instances",oBumperRock)
	bumper.sprite_index = BumperSpr
	bumper.image_index = 0
	bumper.image_yscale = bumperYscale
	bumper.image_angle = bumperAngle
}

if(triggered)
{
	triggered = false;
}

if(place_meeting(x,y,oPlayer))
{
	triggered = true;
	
	var v = vector_calc(bounceForce,bounceAngle+90)
	oPlayer.xSpeed = v[0]
	oPlayer.ySpeed = v[1]
	oPlayer.state = states.bounce
	
	if(isBumperEnemy)
	{
		with(bumper)
		{
				image_index = 1
				var rightDust = instance_create_layer(x+6,y,"VFX",oStopDustVFX)
				var leftDust = instance_create_layer(x-6,y,"VFX",oStopDustVFX)
				rightDust.xSpeed = 1;
				rightDust.image_yscale = image_yscale;
				leftDust.xSpeed = -1;
				leftDust.image_yscale = image_yscale;
		}
	}
}