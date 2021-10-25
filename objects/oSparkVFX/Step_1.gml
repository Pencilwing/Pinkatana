event_inherited();

t = t+1*oAtuin.playSpeed
image_speed = oAtuin.playSpeed

image_angle = point_direction(x,y,x+xSpeed,y+ySpeed);
if(t >= lifetime)
{
	instance_destroy(self);
}