btnAmount = 3;

btnBack = instance_create_depth(x+220,y+140,50,oButton)
btnVolume = instance_create_depth(x,y,50,oButton)
btnFullscreen = instance_create_depth(x,y,50,oButton)
volumePips = instance_create_depth(x,y,50,oVolumePips)
fullscreenX = instance_create_depth(x,y,50,oFullscreenX)

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

btnVolume.confirmSFX = sNone;

selectedBtn = 0;
t = 0;

