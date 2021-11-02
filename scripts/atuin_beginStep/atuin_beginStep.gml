// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function atuin_beginStep(){
	
	deviceListener();
	
	LAxUpHold = LAxUp;
	LAxDownHold = LAxDown;
	LAxRightHold = LAxRight;
	LAxLeftHold = LAxLeft;
	
	LAxUp = gamepad_axis_value(currentGamepad,gp_axislv) < -0.3
	LAxDown = gamepad_axis_value(currentGamepad,gp_axislv) > 0.3
	LAxRight = gamepad_axis_value(currentGamepad,gp_axislh) > 0.3
	LAxLeft = gamepad_axis_value(currentGamepad,gp_axislh) < -0.3
	
	//timer
	if(room == rEarthTerrain)
	{
		time = current_time;

		if(time == 0)
		{
			startingTime = current_time;
		}
	}
	
	//pause menu
	if(!pause && instance_exists(oCam))
	{
		if (keyboard_check_pressed(vk_escape) || gamepad_button_check_pressed(currentGamepad,gp_start))
		{
			instance_create_layer(oCam.x,oCam.y,"UI",oPauseMenu)
			pause = true;
			controlsEnabled = false;
			playSpeed = 0;
		}
	}
}

function victoryTimer()
{
		{
			//returns time in seconds
			time = floor((current_time - startingTime) /1000)
	
			var hour = time div 3600;
			var minute = (time-(hour*3600)) div 60;
			var second = time - hour*3600 - minute*60;
			
			hour = string(hour)
			minute = string(minute)
			second = string(second)
			
			if(string_length(hour) <= 1) hour = "0" + hour
			if(string_length(minute) <= 1) minute = "0" + minute
			if(string_length(second) <= 1) second = "0" + second
			
			victory = false;
			
			return hour+":"+minute+":"+ second
		}
}



function deviceListener() {

	//set variables
	var lastDeviceCount = deviceCount;
	var lastControlScheme = controlScheme;
	deviceCount = 0;

	//check how many devices are there
	for(i=0; i < 11; i++)
	{
		//if a gamepad is connected, add 1 to devicecount.
		if(gamepad_is_connected(i)) deviceCount++;
	}
	
	
	//set first gamepad as current gamepad
	if(deviceCount > 0)
	{
		for(i=0; i < 11; i++)
		{
			//if a gamepad is connected, set it as current gamepad and break for loop
			if(gamepad_is_connected(i)) 
			{
				currentGamepad = i;
				break;
			}
		}
		
		//if control scheme is set to mouse and the player presses a button on the gamepad
		if(controlScheme = 0)
		{
			any_pressed = 0
			for (i=gp_face1; i<gp_axisrv; i++)
			{
				if gamepad_button_check(currentGamepad, i)
				{
		        any_pressed = 1;
		        break;
		        }
		    }
			
			if (any_pressed)
			{
				controlScheme = 1;
				if(instance_exists(oCam))
				{
					instance_create_layer(oCam.x,oCam.y,"UI",oControlScheme)
				}
			}
		}
	}
	
	//if theres no device change control scheme to mouse automatically
	if (deviceCount == 0 && deviceCount != lastDeviceCount)
	{
		controlScheme = 0;
		if(instance_exists(oCam))
		{
			instance_create_layer(oCam.x,oCam.y,"UI",oControlScheme)
		}
	}
	
	if (controlScheme == 1 && mouse_check_button_pressed(mb_left))
	{
		controlScheme = 0;
		if(instance_exists(oCam))
		{
			instance_create_layer(oCam.x,oCam.y,"UI",oControlScheme)
		}
	}
	
	
	if(controlScheme != lastControlScheme)
	{
		controlsEnabled = false;
	}else{
		if(!pause && instance_exists(oVictoryArea)) controlsEnabled = true;
	}
}