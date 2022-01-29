// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function inputSpriteLookup(inputCode)
{
	var value = (ds_map_find_value(oAtuin.inputSprites,string(inputCode)))
	if(inputCode == "axisl") return spr_gpAxislh
	if(inputCode == "axisr") return spr_gpAxisrh
	if(inputCode == "mouse") return spr_kbMouse
	if(value == undefined) return spr_kbUnknown
	else return value
}

function gamepad_key()
{
	var device = oAtuin.currentGamepad
	var key; // 1D Array
	var button = undefined;
	
	key[0]=gp_padu;
	key[1]=gp_padd;
	key[2]=gp_padl;
	key[3]=gp_padr;
	key[4]=gp_start;
	key[5]=gp_select;
	key[6]=gp_stickl;
	key[7]=gp_stickr;
	key[8]=gp_shoulderl;
	key[9]=gp_shoulderr;
	key[10]=gp_shoulderlb;
	key[11]=gp_shoulderrb;
	key[12]=gp_face1;
	key[13]=gp_face2;
	key[14]=gp_face3;
	key[15]=gp_face4;
	
	for(i = 0; i < array_length(key); i++)
	{
		if (gamepad_button_check_pressed(device,i)) button = key[i]		
	}
	
	return button;
}