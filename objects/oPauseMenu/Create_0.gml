camera = view_get_camera(view_current)
menuStartY = y;
cameraStartY = camera_get_view_y(camera)
cameraFinalY = camera_get_view_y(camera)
btnAmount = 4
active = true;

resumeY = -25
optionsY = 20
mainMenuY = 62
exitY = 102

btnResume = instance_create_layer(x,y+resumeY,"buttons",oButton)
btnOptions = instance_create_layer(x,y+optionsY,"buttons",oButton)
btnMainMenu = instance_create_layer(x,y+mainMenuY,"buttons",oButton)
btnExit = instance_create_layer(x,y+exitY,"buttons",oButton)
blackBG = instance_create_layer(x,y,"UI",oSolid)

blackBG.image_alpha = 0.3

btnResume.parentMenu = self
btnOptions.parentMenu = self
btnMainMenu.parentMenu = self
btnExit.parentMenu = self

btnResume.btnId = 0
btnOptions.btnId = 1
btnMainMenu.btnId = 2
btnExit.btnId = 3

btnResume.sprite_index = spr_pauseResume
btnOptions.sprite_index = spr_pauseOptions
btnMainMenu.sprite_index = spr_pauseMainMenu
btnExit.sprite_index = spr_pauseQuit


selectedBtn = 0;
t = 0;