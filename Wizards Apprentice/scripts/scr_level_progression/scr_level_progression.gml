// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_level_progression()
{
	// Master script for level progression. Runs in obj_menu_level_select create
	
	
	// Start the game with level 1 unlocked
	scr_unlock_level(1)
	
	// Quick reference offset
	var offset = global.level_offset;

	// Unlock level 2 with level 1 complete
	if(global.level_stats[offset].level_completed)
	{
		// Start the game with level 1 unlocked
		scr_unlock_level(2)
	}
	
	// Unlock level 3 with level 2 complete
	if(global.level_stats[offset+1].level_completed)
	{
		// Start the game with level 1 unlocked
		scr_unlock_level(3)
	}
}