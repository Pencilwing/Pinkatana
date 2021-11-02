camera = view_get_camera(view_current)
cameraStartY = camera_get_view_y(camera)
cameraFinalY = camera_get_view_y(camera)+540
btnAmount = 2
endSequence = false;

btnYes = instance_create_layer(540,300,"buttons",oButton)
btnNo = instance_create_layer(x,y,"buttons",oButton)

btnYes.parentMenu = self
btnNo.parentMenu = self

btnYes.btnId = 0
btnNo.btnId = 1

btnYes.sprite_index = spr_backBtn;
btnNo.sprite_index = spr_optionsVolume;

selectedBtn = 0;
t = 0;
