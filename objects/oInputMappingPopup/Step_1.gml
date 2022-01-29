

//Keyboard remapping buttons

if(KbLeftDisplay.confirmed)
{
	KbLeftDisplay.sprite_index=	spr_kbUnknown
	if((keyboard_check_pressed(vk_anykey) || mouse_check_button_pressed(mb_any)) && !wait)
	{
	if (mouse_check_button_pressed(mb_any)) {
		KbLeftDisplay.sprite_index = inputSpriteLookup(mouse_button)
		ds_map_replace(oAtuin.inputInfo,"kb_left",mouse_button)
	}
	if(keyboard_check_pressed(vk_anykey)) {
		KbLeftDisplay.sprite_index =	inputSpriteLookup(keyboard_key)
		ds_map_replace(oAtuin.inputInfo,"kb_left",keyboard_key)
	}
	KbLeftDisplay.confirmed = false;
	wait = true;
	}
	if(KbLeftDisplay.confirmed) wait = false;
}

if(KbRightDisplay.confirmed)
{
	KbRightDisplay.sprite_index=	spr_kbUnknown
	if((keyboard_check_pressed(vk_anykey) || mouse_check_button_pressed(mb_any)) && !wait)
	{
	if (mouse_check_button_pressed(mb_any)) {
		KbRightDisplay.sprite_index = inputSpriteLookup(mouse_button)
		ds_map_replace(oAtuin.inputInfo,"kb_right",mouse_button)
	}
	if(keyboard_check_pressed(vk_anykey)) {
		KbRightDisplay.sprite_index =	inputSpriteLookup(keyboard_key)
		ds_map_replace(oAtuin.inputInfo,"kb_right",keyboard_key)
	}
	KbRightDisplay.confirmed = false;
	wait = true;
	}
	if(KbRightDisplay.confirmed) wait = false;
}

if(KbUpDisplay.confirmed)
{
	KbUpDisplay.sprite_index=	spr_kbUnknown
	if((keyboard_check_pressed(vk_anykey) || mouse_check_button_pressed(mb_any)) && !wait)
	{
	if (mouse_check_button_pressed(mb_any)) {
		KbUpDisplay.sprite_index = inputSpriteLookup(mouse_button)
		ds_map_replace(oAtuin.inputInfo,"kb_up",mouse_button)
	}
	if(keyboard_check_pressed(vk_anykey)) {
		KbUpDisplay.sprite_index =	inputSpriteLookup(keyboard_key)
		ds_map_replace(oAtuin.inputInfo,"kb_up",keyboard_key)
	}
	KbUpDisplay.confirmed = false;
	wait = true;
	}
	if(KbUpDisplay.confirmed) wait = false;
}

if(KbDownDisplay.confirmed)
{
	KbDownDisplay.sprite_index=	spr_kbUnknown
	if((keyboard_check_pressed(vk_anykey) || mouse_check_button_pressed(mb_any)) && !wait)
	{
	if (mouse_check_button_pressed(mb_any)) {
		KbDownDisplay.sprite_index = inputSpriteLookup(mouse_button)
		ds_map_replace(oAtuin.inputInfo,"kb_down",mouse_button)
	}
	if(keyboard_check_pressed(vk_anykey)) {
		KbDownDisplay.sprite_index =	inputSpriteLookup(keyboard_key)
		ds_map_replace(oAtuin.inputInfo,"kb_down",keyboard_key)
	}
	KbDownDisplay.confirmed = false;
	wait = true;
	}
	if(KbDownDisplay.confirmed) wait = false;
}

if(KbSlashDisplay.confirmed)
{
	KbSlashDisplay.sprite_index=	spr_kbUnknown
	if((keyboard_check_pressed(vk_anykey) || mouse_check_button_pressed(mb_any)) && !wait)
	{
	if (mouse_check_button_pressed(mb_any)) {
		KbSlashDisplay.sprite_index = inputSpriteLookup(mouse_button)
		ds_map_replace(oAtuin.inputInfo,"kb_slash",mouse_button)
	}
	if(keyboard_check_pressed(vk_anykey)) {
		KbSlashDisplay.sprite_index =	inputSpriteLookup(keyboard_key)
		ds_map_replace(oAtuin.inputInfo,"kb_slash",keyboard_key)
	}
	KbSlashDisplay.confirmed = false;
	wait = true;
	}
	if(KbSlashDisplay.confirmed) wait = false;
}

if(KbInteractDisplay.confirmed)
{
	KbInteractDisplay.sprite_index=	spr_kbUnknown
	if((keyboard_check_pressed(vk_anykey) || mouse_check_button_pressed(mb_any)) && !wait)
	{
	if (mouse_check_button_pressed(mb_any)) {
		KbInteractDisplay.sprite_index = inputSpriteLookup(mouse_button)
		ds_map_replace(oAtuin.inputInfo,"kb_interact",mouse_button)
	}
	if(keyboard_check_pressed(vk_anykey)) {
		KbInteractDisplay.sprite_index =	inputSpriteLookup(keyboard_key)
		ds_map_replace(oAtuin.inputInfo,"kb_interact",keyboard_key)
	}
	KbInteractDisplay.confirmed = false;
	wait = true;
	}
	if(KbInteractDisplay.confirmed) wait = false;
}


///////////////////

if(GpLeftDisplay.confirmed)
{
	GpLeftDisplay.sprite_index=	spr_kbUnknown
	if(gamepad_key() != undefined)
	{
	GpLeftDisplay.sprite_index = inputSpriteLookup(gamepad_key)
	GpLeftDisplay.confirmed = false;
	wait = true;
	}
	if(GpLeftDisplay.confirmed) wait = false;
}

if(btnBack.confirmed)
{
	btnBack.confirmed = false;
	room_restart();
}