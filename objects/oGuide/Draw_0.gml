if(!oAtuin.pause)
{
	x1 = oPlayer.x
	y1 = oPlayer.y
	x2 = oPlayer.directionX
	y2 = oPlayer.directionY
}

if(oPlayer.onGround || oPlayer.slashes>0) 
{
	draw_sprite_ext(spr_arrow,0,x,y,1,1,point_direction(x1,y1,x2,y2),c_white,1)
}else{
	draw_sprite_ext(spr_arrow,0,x,y,1,1,point_direction(x1,y1,x2,y2),c_black,1)
}
