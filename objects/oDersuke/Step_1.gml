lastPosX = x

if (chk == 1)
{
	x = x1
	y = y1
	CurrentDialog = Dialog1
}

if (chk == 2)
{
	x = x2
	y = y2
	CurrentDialog = Dialog2
	
}

if (chk == 3)
{
	x = x3
	y = y3
	CurrentDialog = Dialog3
}

if(lastPosX != x)
{
	sprite_index = spr_dersuke_teleportIn
}

if(sprite_index = spr_dersuke_teleportIn)
{
	t ++
}

if(t>= 12)
{
	t = 0
	sprite_index = spr_dersuke_idle;
}

if(abs(oPlayer.x - x) <=200)
{
	if(!dialogRunning)
	{
		if(chk == 1)
		{
			if(chk1new && !instance_exists(oDialogNotice)) instance_create_layer(x,y-20,"HUD",oDialogNotice)
		}
		
		if(chk == 2)
		{
			if(chk2new && !instance_exists(oDialogNotice)) instance_create_layer(x,y-20,"HUD",oDialogNotice)
		}
		
		if(chk == 3)
		{
			if(chk3new && !instance_exists(oDialogNotice)) instance_create_layer(x,y-20,"HUD",oDialogNotice)
		}
		
	}
	
	if(gamepad_button_check_pressed(oAtuin.currentGamepad,gp_face2))
	{
	 dialogRunning = true;
	}
	if(mouse_check_button_pressed(mb_right))
	{
	 dialogRunning = true;
	}
}else{
	if (instance_exists(oDialogNotice)) instance_destroy(oDialogNotice);
}

if(dialogRunning)
{
	playDialog()
	if (instance_exists(oDialogNotice)) instance_destroy(oDialogNotice);
}