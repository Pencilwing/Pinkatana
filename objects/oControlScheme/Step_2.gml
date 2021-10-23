t -- 

alpha = t/lifetime

if(oAtuin.controlScheme != sprite)
{
	sprite = oAtuin.controlScheme;
	t = lifetime;
}

if (t <= 0)
{
	instance_destroy(self);
}

