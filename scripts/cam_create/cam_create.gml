function cam_create() {

	//Setting up object target information
	camera_set_view_target(view_camera[0], self);
	camera_set_view_speed(view_camera[0], -1, -1);

}
