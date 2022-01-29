camera = view_get_camera(view_current)
cameraStartY = camera_get_view_y(camera)
cameraFinalY = camera_get_view_y(camera)+540
ease = 0.05
btnAmount = 23
wait = true;
endSequence = false;

show_debug_message("created input menu")


btnKb =		instance_create_layer(x,y+0,"buttons",oButton)
btnGp =		instance_create_layer(x+100,y+0,"buttons",oButton)

inputBtns = ds_list_create()

KbLeft =	instance_create_layer(x,y+10,"buttons",oButton)
KbRight=	instance_create_layer(x,y+10,"buttons",oButton)
KbUp=		instance_create_layer(x,y+10,"buttons",oButton)
KbDown=		instance_create_layer(x,y+10,"buttons",oButton)

KbAim=		instance_create_layer(x,y+10,"buttons",oButton)
KbSlash=    instance_create_layer(x,y+10,"buttons",oButton)
KbInteract= instance_create_layer(x,y+10,"buttons",oButton)

KbPause=    instance_create_layer(x,y+10,"buttons",oButton)
KbConfirm=  instance_create_layer(x,y+10,"buttons",oButton)
KbBack=	    instance_create_layer(x,y+10,"buttons",oButton)

GpLeft =	instance_create_layer(x+100,y+10,"buttons",oButton)
GpRight=	instance_create_layer(x+100,y+10,"buttons",oButton)
GpUp=		instance_create_layer(x+100,y+10,"buttons",oButton)
GpDown=		instance_create_layer(x+100,y+10,"buttons",oButton)

GpAim=		instance_create_layer(x+100,y+10,"buttons",oButton)
GpSlash=    instance_create_layer(x+100,y+10,"buttons",oButton)
GpInteract= instance_create_layer(x+100,y+10,"buttons",oButton)

GpPause=	instance_create_layer(x+100,y+10,"buttons",oButton)
GpConfirm=	instance_create_layer(x+100,y+10,"buttons",oButton)
GpBack=		instance_create_layer(x+100,y+10,"buttons",oButton)


KbLeftDisplay =		instance_create_layer(x-50,y-90,"cursor",oButton)
KbRightDisplay=		instance_create_layer(x-50,y-70,"cursor",oButton)
KbUpDisplay=		instance_create_layer(x-50,y-50,"cursor",oButton)
KbDownDisplay=		instance_create_layer(x-50,y-30,"cursor",oButton)

KbAimDisplay=		instance_create_layer(x-50,y-10,"cursor",oButton)
KbSlashDisplay=     instance_create_layer(x-50,y+10,"cursor",oButton)
KbInteractDisplay=  instance_create_layer(x-50,y+30,"cursor",oButton)

KbPauseDisplay=     instance_create_layer(x-50,y+50,"cursor",oButton)
KbConfirmDisplay=   instance_create_layer(x-50,y+70,"cursor",oButton)
KbBackDisplay=	    instance_create_layer(x-50,y+90,"cursor",oButton)

GpLeftDisplay=		instance_create_layer(x+100,y-90,"cursor",oButton)
GpRightDisplay=		instance_create_layer(x+100,y-70,"cursor",oButton)
GpUpDisplay=		instance_create_layer(x+100,y-50,"cursor",oButton)
GpDownDisplay=		instance_create_layer(x+100,y-30,"cursor",oButton)

GpAimDisplay=		instance_create_layer(x+100,y-10,"cursor",oButton)
GpSlashDisplay=     instance_create_layer(x+100,y+10,"cursor",oButton)
GpInteractDisplay=  instance_create_layer(x+100,y+30,"cursor",oButton)

GpPauseDisplay=		instance_create_layer(x+100,y+50,"cursor",oButton)
GpConfirmDisplay=	instance_create_layer(x+100,y+70,"cursor",oButton)
GpBackDisplay=		instance_create_layer(x+100,y+90,"cursor",oButton)

KbLeftDisplay.sprite_index=		inputSpriteLookup(ds_map_find_value(oAtuin.inputInfo,"kb_left"))
KbRightDisplay.sprite_index=	inputSpriteLookup(ds_map_find_value(oAtuin.inputInfo,"kb_right"))
KbUpDisplay.sprite_index=		inputSpriteLookup(ds_map_find_value(oAtuin.inputInfo,"kb_up"))
KbDownDisplay.sprite_index=		inputSpriteLookup(ds_map_find_value(oAtuin.inputInfo,"kb_down"))

KbAimDisplay.sprite_index=		inputSpriteLookup(ds_map_find_value(oAtuin.inputInfo,"kb_aim"))
KbSlashDisplay.sprite_index=    inputSpriteLookup(ds_map_find_value(oAtuin.inputInfo,"kb_slash"))
KbInteractDisplay.sprite_index= inputSpriteLookup(ds_map_find_value(oAtuin.inputInfo,"kb_interact"))

KbPauseDisplay.sprite_index=    inputSpriteLookup(ds_map_find_value(oAtuin.inputInfo,"kb_pause"))
KbConfirmDisplay.sprite_index=  inputSpriteLookup(ds_map_find_value(oAtuin.inputInfo,"kb_confirm"))
KbBackDisplay.sprite_index=	    inputSpriteLookup(ds_map_find_value(oAtuin.inputInfo,"kb_back"))

GpLeftDisplay.sprite_index=		inputSpriteLookup(ds_map_find_value(oAtuin.inputInfo,"gp_left"))
GpRightDisplay.sprite_index=	inputSpriteLookup(ds_map_find_value(oAtuin.inputInfo,"gp_right"))
GpUpDisplay.sprite_index=		inputSpriteLookup(ds_map_find_value(oAtuin.inputInfo,"gp_up"))
GpDownDisplay.sprite_index=		inputSpriteLookup(ds_map_find_value(oAtuin.inputInfo,"gp_down"))

GpAimDisplay.sprite_index=		inputSpriteLookup(ds_map_find_value(oAtuin.inputInfo,"gp_aim"))
GpSlashDisplay.sprite_index=    inputSpriteLookup(ds_map_find_value(oAtuin.inputInfo,"gp_slash"))
GpInteractDisplay.sprite_index= inputSpriteLookup(ds_map_find_value(oAtuin.inputInfo,"gp_interact"))

GpPauseDisplay.sprite_index=	inputSpriteLookup(ds_map_find_value(oAtuin.inputInfo,"gp_pause"))
GpConfirmDisplay.sprite_index=	inputSpriteLookup(ds_map_find_value(oAtuin.inputInfo,"gp_confirm"))
GpBackDisplay.sprite_index=		inputSpriteLookup(ds_map_find_value(oAtuin.inputInfo,"gp_back"))

ds_list_add(inputBtns,btnKb,KbLeft,KbRight,KbUp,KbDown,KbAim,KbSlash,KbInteract,KbPause,KbConfirm,KbBack,
					  btnGp,GpLeft,GpRight,GpUp,GpDown,GpAim,GpSlash,GpInteract,GpPause,GpConfirm,GpBack,
					  KbLeftDisplay,KbRightDisplay,KbUpDisplay,KbDownDisplay,KbAimDisplay,KbSlashDisplay,KbInteractDisplay,KbPauseDisplay,KbConfirmDisplay,KbBackDisplay,
					  GpLeftDisplay,GpRightDisplay,GpUpDisplay,GpDownDisplay,GpAimDisplay,GpSlashDisplay,GpInteractDisplay,GpPauseDisplay,GpConfirmDisplay,GpBackDisplay)

btnBack =	instance_create_layer(x+200,y+100,"buttons",oButton)

for(i=0; i < ds_list_size(inputBtns);i++)
{
	var inputBtn = ds_list_find_value(inputBtns,i)
	inputBtn.parentMenu = self
}

btnBack.sprite_index = spr_backBtn;
btnBack.parentMenu = self
btnBack.btnId = 13

btnBack.roomTo = rMainMenu;


selectedBtn = 0;
t = 0;

