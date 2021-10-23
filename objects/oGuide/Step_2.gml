
x = oPlayer.x;
y = oPlayer.y;

if (oAtuin.controlScheme == 1)
{
	if(abs(gamepad_axis_value(oAtuin.currentGamepad,gp_axislh)) > 0.2 
	|| abs(gamepad_axis_value(oAtuin.currentGamepad,gp_axislv))> 0.2)
	{
		visible = true;
	}else{
		visible = false;
	}
}