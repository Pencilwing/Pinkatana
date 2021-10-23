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
	}

}

instance_deactivate_all(true);
instance_activate_object(oAtuin);
var _vx = camera_get_view_x(view_camera[0]);
var _vy = camera_get_view_y(view_camera[0]);
var _vw = camera_get_view_width(view_camera[0]);
var _vh = camera_get_view_height(view_camera[0]);
instance_activate_region(_vx - 64, _vy - 64, _vw + 128, _vh + 128, false);