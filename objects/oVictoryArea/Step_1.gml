if(place_meeting(x,y,oPlayer))
{
	oAtuin.victory = true;
	oPlayer.xSpeed = 3
	//oAtuin.playSpeed = 0;
	oAtuin.controlsEnabled = false;
	with(oAtuin){finalTime = victoryTimer(); victory = false;}
	instance_create_layer(camera_get_view_x(view_camera[0]),camera_get_view_y(view_camera[0]),"HUD",oVictoryScreen)
	oGuide.visible = false;
	instance_destroy(id)
	
}