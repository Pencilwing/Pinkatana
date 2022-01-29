/*
if (y != 0 && !endSequence)
{
	y = lerp(y,180,0.1)
}


if (endSequence = true)
{
	y = lerp(y,560,0.1)
	if (y >= 540)
	{
		room_goto(rMainMenu);
	}
}
*/



if(oAtuin.controlScheme=1)
{
	if ((gamepad_button_check_pressed(oAtuin.currentGamepad,gp_padd)) || (oAtuin.LAxDown && !oAtuin.LAxDownHold))
	{
		if (selectedBtn == 6 ) selectedBtn = 0
		
		else if (selectedBtn == 0 ) selectedBtn = 3
		else if (selectedBtn == 1 ) selectedBtn = 4
		else if (selectedBtn == 2 ) selectedBtn = 5
		
		else if (selectedBtn == 3 ) selectedBtn = 6
		else if (selectedBtn == 4 ) selectedBtn = 6
		else if (selectedBtn == 5 ) selectedBtn = 6
				
	}
	if ((gamepad_button_check_pressed(oAtuin.currentGamepad,gp_padu)) || (oAtuin.LAxUp && !oAtuin.LAxUpHold))
	{
		if (selectedBtn == 6 ) selectedBtn = 2
		
		else if (selectedBtn == 0 ) selectedBtn = 6
		else if (selectedBtn == 1 ) selectedBtn = 6
		else if (selectedBtn == 2 ) selectedBtn = 6
		
		else if (selectedBtn == 3 ) selectedBtn = 0
		else if (selectedBtn == 4 ) selectedBtn = 1
		else if (selectedBtn == 5 ) selectedBtn = 2		
	}
	
	if ((gamepad_button_check_pressed(oAtuin.currentGamepad,gp_padr)) || (oAtuin.LAxRight && !oAtuin.LAxRightHold))
	{
		if (selectedBtn == 6 ) selectedBtn = 0
		
		else if (selectedBtn == 0 ) selectedBtn = 1
		else if (selectedBtn == 1 ) selectedBtn = 2
		else if (selectedBtn == 2 ) selectedBtn = 0
		
		else if (selectedBtn == 3 ) selectedBtn = 1
		else if (selectedBtn == 4 ) selectedBtn = 2
		else if (selectedBtn == 5 ) selectedBtn = 0
	}
	if ((gamepad_button_check_pressed(oAtuin.currentGamepad,gp_padl)) || (oAtuin.LAxLeft && !oAtuin.LAxLeftHold))
	{
		if (selectedBtn == 6 ) selectedBtn = 1
		
		else if (selectedBtn == 0 ) selectedBtn = 2
		else if (selectedBtn == 1 ) selectedBtn = 0
		else if (selectedBtn == 2 ) selectedBtn = 1
		
		else if (selectedBtn == 3 ) selectedBtn = 2
		else if (selectedBtn == 4 ) selectedBtn = 0
		else if (selectedBtn == 5 ) selectedBtn = 1
	}
	
	if(selectedBtn >= btnAmount)
	{
		selectedBtn = 0
	}
	
	if(selectedBtn < 0)
	{
		selectedBtn = btnAmount - 1
	}
}

if(btnBack.confirmed || keyboard_check_pressed(vk_escape) || gamepad_button_check_pressed(oAtuin.currentGamepad,gp_face2))
{
	room_goto(rMainMenu)
}


if(btnWipe1.selected)
{
	btnFile1.active = false;
}else{btnFile1.active = true;}

if(btnWipe2.selected)
{
	btnFile2.active = false;
}else{btnFile2.active = true;}

if(btnWipe3.selected)
{
	btnFile3.active = false;
}else{btnFile3.active = true;}


if(btnFile1.confirmed)
{
	oAtuin.currentSave = oAtuin.save1
	if(oAtuin.cutscenesVisible)	room_goto(rIntroStory)
	if(!oAtuin.cutscenesVisible || oAtuin.currentSave[1] != 1)room_goto(rJamLevel)
}

if(btnFile2.confirmed)
{
	oAtuin.currentSave = oAtuin.save2
	if(oAtuin.cutscenesVisible)	room_goto(rIntroStory)
	if(!oAtuin.cutscenesVisible || oAtuin.currentSave[1] != 1)room_goto(rJamLevel)
}

if(btnFile3.confirmed)
{
	oAtuin.currentSave = oAtuin.save3
	if(oAtuin.cutscenesVisible)	room_goto(rIntroStory)
	if(!oAtuin.cutscenesVisible || oAtuin.currentSave[1] != 1)room_goto(rJamLevel)
}

if(btnWipe1.confirmed)
{
	wipeCurrentFile(oAtuin.save1[0])
	btnFile1.filePercent = floor(oAtuin.save1[2]/226)
	btnFile1.fileLocation = oAtuin.save1[4]
	btnFile1.fileTime = oAtuin.save1[5]
}

if(btnWipe2.confirmed)
{
	wipeCurrentFile(oAtuin.save2[0])
	btnFile2.filePercent = floor(oAtuin.save2[2]/226)
	btnFile2.fileLocation = oAtuin.save2[4]
	btnFile2.fileTime = oAtuin.save2[5]
}

if(btnWipe3.confirmed)
{
	wipeCurrentFile(oAtuin.save3[0])
	btnFile3.filePercent = floor(oAtuin.save3[2]/226)
	btnFile3.fileLocation = oAtuin.save3[4]
	btnFile3.fileTime = oAtuin.save3[5]
}