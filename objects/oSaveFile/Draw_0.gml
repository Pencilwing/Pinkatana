
draw_set_color(c_black)
draw_set_font(fTimer)

draw_sprite_ext(spr_saveBG,0,x,y,image_xscale,image_yscale,0,c_white,1)
draw_text(x-50,y-85,fileNumber)
draw_text(x-50,y-20,string(filePercent) + "%")
draw_text(x-50,y+0,fileTimeStr)
draw_text(x-50,y+20,fileLocation)
