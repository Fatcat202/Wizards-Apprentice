/// @description


scr_save_game(save_file_num)

// Confirm player stats
with(menu_id)
{
	global.vitality = temp_vit;
	global.dexterity = temp_dex;
	global.intelligence = temp_int;
	global.memory = temp_mem;
	global.charisma = temp_cha;
}

scr_transfer_to_room(rm_level_00)