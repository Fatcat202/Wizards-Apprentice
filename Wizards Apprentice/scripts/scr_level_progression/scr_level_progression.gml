// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_level_progression()
{
	// Master script for level progression. Runs in obj_menu_level_select create
	
	
	// Start the game with level 00 unlocked
	scr_unlock_level(1)
	
	// Quick reference offset. Used with global.level_stats. Intro level is 1
	var offset = global.level_offset;
	
	// Unlock level 10 with order 1 wizard dialogue read
	if(scr_dialogue_read(global.arr_dialogue_wizard, 1))
	{
		scr_unlock_level(2)
	}
	
	// Unlock wizard dialogue order 2 with level 10 complete
	if(global.level_stats[offset+1].level_completed)
	{
		scr_dialogue_unlock(global.arr_dialogue_wizard, 2)
	}
	
	// Unlock level 11 with wizard dialogue order 2 read
	if(scr_dialogue_read(global.arr_dialogue_wizard, 2))
	{
		scr_unlock_level(3)
	}
	
	// Unlock wizard dialogue order 3 with level 11 complete
	if(global.level_stats[offset+2].level_completed)
	{
		scr_dialogue_unlock(global.arr_dialogue_wizard, 3)
	}
}