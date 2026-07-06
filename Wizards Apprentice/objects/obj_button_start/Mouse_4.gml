/// @description Start Game


with(menu_id)
{
	global.vitality = temp_vit;
	global.dexterity = temp_dex;
	global.intelligence = temp_int;
	global.memory = temp_mem;
	global.charisma = temp_cha;

	if(temp_free_level == 0)
	{
	
		// Send player to starting map
		room_goto(rm_wizard_tower);
	
	
	}
}
