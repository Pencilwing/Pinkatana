camera = view_get_camera(view_current)
cameraStartY = camera_get_view_y(camera)
cameraFinalY = camera_get_view_y(camera)+540
ease = 0.05
btnAmount = 3
endSequence = false;

btnBack = instance_create_layer(540,300,"buttons",oButton)
btnVolume = instance_create_layer(x,y,"buttons",oButton)
btnFullscreen = instance_create_layer(x,y,"buttons",oButton)

btnBack.parentMenu = self
btnVolume.parentMenu = self
btnFullscreen.parentMenu = self

btnFullscreen.btnId = 0
btnVolume.btnId = 1
btnBack.btnId = 2

btnBack.sprite_index = spr_backBtn;
btnVolume.sprite_index = spr_optionsVolume;
btnFullscreen.sprite_index = spr_optionsFullscreen;

btnVolume.smallScale = 1
btnVolume.bigScale = 1
btnFullscreen.smallScale = 1
btnFullscreen.bigScale = 1

btnBack.roomTo = rMainMenu;

btnVolume.confirmSFX = sNone;

selectedBtn = 0;
t = 0;

volumePips = instance_create_layer(x,y,"buttons",oVolumePips)
fullscreenX = instance_create_layer(x,y,"buttons",oFullscreenX)