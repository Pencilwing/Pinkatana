t = t+1*oAtuin.playSpeed
image_speed = oAtuin.playSpeed
y= y+fallSpeed*oAtuin.playSpeed
if(t >= lifetime)
{
	instance_destroy(self);
}