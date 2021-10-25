function updateShadow()
{
	var array = collision_line_point(owner.x,owner.y,owner.x,owner.y+400,oBlocker,true, true);
	x = owner.x
	y = array[2]
}