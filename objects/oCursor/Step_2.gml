x=mouse_x
y=mouse_y

if (oAtuin.controlScheme)
{
	visible = false;
}else{
	visible = true;
}

if(instance_exists(oCam))
{
	if (oAtuin.pause)
	{
		sprite_index = spr_cursorUI
	}else{
		sprite_index = spr_cursorGameplay
	}
}