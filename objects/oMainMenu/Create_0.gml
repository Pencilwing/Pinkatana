camera = view_get_camera(view_current)
menuStartY = y;
cameraStartY = camera_get_view_y(camera)
cameraFinalY = camera_get_view_y(camera)+540
ease = 0.05
btnAmount = 4

btnPlay = instance_create_layer(x,y+50,"buttons",oButton)
btnOptions = instance_create_layer(x,y+103,"buttons",oButton)
btnCredits = instance_create_layer(x,y+150,"buttons",oButton)
btnExit = instance_create_layer(x,y+197,"buttons",oButton)

btnPlay.parentMenu = self
btnOptions.parentMenu = self
btnCredits.parentMenu = self
btnExit.parentMenu = self

btnPlay.btnId = 0
btnOptions.btnId = 1
btnCredits.btnId = 2
btnExit.btnId = 3

btnPlay.sprite_index = spr_playBtn
btnOptions.sprite_index = spr_optionsBtn
btnCredits.sprite_index = spr_creditsBtn
btnExit.sprite_index = spr_exitBtn

btnPlay.startingScale = 0.75
btnOptions.startingScale= 0.75
btnCredits.startingScale= 0.75
btnExit.startingScale = 0.75

btnPlay.roomTo = rEarthTerrain;
btnOptions.roomTo = rOptionsMenu;
btnCredits.roomTo = rCreditsMenu;

btnPlay.confirmSFX = sWoodenClapper;

selectedBtn = 0;
t = 0;