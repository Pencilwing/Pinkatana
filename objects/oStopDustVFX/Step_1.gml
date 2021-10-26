t = t+1*oAtuin.playSpeed
image_speed = oAtuin.playSpeed
x = x + xSpeed
if(t >= lifetime)
{
	instance_destroy(self);
}