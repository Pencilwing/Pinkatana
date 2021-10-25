function cam_endStep() {
	target1 = oPlayer;
	target2 = oPlayer;

	if(!oAtuin.pause)
	{
		/// stays in the middle
		if(target1.x <= target2.x){
			x = lerp(x,target1.x + ((target2.x - target1.x)/2),0.1);
		}else {
			x = lerp(x,target2.x + ((target1.x - target2.x)/2),0.1);
		}


		if(target1.y <= target2.y){
			y = lerp(y,target2.y + ((target1.y - target2.y)/2),0.1);
		}else {
			y = lerp(y,target1.y + ((target2.y - target1.y)/2),0.1);
		}
		
		oEarthBG.x = x
		oEarthBG.y = y
		
		camera_set_view_pos(view_camera[0],x-320,y-180)
		
		
		/*
		if(oAtuin.controlScheme == 0)
		{
			if(mouse_check_button(mb_right))
			{
				camera_set_view_size(camera,lerp(camera_get_view_width(camera),zoomOutX,0.1),
											lerp(camera_get_view_height(camera),zoomOutY,0.1))
			}else{
				camera_set_view_size(camera,lerp(camera_get_view_width(camera),zoomInX,0.1),
											lerp(camera_get_view_height(camera),zoomInY,0.1))
			}
		}
		*/
	}
}

