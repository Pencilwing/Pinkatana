image_xscale = lerp(image_xscale,startingScale,0.4)
image_yscale = lerp(image_yscale,startingScale,0.4)

if(active)
{

	if (parentMenu.selectedBtn = btnId && oAtuin.controlScheme == 1)
	{
		selected = true
			if(gamepad_button_check_pressed(oAtuin.currentGamepad,gp_face1))
			{
				confirmed = true;
				playSFX(confirmSFX);
			}else{
				confirmed = false;
			}
	}else{
		selected = false
	}


	if (oAtuin.controlScheme == 0)
	{
		if(position_meeting(mouse_x, mouse_y, id))
		{
			if(!selected) playSFX(selectedSFX);
			selected = true;
			if(mouse_check_button_pressed(mb_left))
			{
				confirmed = true;
				image_xscale = startingScale*smallScale
				image_yscale = startingScale*smallScale
				playSFX(confirmSFX);
			}
		}else{
			selected = false;
			active = true;
		}
	}
}

if (selected && active)
{
	image_index = 1;
	image_xscale = startingScale*bigScale;
	image_yscale = startingScale*bigScale;
	
}else{
	image_index = 0;
}
