// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function playDialog()
{
	oAtuin.pause = true;
	oAtuin.controlsEnabled = false;
	
	//if player presses buttons, advance dialog
	if(oAtuin.playSpeed == 0)
	{
		if(chk == 1)
		{
			chk1new = false;
		}
		
		if(chk == 2)
		{
			chk2new = false;
		}
		
		if(chk == 3)
		{
			chk3new = false;
		}
		
		if(oAtuin.controlScheme == 0)
		{
			if(mouse_check_button_pressed(mb_right)||mouse_check_button_pressed(mb_left))
			{
				 currentLine ++
			}
		}else{
			if(gamepad_button_check_pressed(oAtuin.currentGamepad,gp_face2)||gamepad_button_check_pressed(oAtuin.currentGamepad,gp_face1))
			{
			 currentLine ++
			}
		}
	}
	
	//startDialog
	if(oAtuin.playSpeed != 0)
	{
		oAtuin.playSpeed = 0;
		dBox = instance_create_layer(0,0,"UI",oDialogBox)
		dBox.owner = id;
		dBox.characterSpeaking = characterName;
	}
	

	
	if (currentLine > array_length(CurrentDialog))
	{
		dialogRunning = false;
		currentLine = 1;
		oAtuin.playSpeed = 1;
		oAtuin.pause = false;
		oAtuin.controlsEnabled = true;
		
		instance_destroy(oDialogBox);
	}
	
	//populate with current dialog line
	show_debug_message(CurrentDialog[currentLine-1])
	

}