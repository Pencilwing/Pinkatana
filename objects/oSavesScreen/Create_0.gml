camera = view_get_camera(view_current)
cameraStartY = camera_get_view_y(camera)
cameraFinalY = camera_get_view_y(camera)+540
ease = 0.05
btnAmount = 7
endSequence = false;


btnFile1 = instance_create_layer(x+140,y+220,"buttons",oSaveFile)
btnFile2 = instance_create_layer(x+320,y+220,"buttons",oSaveFile)
btnFile3 = instance_create_layer(x+500,y+220,"buttons",oSaveFile)
btnWipe1 = instance_create_depth(x+140,y+280,90,oButton)
btnWipe2 = instance_create_depth(x+320,y+280,90,oButton)
btnWipe3 = instance_create_depth(x+500,y+280,90,oButton)
btnBack = instance_create_layer(540,300,"buttons",oButton)

btnFile1.parentMenu = self
btnFile2.parentMenu = self
btnFile3.parentMenu = self
btnWipe1.parentMenu = self
btnWipe2.parentMenu = self
btnWipe3.parentMenu = self
btnBack.parentMenu = self


btnFile1.btnId = 0
btnFile2.btnId = 1
btnFile3.btnId = 2
btnWipe1.btnId = 3
btnWipe2.btnId = 4
btnWipe3.btnId = 5
btnBack.btnId = 6


btnFile1.fileNumber = "File1"
btnFile1.filePercent = min(floor(oAtuin.save1[2]/205),100)
btnFile1.fileLocation = oAtuin.save1[4]
btnFile1.fileTime = oAtuin.save1[5]
btnFile1.sprite_index = spr_saveBG;


btnFile2.fileNumber = "File2"
btnFile2.filePercent = min(floor(oAtuin.save2[2]/205),100)
btnFile2.fileLocation = oAtuin.save2[4]
btnFile2.fileTime = oAtuin.save2[5]
btnFile2.sprite_index = spr_saveBG;


btnFile3.fileNumber = "File3"
btnFile3.filePercent = min(floor(oAtuin.save3[2]/205),100)
btnFile3.fileLocation = oAtuin.save3[4]
btnFile3.fileTime = oAtuin.save3[5]
btnFile3.sprite_index = spr_saveBG;


btnBack.sprite_index = spr_backBtn;

btnWipe1.sprite_index = spr_saveWipe;
btnWipe2.sprite_index = spr_saveWipe;
btnWipe3.sprite_index = spr_saveWipe;


btnBack.roomTo = rMainMenu;


selectedBtn = 0;
t = 0;