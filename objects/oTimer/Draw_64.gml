
with(oAtuin){ timertime = victoryTimer();}
if(oAtuin.timerVisible)
{
	draw_set_font(fTimer2)
	draw_set_color(c_white)
	draw_sprite(spr_TimerBg,0,1000,600)
	draw_text(1000,600,oAtuin.timertime);
}