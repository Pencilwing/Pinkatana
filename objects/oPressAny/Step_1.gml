
if(oAtuin.controlScheme = 1)
{
	for (i=gp_face1; i<gp_axisrv; i++)
	{
		if gamepad_button_check(oAtuin.currentGamepad, i)
		{
		any_pressed = 1;
		break;
		}
	}
			

}

if(mouse_check_button_pressed(mb_left))
{
	any_pressed = 1;
}

if(keyboard_check_pressed(vk_anykey))
{
	any_pressed = 1;
}


if (any_pressed)
{
	room_goto_next();
	playSFX(sWoodenClapper)
}