if(place_meeting(x,y,oPlayer))
{
	var v = vector_calc(bounceForce,bounceAngle+90)
	oPlayer.xSpeed = v[0]
	oPlayer.ySpeed = v[1]
	oPlayer.state = states.bounce
}