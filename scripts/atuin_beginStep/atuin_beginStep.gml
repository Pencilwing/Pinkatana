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
				if(is_undefined(oCam))
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
		if(is_undefined(oCam))
		{
			instance_create_layer(oCam.x,oCam.y,"UI",oControlScheme)
		}
	}
	
	if (controlScheme == 1 && mouse_check_button_pressed(mb_left))
	{
		controlScheme = 0;
		if(is_undefined(oCam))
		{
			instance_create_layer(oCam.x,oCam.y,"UI",oControlScheme)
		}
	}
	
	
	if(controlScheme != lastControlScheme)
	{
		controlsEnabled = false;
	}else{
		if(!pause) controlsEnabled = true;
	}
}