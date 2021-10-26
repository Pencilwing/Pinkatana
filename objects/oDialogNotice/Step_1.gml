if(t <= 60)
{
	image_index = 0

}
if(t == 60)
{
	image_xscale = 0.7
	image_yscale = 1.3
}

if(t >= 60)
{
	if(oAtuin.controlScheme == 0) image_index = 1;
	else image_index = 2;
}

if (t > 120)
{
	t = 0;
	image_xscale = 0.7
	image_yscale = 1.3
}

t++

image_xscale = approach(image_xscale,1,0.1)
image_yscale = approach(image_yscale,1,0.1)