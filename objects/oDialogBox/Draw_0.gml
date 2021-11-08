/// @description Insert description here
// You can write your code in this editor

draw_sprite(asset_get_index("spr_" + characterSpeaking + "Portrait"),i,camera_get_view_x(view_camera[0]),camera_get_view_y(view_camera[0]));
draw_sprite(spr_dialogBox,i+1,camera_get_view_x(view_camera[0]),camera_get_view_y(view_camera[0]));
draw_set_color($13052E);
draw_set_font(fTimer)
draw_text(camera_get_view_x(view_camera[0])+60,camera_get_view_y(view_camera[0])+250,currentLine);
draw_text(camera_get_view_x(view_camera[0])+60,camera_get_view_y(view_camera[0])+220,characterSpeaking);
