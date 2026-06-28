/// @description On Click


// Confirm player stats
with(obj_study_stats)
{
	
	global.vitality = temp_vit;
	global.dexterity = temp_dex;
	global.intelligence = temp_int;
	global.memory = temp_mem;
	global.charisma = temp_cha;
	
	global.player_level += (global.player_free_level - temp_free_level);
	
	global.player_free_level = temp_free_level;

	
	scr_test()
	
}



// Destroy self and menu
instance_destroy(obj_item_control_menu)
instance_destroy()