function draw_text_outlined() {
	//draw_text_outlined(x, y, outlinecolor, stringcolor, string, thickness)  
	///@arg x
	///@arg y
	///@arg outlineColor
	///@arg stringColor
	///@arg string
	///@arg thickness
	var xx,yy;  
	xx = argument[0];  
	yy = argument[1];
	var th = argument[5];
  
	//Outline  
	draw_set_color(argument[2]);  
	draw_text(xx+th, yy+th, argument[4]);  
	draw_text(xx-th, yy-th, argument[4]);  
	draw_text(xx,   yy+th, argument[4]);  
	draw_text(xx+th,   yy, argument[4]);  
	draw_text(xx,   yy-th, argument[4]);  
	draw_text(xx-th,   yy, argument[4]);  
	draw_text(xx-th, yy+th, argument[4]);  
	draw_text(xx+th, yy-th, argument[4]);  
  
	//Text  
	draw_set_color(argument[3]);  
	draw_text(xx, yy, argument[4]);  


}
