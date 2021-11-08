camera = view_get_camera(view_current)
cameraStartY = camera_get_view_y(camera)
cameraFinalY = camera_get_view_y(camera)+540
btnAmount = 2
endSequence = false;


btnYes = instance_create_layer(x,y,"buttons",oButton)
btnNo = instance_create_layer(x,y,"buttons",oButton)

btnYes.parentMenu = self
btnNo.parentMenu = self

btnYes.btnId = 0
btnNo.btnId = 1

btnYes.bigScale = 1
btnNo.bigScale = 1

btnYes.sprite_index = spr_promptYes;
btnNo.sprite_index = spr_promptNo;

selectedBtn = 0;
t = 0;


ini_open("PINKsettings.ini")
fullscreenState = ini_read_real("settings", "fullscreen", -1);
ini_close();

if(fullscreenState != -1)
{
	window_set_fullscreen(fullscreenState);
	room_goto_next();
}

